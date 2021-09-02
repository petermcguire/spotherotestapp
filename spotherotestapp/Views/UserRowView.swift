//
//  UserRowView.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-23.
//

import SwiftUI

struct UserRowView: View {
    var user: User
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(user.first_name) // 3a
                    .font(.headline)
                Text(user.email) // 3b
                    .font(.subheadline)
            }
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
//        UserRowView()
        Text("Hello")
    }
}
