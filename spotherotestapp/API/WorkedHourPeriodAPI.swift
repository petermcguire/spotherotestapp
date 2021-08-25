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
        return request(path).map(\.value).eraseToAnyPublisher()
    }
    
    static func postWorkedHourPeriod(id: Int, workedHourPeriod: PostWorkedHourPeriod) -> AnyPublisher<PostWorkedHourPeriod, Error> {
        let path = String(id) + "/worked_hours"
        return request(path, body: workedHourPeriod, method: "POST").map(\.value).eraseToAnyPublisher()
    }
}

extension WorkedHourPeriodAPI {
    
    static func request<T: Decodable>(_ path: String, body: PostWorkedHourPeriod? = nil, method: String = "GET") -> AnyPublisher<Response<T>, Error> {

        guard let components = URLComponents(url: baseUrl.appendingPathComponent(path), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if method != "GET" {
            let data: Data

            do {
                data = try JSONEncoder().encode(body)
            } catch {
                fatalError("Couldn't encode body data")
            }
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        return apiClient.run(request)
            .eraseToAnyPublisher()
    }
}
