//
//  SignUpView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 26/09/2023.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel = AuthViewModel()
    @State var name:String = "";
    @State var surname:String = "";
    @State var email:String = "";
    @State var password:String = "";
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                GeometryReader { geometry in
                    ScrollView {
                        VStack{
                            authLogo
                            authInputs
                            loginButton
                        }.frame(minHeight:geometry.size.height)
                    }
                }
                    .alert(viewModel.signUpErrorMessage ?? "",isPresented: $viewModel.showAlert){
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
            CustomTextField(value: $name, type: "text", icon: "person", placeholder: "John", label: "Name")
            CustomTextField(value: $surname, type: "text", icon: "person", placeholder: "Doe", label: "Surname")
            CustomTextField(value: $email, type: "text", icon: "envelope", placeholder: "johndoe@gmail.com", label: "Email")
            CustomTextField(value: $password, type: "password", icon: "lock", placeholder: "********", label: "Password")
            
        }
    }
    
    var loginButton : some View {
        Button ("SIGN UP"){
            withAnimation {
                viewModel.signUp(email:email, password:password)
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
    SignUpView()
}
