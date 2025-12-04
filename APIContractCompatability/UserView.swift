//
//  ContentView.swift
//  APIContractCompatability
//
//  Created by Roshan Sah on 03/12/25.
//

import SwiftUI

struct UserView: View {
    @StateObject private var userViewModel = UserViewModel(resourceManager: UserResourceManager())
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(userViewModel.users) { user in
                    VStack(alignment: .leading) {
                        Text("First name: \(user.firstName)")
                            .font(.title)
                        Text("Last name: \(user.lastName)")
                            .font(.title)
                    }
                }
            }
            .navigationTitle("Backward Compatable")
            .onAppear {
                userViewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    UserView()
}
