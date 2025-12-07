//
//  UserV2.swift
//  APIContractCompatability
//
//  Created by Roshan Sah on 03/12/25.
//

import Foundation

struct UserV2: Identifiable, Decodable {
    let id = UUID()
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case fullName
    }
}
