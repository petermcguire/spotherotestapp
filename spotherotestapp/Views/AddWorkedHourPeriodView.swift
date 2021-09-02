//
//  AddWorkedHourPeriodView.swift
//  spotherotestapp
//
//  Created by Peter McGuire on 2021-08-23.
//

import SwiftUI

struct DateToString {
    let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    func format(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}

struct AddWorkedHourPeriodView: View {
    @Binding var showSheetView: Bool
    @EnvironmentObject var workedHourPeriodViewModel: WorkedHourPeriodViewModel
    @State private var periodDate = Date()
    @State private var periodDurationHours = 0
    @State private var periodDurationMinutes = 0

    var id: Int
    
    let hours = Array(0...23)
    let minutes = Array(stride(from: 0, to: 60, by: 15))
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Date")
                DatePicker("", selection: $periodDate, displayedComponents: [.date])
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                HStack() {
                    VStack {
                        Text("Hours")
                        Picker(selection: $periodDurationHours, label: Text(""), content: {
                            ForEach(hours, id: \.self, content: { hour in
                                Text("\(hour)")
                            })
                        })
                        .labelsHidden()
                        .frame(minWidth: 0)
                        .clipped()
                    }
                    VStack {
                        Text("Minutes")
                        Picker(selection: $periodDurationMinutes, label: Text(""), content: {
                            ForEach(minutes, id: \.self, content: { minute in
                                Text("\(minute)")
                            })
                        })
                        .labelsHidden()
                        .frame(minWidth: 0)
                        .clipped()
                    }
                }
                Text("Date: \(DateToString().format(date: periodDate))")
                Text("Period: \(periodDurationHours) hours and \(periodDurationMinutes) minutes")
                Spacer()
            }
            .padding()
            .frame(alignment: .top)
            .navigationBarTitle(Text("Add Worked Time"), displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.showSheetView = false
                    }) {
                        Text("Cancel")
                    },
                trailing: Button(action: {
                    self.onAdd()
                    self.showSheetView = false
                    }) {
                        Text("Save")
                    }
            )
        }
    }
    
    func onAdd() {
        let dateString = DateToString().format(date: periodDate)
        let period = Double(periodDurationHours) + Double(periodDurationMinutes)/60.0
        let workedHourPeriod = PostWorkedHourPeriod(date: dateString, hours: period)
        self.workedHourPeriodViewModel.addPeriod(
            id: self.id,
            workedHourPeriod: workedHourPeriod
        )
    }
}

struct AddWorkedHourPeriodView_Previews: PreviewProvider {
    static var previews: some View {
//        AddWorkedHourPeriodView()
        Text("hi")
    }
}
