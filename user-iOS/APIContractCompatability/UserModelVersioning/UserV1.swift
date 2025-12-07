//
//  UserV1.swift
//  APIContractCompatability
//
//  Created by Roshan Sah on 03/12/25.
//

import Foundation

struct UserV1: Identifiable, Decodable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
    }
}
