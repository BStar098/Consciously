//
//  HomeView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 01/10/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(viewModel.userSession?.email ?? "")
                Button ("LOG OUT"){
                    Task {
                        try await viewModel.logOut()
                    }
                      
                }
            }
        }
       
    }
}

#Preview {
    HomeView()
}
