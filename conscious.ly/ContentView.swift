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
        
            if viewModel.userSession != nil {
                TabView {
                        RecordingView()
                        ProfileView()
                        DatesList()
                }
            } else {
                LoginView()
            }
    }
}

#Preview {
    ContentView().environmentObject(AuthViewModel())
}
