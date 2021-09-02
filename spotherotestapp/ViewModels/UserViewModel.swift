//
//  UserViewModel.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-22.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    var cancellationToken: AnyCancellable?
    
    init() {
        getUsers()
    }
    
}

extension UserViewModel {
    
    // Subscriber implementation
    func getUsers() {
        cancellationToken = UserAPI.allActiveUsers()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.users = $0
            })
    }
    
}
