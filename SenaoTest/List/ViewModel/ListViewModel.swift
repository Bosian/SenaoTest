//
//  ListViewModel.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/25.
//

import Foundation
import RxCocoa

final class ListViewModel {
    let cellViewModels: BehaviorRelay<[CellViewModel]> = BehaviorRelay<[CellViewModel]>(value: [])

    private var model: MarketModel? {
        didSet {
            guard let model = model else {
                return
            }
            
            updateCellViewModels(model: model.data)
        }
    }

    
    init() {
        refresh()
    }
    
    private func refresh() {
        Task {
            self.model = try await callMarketTestWebAPI()
        }

//        callMarketTestWebAPI() { result in
//
//            switch result {
//                case .success(let model):
//                    self.model = model
//
//                case .failure(_):
//                    break
//            }
//        }
    }

    /// 搜尋
    func search(martName: String) {
        guard let model = model else {
            return
        }

        let filter = model.data.filter { (data: MarketModel.Data) in

            // 轉小寫包含比對
            return data.martName.lowercased().contains(martName.lowercased())
        }

        // 找不到東西
        guard !filter.isEmpty else {

            // 輸入是空的
            guard !martName.isEmpty else {

                // 顯示全部
                updateCellViewModels(model: model.data)
                return
            }
            
            // 顯示空的
            updateCellViewModels(model: [])

            return
        }
        
        // 顯示 filter 資料
        updateCellViewModels(model: filter)
    }

    private func updateCellViewModels(model: [MarketModel.Data]) {
        let cellViewModels = model.map { (data: MarketModel.Data) in
            return CellViewModel(model: data)
        }
        
        self.cellViewModels.accept(cellViewModels)
    }
}

extension ListViewModel {
    private func callMarketTestWebAPI(completion: @escaping (Result<MarketModel, Error>) -> Void) {
        return MarketWebAPI().invokeAsync(completion: completion)
    }
    
    private func callMarketTestWebAPI() async throws -> MarketModel {
        return try await MarketWebAPI().invokeAsync()
    }
}
