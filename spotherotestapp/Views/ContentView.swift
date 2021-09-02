//
//  ContentView.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = UserViewModel()
    var body: some View {
        UserListView(users: viewModel.users)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
