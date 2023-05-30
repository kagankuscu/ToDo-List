//
//  LoginView.swift
//  ToDoList
//
//  Created by Kagan Kuscu on 24.05.23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header View
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, background: .pink)
                
                // Login Form
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .autocapitalization(.none)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                
                // Create Account
                
                VStack {
                    Text("New Around Here")
                    
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 20)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
