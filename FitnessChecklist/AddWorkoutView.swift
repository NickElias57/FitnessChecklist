//
//  AddWorkoutView.swift
//  FitnessChecklist
//
//  Created by Nick Elias on 5/7/21.
//



import SwiftUI

struct AddWorkoutView: View {
    @State var day : Day
    @State private var name = ""
    @State private var numReps = ""
    @State private var numSets = ""
    @Environment(\.presentationMode) var presentationMode
 
    var body: some View {
        NavigationView {
            Form {
                
                TextField("Workout Name", text: $name)
                TextField("Num Reps", text: $numReps)
                TextField("Num Sets", text: $numSets)
            }
                .navigationBarTitle("Add New Day")
                .navigationBarItems(trailing: Button("Save") {
                    
                        let item = Workout(id: UUID(),
                                           name: name, numReps: numReps, numSets:numSets)
                        
                    day.workouts.append(item)
                    print("done")
                        presentationMode.wrappedValue.dismiss()
                    
                })
        }
    }
}









