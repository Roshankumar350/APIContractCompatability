//
//  UserV2.swift
//  APIContractCompatability
//
//  Created by Roshan Sah on 03/12/25.
//

import Foundation

struct UserV2: Identifiable, Decodable {
    var id: UUID? = UUID()
    let fullName: String
}
