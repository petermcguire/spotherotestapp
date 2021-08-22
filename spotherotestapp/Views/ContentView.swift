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
        List(viewModel.users) { user in // 2
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
