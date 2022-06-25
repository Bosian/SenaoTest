//
//  MarketWebAPI.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/25.
//

import Foundation

struct MarketWebAPI {
    let url = URL(string: "https://m.senao.com.tw/apis2/test/marttest.jsp")!

    func invokeAsync(completion: @escaping (Result<MarketModel, Error>) -> Void) {
        let request = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in

            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                }
                
                do {
                    let model = try MarketModel(data: data)
                    completion(.success(model))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }

    @MainActor
    func invokeAsync () async throws -> MarketModel {
        let request = URLRequest(url: url)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try MarketModel(data: data)
        } catch {
            print(error)
            throw error
        }
    }
}
