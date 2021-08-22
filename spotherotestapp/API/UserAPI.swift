//
//  UserAPI.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-22.
//

import Foundation
import Combine

// 1
enum UserAPI {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "http://localhost:3000/v1/users/")!
}

// 2
enum APIPath: String {
    case allActiveUsers = ""
}

extension UserAPI {
    
    static func request(_ path: APIPath) -> AnyPublisher<[User], Error> {
        // 3
        guard let components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request) // 5
            .map(\.value) // 6
            .eraseToAnyPublisher() // 7
    }
}
