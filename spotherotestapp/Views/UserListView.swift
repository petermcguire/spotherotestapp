//
//  UserListView.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-23.
//

import SwiftUI

struct UserListView: View {
    var users: [User]
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    UserRowView(user: user)
                }
            }
            .navigationTitle("Users")
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
//        UserListView()
        Text("hello")
    }
}
