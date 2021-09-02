//
//  UserListView.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-23.
//

import SwiftUI

// prevent NavigationLink from loading all views in list until they are selected
struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

struct UserListView: View {
    var users: [User]
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: NavigationLazyView(UserDetailView(user: user))) {
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
