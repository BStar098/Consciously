//
//  DatesList.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 26/10/2023.
//

import SwiftUI

struct DatesList: View {
    @ObservedObject var viewModel = DatesListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                    ForEach(self.viewModel.datesList, id:\.name){date in
                        NavigationLink(destination:AudiosView(date:date.name)){
                            ListItem(icon:"mic.circle.fill", text:date.name)
                        }
                        
                    }
                Spacer()
            }.navigationTitle("History")


        }.padding(.horizontal)
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem { Label ("History", systemImage: "book") }
            .onAppear {
                self.viewModel.getRecordingsFolders()
            }
                  
    }
}

#Preview {
    DatesList().environmentObject(AuthViewModel())
}
