//
//  AudiosView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 07/12/2023.
//

import SwiftUI

struct AudiosView: View {
    @ObservedObject var viewModel = DatesListViewModel()
    var date : String
    var body: some View {
        NavigationStack {
            ScrollView {
                    ForEach(self.viewModel.audiosList, id:\.name){audio in
                        PlayingCircle(file:audio, day:audio.name )
                    }
                Spacer()
            }.navigationTitle(self.date)
        }.padding(.horizontal)
            .onAppear {
            self.viewModel.getAudios(date: date)
        }
    }
}

#Preview {
    AudiosView(date:"07/12/2023")
}
