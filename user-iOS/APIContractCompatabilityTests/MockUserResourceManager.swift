//
//  MockUserResourceManager.swift
//  APIContractCompatabilityTests
//
//  Created by Roshan Sah on 04/12/25.
//

import Foundation
@testable import APIContractCompatability

@MainActor
final class MockUserResourceManager:  @MainActor ResourceManager {
    
    func fetchUsers(for apiContract: APIContractVersion) throws -> [User] {
        
        guard let resourceURL = Bundle(for: type(of: self)).url(forResource: apiContract.rawValue, withExtension: "json") else {
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

