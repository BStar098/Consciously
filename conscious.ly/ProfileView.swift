//
//  SwiftUIView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 21/10/2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Text("My profile")
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem { Label ("Me", systemImage: "person") }
    }
}

#Preview {
    ProfileView()
}
