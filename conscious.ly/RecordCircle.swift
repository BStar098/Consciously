//
//  SwiftUIView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 04/10/2023.
//

import SwiftUI

struct RecordCircle: View {
    @EnvironmentObject var recordingViewModel : RecorderViewModel;
    @State var isRecording : Bool = false
    var textColor : Color {
        self.isRecording && recordingViewModel.isRecording ? .white : .black
    }
    var backgroundColor : Color {
        self.isRecording ? .red : .white;
    }
    let timeOfDay : TimeOfDay;
    let duration : CGFloat;
    
    var body: some View {
        Button {
            if recordingViewModel.isRecording && self.isRecording {
                recordingViewModel.stopRecording(timeOfDay: timeOfDay)
                self.isRecording = false
            } else if !recordingViewModel.isRecording {
                recordingViewModel.startRecording(timeOfDay: timeOfDay)
                self.isRecording = true
            }
        } label: {
            ZStack{
                    Circle()
                    .foregroundStyle(backgroundColor)
                Text(isRecording ? "RECORDING" : timeOfDay.rawValue)
                    .foregroundStyle(textColor)
                    .font(.title)
                    .fontWidth(.expanded)
                    .fontWeight(.semibold)
            }
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

struct ScaleButtonStyle : ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}


#Preview {
    RecordCircle(timeOfDay:.AFTERNOON,duration:2)
        .environmentObject(RecorderViewModel())
}
