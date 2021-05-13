//
//  AddDayView.swift
//  FitnessChecklist
//
//  Created by Nick Elias on 4/16/21.
//

import SwiftUI

struct AddDayView: View {
    @ObservedObject var dayList: DayList
    @State private var name = ""
    @State var workouts: [Workout]  = []
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Day Name", text: $name)
            }
            .navigationBarTitle("Add New Day")
            .navigationBarItems(trailing: Button("Save") {
                
                let item = Day(id: UUID(),
                               workouts: workouts, name: name)
                dayList.items.append(item)
                print("done2")
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddDayView_Previews: PreviewProvider {
    static var previews: some View {
        AddDayView(dayList: DayList())
    }
}
