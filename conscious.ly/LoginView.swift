//
//  ContentView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 21/09/2023.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @State private var username:String = ""
    @State private var password:String = ""

    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(alignment:.center){
                authLogo.padding(.vertical)
                authInputs
                loginButton.padding(.vertical)
            }
        }
       
    }
    
    
    var authLogo : some View {
        Image("consciously")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding([.horizontal],20)
    }
    var authInputs : some View {
        Group{
            CustomTextField(value: username, type: "text", icon: "person", placeholder: "John Doe", label: "Username")
            CustomTextField(value: password, type: "password", icon: "lock", placeholder: "********", label: "Password")
        }
    }
    
    var loginButton : some View {
        Button ("LOG IN"){}
            .frame(width:100,height:33)
            .foregroundStyle(.black)
            .background(Color(.init(white:3, alpha:0.80)))
            .clipShape(.capsule)


        
        }

    
}

#Preview {
    LoginView()
}
