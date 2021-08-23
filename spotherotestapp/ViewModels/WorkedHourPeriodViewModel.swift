//
//  WorkedHourPeriodViewModel.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-23.
//

import Foundation
import Combine

class WorkedHourPeriodViewModel: ObservableObject {
    
    @Published var periods: [WorkedHourPeriod] = []
    var cancellationToken: AnyCancellable?
    
    init(id: Int) {
        getPeriods(id: id)
    }
    
}

extension WorkedHourPeriodViewModel {
    
    // Subscriber implementation
    func getPeriods(id: Int) {
        cancellationToken = WorkedHourPeriodAPI.allWorkedHourPeriods(id: id)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.periods = $0
            })
    }
    
    func addPeriod(workedHourPeriod: WorkedHourPeriod) {
        
    }
    
}
