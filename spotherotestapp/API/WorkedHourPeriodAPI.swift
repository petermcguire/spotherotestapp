//
//  WorkedHourPeriodAPI.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-23.
//

import Foundation
import Combine


enum WorkedHourPeriodAPI {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "http://localhost:3000/v1/users/")!
}

extension WorkedHourPeriodAPI {
    static func allWorkedHourPeriods(id: Int) -> AnyPublisher<[WorkedHourPeriod], Error> {
        let path = String(id) + "/worked_hours"
        return request(path)
    }
}

extension WorkedHourPeriodAPI {
    
    static func request(_ path: String) -> AnyPublisher<[WorkedHourPeriod], Error> {

        guard let components = URLComponents(url: baseUrl.appendingPathComponent(path), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
