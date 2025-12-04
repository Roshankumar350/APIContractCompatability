//
//  UserViewModel.swift
//  APIContractCompatability
//
//  Created by Roshan Sah on 03/12/25.
//

import Foundation
import Combine

final class UserViewModel<Manager: ResourceManager>: ObservableObject where Manager.T == User {
    @Published var users: [User] = []
    let resourceManager: Manager
    
    init(resourceManager: Manager) {
        self.resourceManager = resourceManager
    }
    
    // For simplicity purpose its sync func as its
    func fetchUsers(for apiContract: APIContractVersion = .v1)  {
        do {
            // Version of API can be set from here,
            // Notice that consumer side has no impact on change of API contract.
            // Try setting `APIContractVersion` to v1 and v2
            users = try resourceManager.fetchUsers(for: apiContract)
        } catch {
            users = []
        }
    }
}

