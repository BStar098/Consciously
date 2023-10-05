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
                    RecordCircle(text: "MORNING", duration: 3)
                    RecordCircle(text: "AFTERNOON", duration: 5)
                    RecordCircle(text: "NIGHT", duration: 7)
                }
            }
            
        
       
    }
}

#Preview {
    HomeView().environmentObject(AuthViewModel())
}
