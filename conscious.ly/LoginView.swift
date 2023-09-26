//
//  ContentView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 21/09/2023.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @ObservedObject var viewModel = AuthViewModel()
    @State var email:String = "";
    @State var password:String = "";
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(alignment:.center){
                authLogo
                authInputs
                loginButton
            }.alert(viewModel.errorMessage ?? "",isPresented: $viewModel.showAlert){
                Button("OK", role:.cancel){
                    
                }
            }
        }
       
    }
    
    
    var authLogo : some View {
        Image("consciously")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding([.horizontal],20)
            .padding(.vertical)
    }
    var authInputs : some View {
        VStack
        {
            CustomTextField(value: $email, type: "text", icon: "person", placeholder: "John Doe", label: "Email")
            CustomTextField(value: $password, type: "password", icon: "lock", placeholder: "********", label: "Password")
        }
    }
    
    var loginButton : some View {
        Button ("LOG IN"){
            withAnimation {
                viewModel.logIn(email:email, password:password)
            }
        }
            .frame(width:100,height:33)
            .foregroundStyle(.black)
            .background(Color(.init(white:3, alpha:0.80)))
            .clipShape(.capsule)
            .padding(.vertical)
    }

    
}

#Preview {
    LoginView()
}
