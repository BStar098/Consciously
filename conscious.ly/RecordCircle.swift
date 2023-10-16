//
//  SwiftUIView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 04/10/2023.
//

import SwiftUI

struct RecordCircle: View {
    @EnvironmentObject var recordingViewModel : RecorderViewModel;
    @State var isAnimating : Bool = false
    @State var textColor : Color = .black;
    @State var backgroundColor : Color = .white;
    let timeOfDay : TimeOfDay;
    let duration : CGFloat;
    var body: some View {
        ZStack{
            Circle()
                .foregroundStyle(backgroundColor)
            Text(timeOfDay.rawValue)
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
        .onTapGesture {
            if recordingViewModel.isRecording {
                recordingViewModel.stopRecording(timeOfDay: timeOfDay)
            } else {
                recordingViewModel.startRecording(timeOfDay: timeOfDay)
            }
        }
    }
    
    
    
}


#Preview {
    RecordCircle(timeOfDay:.AFTERNOON,duration:2)
        .environmentObject(RecorderViewModel())
}
