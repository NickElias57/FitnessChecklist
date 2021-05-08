//
//  AddWorkoutView.swift
//  FitnessChecklist
//
//  Created by Nick Elias on 5/7/21.
//



import SwiftUI

struct AddWorkoutView: View {
    @ObservedObject var workoutList: WorkoutList
   
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
                        workoutList.items.append(item)
                    
                        presentationMode.wrappedValue.dismiss()
                    
                })
        }
    }
}







struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutView(workoutList: WorkoutList())
    }
}

