//
//  SwiftUIView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 04/10/2023.
//

import SwiftUI

struct RecordCircle: View {
    @State var isAnimating : Bool = false
    @State var textColor : Color = .black;
    @State var backgroundColor : Color = .white;
    let text : String;
    let duration : CGFloat;
    var body: some View {
            ZStack{
                Circle()
                    .foregroundStyle(backgroundColor)
                    

                    
            Text(text)
                .foregroundStyle(textColor)
                .font(.title)
                .fontWidth(.expanded)
                .fontWeight(.semibold)
                }
                .scaleEffect(isAnimating ? 0.8 : 1)
                .animation(
                    .easeInOut(duration:duration)
                    .repeatForever(),value:self.isAnimating)
                .onAppear{
                        self.isAnimating = true
                }
                
        
                
    }
}

#Preview {
    RecordCircle(text:"Afternoon",duration:2)
}
