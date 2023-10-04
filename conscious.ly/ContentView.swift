//
//  ContentView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 01/10/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : AuthViewModel;
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                HomeView().transition(.slide)
            } else {
                LoginView().transition(.slide)
            }
        }.animation(.bouncy, value:viewModel.userSession)
        
    }
}

#Preview {
    ContentView()
}
