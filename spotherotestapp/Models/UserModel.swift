//
//  UserModel.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-22.
//

import Foundation

struct User: Codable, Identifiable {
    var id: Int
    let first_name: String
    let last_name: String
    let email: String
}
