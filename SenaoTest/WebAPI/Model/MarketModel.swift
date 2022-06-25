//
//  MarketModel.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/24.
//

import Foundation

struct MarketModel: Decodable {
    let data: [Data]
}

extension MarketModel {
    struct Data: Decodable {
        
        /// e.g. 39950,
        let price: Int
        
        /// e.g. "iPhone 12 Pro Max 256GB",
        let martShortName: String
        
        /// e.g. "https://pdinfo.senao.com.tw/octopus/contents/99b404a6bcfb4a74a27e4a10746fb258.jpg",
        let imageUrl: String
        
        /// e.g. 39950,
        let finalPrice: Int
        
        /// e.g. "iPhone 12 Pro Max 256GB【下殺97折 送保護貼兌換券】",
        let martName: String
        
        /// e.g. 30,
        let stockAvailable: Int
        
        /// e.g. 1250797,
        let martId: Int
    }
}

extension MarketModel.Data {
    var formatedPrice: String {

        let number = NSNumber(integerLiteral: finalPrice)
        let price = numberFormatter.string(from: number) ?? ""

        return "$\(price)"
    }
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = "."
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0

        return formatter
    }

}

