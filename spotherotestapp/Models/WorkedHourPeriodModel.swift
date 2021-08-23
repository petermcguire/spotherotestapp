//
//  WorkedHourPeriodModel.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-23.
//

import Foundation

struct WorkedHourPeriod: Codable, Identifiable, Hashable {
    var id: Int
    var date: String
    var hours: String
}
