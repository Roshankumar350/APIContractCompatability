//
//  User.swift
//  APIContractCompatability
//
//  Created by Roshan Sah on 03/12/25.
//

import Foundation

struct User: Identifiable, Decodable {
    var id = UUID()
    let firstName: String
    let lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

extension User {
    init(from v1: UserV1) {
        self.firstName = v1.firstName
        self.lastName = v1.lastName
    }
    
    init(from v2: UserV2) {
        let parts = v2.fullName.components(separatedBy: " ")
        self.firstName = parts.first ?? ""
        self.lastName = parts.dropFirst().joined(separator: " ")
    }
}

extension User: CustomDebugStringConvertible {
    var debugDescription: String {
            """
            
            (firstName: \(firstName), lastName: \(lastName))
            
            """
    }
}

