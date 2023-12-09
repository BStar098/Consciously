//
//  HomeView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 01/10/2023.
//

import SwiftUI

struct RecordingView: View {
    var body: some View {
            ZStack{
                Color.black.ignoresSafeArea()
                VStack {
                    RecordCircle(timeOfDay: .MORNING)
                    RecordCircle(timeOfDay: .AFTERNOON)
                    RecordCircle(timeOfDay: .EVENING)
                }.padding()
            }
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem {Label ("Here", systemImage: "swirl.circle.righthalf.filled")  }
    }
}

#Preview {
    RecordingView()
        .environmentObject(AuthViewModel())
}
