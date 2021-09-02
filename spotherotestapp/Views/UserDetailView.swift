//
//  UserDetailView.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-23.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        VStack {
            WorkedHourPeriodListView(id: user.id)
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User(id: -1, first_name: "Jane", last_name: "Smith", email: "jane.smith@email.com"))
    }
}
