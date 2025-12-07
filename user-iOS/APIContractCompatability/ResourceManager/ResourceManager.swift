//
//  ResourceManager.swift
//  APIContractCompatability
//
//  Created by Roshan Sah on 03/12/25.
//

import Foundation

protocol ResourceManager {
    associatedtype T: Decodable
    func fetchUsers(for apiContract: APIContractVersion) throws -> [T]
    func fetchAsyncUsers(for apiContract: APIContractVersion) async throws -> [T]
}

extension ResourceManager {
    func fetchAsyncUsers(for apiContract: APIContractVersion) async throws -> [T] {
        throw NSError(domain: "Not implemented", code: 0, userInfo: nil)
    }
}

enum APIContractVersion: String {
    case v1
    case v2
}
