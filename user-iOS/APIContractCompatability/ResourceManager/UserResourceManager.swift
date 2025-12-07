//
//  UserResourceManager.swift
//  APIContractCompatability
//
//  Created by Roshan Sah on 07/12/25.
//

import Foundation

@MainActor
struct UserResourceManager: @MainActor ResourceManager {
    
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
    
    func fetchAsyncUsers(for apiContract: APIContractVersion) async throws -> [User] {
        guard let url = URL(string: "http://localhost:3000/\(apiContract.rawValue)/users") else {
            return []
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
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
