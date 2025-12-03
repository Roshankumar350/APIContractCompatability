//
//  ContentView.swift
//  APIContractCompatability
//
//  Created by Roshan Sah on 03/12/25.
//

import SwiftUI

struct UserView: View {
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(userViewModel.users) { user in
                    VStack(alignment: .leading) {
                        Text("User first name: \(user.firstName)")
                            .font(.title)
                        Text("User last name: \(user.lastName)")
                            .font(.title)
                    }
                }
            }
            .navigationTitle("Backward Compatable")
        }
    }
}

#Preview {
    UserView()
}
