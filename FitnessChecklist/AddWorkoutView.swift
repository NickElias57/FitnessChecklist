//
//  AddWorkoutView.swift
//  FitnessChecklist
//
//  Created by Nick Elias on 5/7/21.
//



import SwiftUI

struct AddWorkoutView: View {
    @ObservedObject var dayList: DayList
    @State private var name = ""
    @State private var dayNum = 0
    @State private var numReps = ""
    @State private var numSets = ""
    @State private var workoutempty : [Workout] = []
    @State var namee = ""
    @State private var day : Day = Day(id: UUID(), workouts: [], name: "")
    @Environment(\.presentationMode) var presentationMode
   
    
    var body: some View {
       
        NavigationView {
            
            Form {
                
                TextField("Workout Name", text: $name)
                TextField("Num Reps", text: $numReps)
                TextField("Num Sets", text: $numSets)
               
                Picker("Day", selection: $day ) {
                    ForEach(dayList.items, id: \.self) { spec in
                        Text(spec.name)
                        
                    }
                
                }
            }
            .navigationBarTitle("Add New Day")
            .navigationBarItems(trailing: Button("Save") {
                
                let item = Workout(id: UUID(), name: name, numReps: numReps, numSets:numSets)
                
                var array: [Day] = []
                for days in dayList.items {
                    array.append(days)
                }
                
                for item in dayList.items {
                    let index = array.firstIndex(of: item)
                    if item.name == day.name {
                        dayNum = index ?? 0
                    }
                    
                }
                dayList.items[dayNum].workouts.append(item)
                print("done")
                presentationMode.wrappedValue.dismiss()
                
            })
        }
    }
}

struct AddWorkoutViewPreviews: PreviewProvider {
    static var previews: some View {
        AddWorkoutView(dayList: DayList())
    }
}








