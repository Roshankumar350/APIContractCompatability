//
//  UserV1.swift
//  APIContractCompatability
//
//  Created by Roshan Sah on 03/12/25.
//

import Foundation

struct UserV1: Identifiable, Decodable {
    var id: UUID? = UUID()
    var firstName: String
    var lastName: String
}
