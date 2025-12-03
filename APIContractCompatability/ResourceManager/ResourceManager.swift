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
}

enum APIContractVersion: String {
    case v1
    case v2
}

@MainActor
struct UserResourceManager: @MainActor ResourceManager {
    private init() {}
    static let shared = UserResourceManager()
    
    func fetchUsers(for apiContract: APIContractVersion) throws -> [User] {
        guard let resourceURL = Bundle.main.url(forResource: apiContract.rawValue, withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: resourceURL, options: .alwaysMapped)
            return try decodeUsers(from: data, version: apiContract)
        } catch {
            debugPrint(error)
            throw error
        }
    }
    
    private func decodeUsers(from data: Data, version: APIContractVersion) throws -> [User] {
        switch version {
        case .v1:
            let usersV1 = try JSONDecoder().decode([UserV1].self, from: data)
            return usersV1.map(User.init)
        case .v2:
            let usersV2 = try JSONDecoder().decode([UserV2].self, from: data)
            return usersV2.map(User.init)
        }
    }
}
