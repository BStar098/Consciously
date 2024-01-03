//
//  SwiftUIView.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 21/10/2023.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""

    var displayName: String {
        viewModel.userSession?.displayName ?? ""
    }

    var userEmail: String {
        viewModel.userSession?.email ?? ""
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack(spacing:16){
                    HStack(alignment:.top, spacing:16) {
                        AsyncImage(url: URL(string: "https://media.istockphoto.com/id/1149504274/es/foto/retrato-de-un-hombre-taiwanés.jpg?s=1024x1024&w=is&k=20&c=n2HdaMK9GbgbkOYwU8OTjYo8ZADvd7CSUDF1uvmwFpE=")) { phase in
                            if let image = phase.image {
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                        }.frame(width:100, height:100)
                            .clipShape(.circle)
                        VStack {
                            Text(displayName)
                                .bold()
                                .font(.title)
                                .foregroundStyle(.white)
                            Text(userEmail)
                                .font(.title3)
                                .foregroundStyle(.white)
                        }.padding(.top)
                        
                        
                    }
                    .padding(25)
                    .background(Color(.init(white:1,alpha:0.18)))
                    .clipShape(.buttonBorder)
                    
                    CustomTextField(value: $name, icon: "person", placeholder: displayName, label: "New name")
                    CustomTextField(value: $email, icon: "envelope", placeholder:userEmail , label: "New E-mail")
                    CustomTextField(value: $password, type:"password", icon: "lock", placeholder: "*******", label: "New password")
                    
                    editButton
                    Spacer()
                    
                    logOutButton
                    Spacer()
                    
                    
                    
                }
                
            }
        }
        .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem { Label ("Me", systemImage: "person") }
            .alert(viewModel.alertMessage,isPresented: $viewModel.showAlert){
                Button("OK", role:.cancel){
                }
                
            }
        
    }
    
    var editButton : some View {
        Button ("EDIT"){
            Task {
                try await viewModel.update(name:name, email:email, password:password)
                
                //try await viewModel.update(name:name, email:email, password: password)
            }
        }
        .frame(width:100,height:33)
        .foregroundStyle(.black)
        .background(Color(.init(white:3, alpha:0.80)))
        .clipShape(.capsule)
    }
    
    var logOutButton : some View {
        Image(systemName: "power").resizable().frame(width:100, height:100, alignment:.center ).foregroundStyle(.red).padding().onTapGesture {
            Task {
               try await self.viewModel.logOut()
            }
        }
    }
}

#Preview {
    ProfileView().environmentObject(AuthViewModel())
}
