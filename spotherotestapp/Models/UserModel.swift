//
//  UserModel.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-22.
//

import Foundation

struct User: Codable, Identifiable {
    var id: Int
    var first_name: String
    var last_name: String
    var email: String
}
