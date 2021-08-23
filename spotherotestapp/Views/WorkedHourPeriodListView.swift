//
//  WorkedHourPeriodListView.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-23.
//

import SwiftUI


struct WorkedHourPeriodListView: View {
    var id: Int
    @ObservedObject var workedHourPeriodViewModel: WorkedHourPeriodViewModel
    
    // specify init so we can use passed id to make view model
    init(id: Int) {
        self.id = id
        self.workedHourPeriodViewModel = WorkedHourPeriodViewModel(id: self.id)
    }
    
    var body: some View {
        NavigationView {
            List(workedHourPeriodViewModel.periods, id: \.self) { period in
                Text(period.date + ": " + period.hours + " hours")
            }
        }
        .navigationBarItems(trailing: Button(action: onAdd) { Image(systemName: "plus") })
    }
    
    func onAdd() {
        
    }
}

struct WorkedHourPeriodListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkedHourPeriodListView(id: 1)
//        Text("hello")
    }
}
