//
//  CustomTextField.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 22/09/2023.
//

import SwiftUI

struct CustomTextField: View  {
    @Binding var value : String;
    var type : String = ""
    var icon : String = "person"
    var placeholder : String = "Soy un placeholder"
    var label : String = "E-mail"
    var input : some View  {
        ViewThatFits {
            switch type {
            case "text":
                TextField(placeholder, text:$value)
            case "password":
                SecureField(placeholder, text: $value)
            default:
                TextField(placeholder, text:$value)
            }
        }
       
    }
    var body: some View {
       
            VStack(alignment:.leading) {
                VStack(alignment:.leading){
                    Text(label)
                        .fontWeight(.light)
                        .foregroundStyle(Color(.init(white:3,alpha:0.87)))
                    ZStack(alignment:.leading) {
                        if value.isEmpty {
                            Text(placeholder).foregroundStyle(Color(.init(white:3, alpha:0.80)))
                                .padding(.leading, 50)
                                .opacity(0.3)
                        }
                        HStack {
                            Image(systemName: icon)
                                .resizable()
                                .frame(width:20, height:20)
                                .padding(.trailing, 5)
                                .foregroundStyle(Color(.init(white:3,alpha:0.87)))
                                input
                                .foregroundStyle(Color(.init(white:3,alpha:0.87)))
                                .textInputAutocapitalization(.never)
                            
                        }
                            .padding()
                            .background(Color(.init(white:1,alpha:0.18)))
                            .clipShape(.buttonBorder)
                    }
                }.padding(.horizontal)
            }
    }
}


