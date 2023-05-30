//
//  ProfileView.swift
//  ToDoList
//
//  Created by Kagan Kuscu on 24.05.23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                }else {
                    Text("Loading Profile...")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        
        Button("Log Out") {
            viewModel.logOut()
        }
        .foregroundColor(.red)
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
