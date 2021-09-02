//
//  WorkedHourPeriodListView.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-23.
//

import SwiftUI


struct WorkedHourPeriodListView: View {
    @State var showSheetView = false
    @ObservedObject var workedHourPeriodViewModel: WorkedHourPeriodViewModel
    @State private var periodDate = Date()
    @State private var periodDurationHours = 0
    @State private var periodDurationMinutes = 0
    let hours = Array(0...23)
    let minutes = stride(from: 0, to: 60, by: 15)
    var id: Int

    
    // specify init so we can use passed id to make view model
    init(id: Int) {
        self.id = id
        self.workedHourPeriodViewModel = WorkedHourPeriodViewModel(id: self.id)
    }
    
    var body: some View {
        VStack {
            List(workedHourPeriodViewModel.periods, id: \.self) { period in
                Text(period.date + ": " + period.hours + " hours")
            }
            Spacer()
        }
        .navigationBarTitle(Text("Hours"), displayMode: .inline)
        .navigationBarItems(trailing:
            Button( action: { showSheetView.toggle() } ) {
                Image(systemName: "plus")
            }
        ).sheet(isPresented: $showSheetView) {
            AddWorkedHourPeriodView(showSheetView: self.$showSheetView, id: self.id)
                .environmentObject(self.workedHourPeriodViewModel)
        }
    }
}

struct WorkedHourPeriodListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkedHourPeriodListView(id: 1)
    }
}
