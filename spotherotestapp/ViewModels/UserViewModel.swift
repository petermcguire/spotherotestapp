//
//  UserViewModel.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-22.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = [] // 1
    var cancellationToken: AnyCancellable? // 2
    
    init() {
        getUsers() // 3
    }
    
}

extension UserViewModel {
    
    // Subscriber implementation
    func getUsers() {
        cancellationToken = UserAPI.request(.allActiveUsers ) // 4
            .mapError({ (error) -> Error in // 5
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, // 6
                  receiveValue: {
                    self.users = $0 // 7
            })
    }
    
}
