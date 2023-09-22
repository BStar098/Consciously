//
//  ContentView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 21/09/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var username:String = ""
    @State private var password:String = ""

    var body: some View {
        VStack(alignment:.center){
            authLogo
            authInputs
            loginButton
        }
    }
    
    
    
    
    
    
    var authLogo : some View {
        Image("consciously")
            .resizable()
            .frame(width:115, height:120).padding([.bottom],20)
    }
    var authInputs : some View {
        Group{
            HStack {
                Image(systemName: "person").foregroundStyle(.gray)
                TextField("User name",text:$username).padding(.vertical,5)
            }
            HStack {
                Image(systemName: "lock").foregroundStyle(.gray)
                SecureField("Password",text:$password).padding(.vertical,5)
            }
        }.padding([.leading, .trailing], 30)
    }
    
    var loginButton : some View {
        Button ("SIGN IN"){}
            .buttonStyle(.bordered).foregroundStyle(.black)
        .buttonBorderShape(.capsule)
        
        }

    
}

#Preview {
    ContentView()
}
