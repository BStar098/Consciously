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
            ZStack{
                Color.black.ignoresSafeArea()
                VStack {
                    RecordCircle(timeOfDay: .MORNING, duration: 3)
                    RecordCircle(timeOfDay: .AFTERNOON, duration: 3)
                    RecordCircle(timeOfDay: .EVENING, duration: 3)
                }
            }
            
        
       
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthViewModel())
}
