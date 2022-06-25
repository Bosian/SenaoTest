//
//  DecodableExtension.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/25.
//

import Foundation

extension Decodable {

    init?(json: String) {

        guard let data = json.data(using: String.Encoding.utf8) else {
            return nil
        }

        let decoder = JSONDecoder()
        do {
            self = try decoder.decode(Self.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }

    init(data: Data?) throws {
        guard let data = data else {
            throw NSError(domain: "data is nil", code: -1)
        }
        
        let decoder = JSONDecoder()
        do {
            self = try decoder.decode(Self.self, from: data)
        } catch {
            print(error)
            throw error
        }
    }
}
