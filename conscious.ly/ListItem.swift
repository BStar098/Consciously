//
//  SwiftUIView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 28/10/2023.
//

import SwiftUI

struct ListItem: View {
    var icon : String = ""
    var text : String = ""
    var body: some View {
            HStack(spacing:10) {
                Image(systemName:icon).resizable().frame(width:30, height:30)
                Text(text.description).bold()
            }
            .foregroundStyle(.white)
            .frame(maxWidth:.infinity, alignment: .leading)
            .padding()
            .background(Color.black)
            .clipShape(.capsule)
    }
}

#Preview {
    ListItem()
}
