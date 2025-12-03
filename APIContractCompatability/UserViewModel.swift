//
//  UserViewModel.swift
//  APIContractCompatability
//
//  Created by Roshan Sah on 03/12/25.
//

import Foundation
import Combine

final class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers()  {
        do {
            // Version of API can be set from here,
            // Notice that consumer side has no impact on change of API contract.
            // Try setting `APIContractVersion` to v1 and v2
            users = try UserResourceManager.shared.fetchUsers(for: .v2)
        } catch {
            users = []
        }
    }
}
