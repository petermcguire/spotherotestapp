//
//  UserAPI.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-22.
//

import Foundation
import Combine


enum UserAPI {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "http://localhost:3000/v1/users/")!
}

extension UserAPI {
    static func allActiveUsers() -> AnyPublisher<[User], Error> {
        let path = ""
        return request(path)
    }
}

extension UserAPI {
    
    static func request(_ path: String) -> AnyPublisher<[User], Error> {

        guard let components = URLComponents(url: baseUrl.appendingPathComponent(path), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
