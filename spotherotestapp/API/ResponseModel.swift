//
//  ResponseModel.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-23.
//

import Foundation

struct Response<T> {
    let value: T
    let response: URLResponse
}

