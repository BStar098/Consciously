//
//  ContentView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 21/09/2023.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @State var email:String = "";
    @State var password:String = "";
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                    VStack {
                            authLogo
                            authInputs
                            loginButton
                            signUpButton
                    }
                    .alert(viewModel.loginMessage,isPresented: $viewModel.showAlert){
                        Button("OK", role:.cancel){
                        }

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
        VStack(spacing:15)
        {
            CustomTextField(value: $email, type: "text", icon: "person", placeholder: "John Doe", label: "Email")
            CustomTextField(value: $password, type: "password", icon: "lock", placeholder: "********", label: "Password")
        }
    }
    
    var loginButton : some View {
        Button ("LOG IN"){
                Task {
                    try await viewModel.logIn(email:email, password:password)
                }
        }
            .frame(width:100,height:33)
            .foregroundStyle(.black)
            .background(Color(.init(white:3, alpha:0.80)))
            .clipShape(.capsule)
            .padding(.vertical)
    }
    
    var signUpButton : some View {
            HStack {
                    Text("Don't have an account?")
                    NavigationLink(destination: SignUpView()){
                    Text("Sign up")
                        .fontWeight(.bold)
                    }
                }
            .foregroundStyle(.white)
    }

    
}

#Preview {
    LoginView().environmentObject(AuthViewModel())
}
