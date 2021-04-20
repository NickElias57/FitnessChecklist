//
//  ContentView.swift
//  FitnessChecklist
//
//  Created by Nick Elias on 4/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        TabView {
           WorkoutView()
             .tabItem {
                Image(systemName: "figure.walk")
                Text("Workouts")
           }
           IntakeView()
             .tabItem {
                Image(systemName: "flame")
                Text("Intake")
          }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct WorkoutView: View {
    var body: some View {
        Text("Workouts")
    }
}
struct IntakeView: View {
    var body: some View {
        Text("Intake")
    }
}
struct Cycle: Identifiable, Codable {
    let id = UUID()
    let days: [Day]
    
}
struct Day: Identifiable {
    let id = UUID()
    let workouts: [Workout]
}
struct Workout: Identifiable {
    let id = UUID()
    let name: String
    let numReps: Int
    let numSets : Int
    let completed: Bool
}
struct Intake: Identifiable {
    let id = UUID()
    let list: [Supp]
}
struct Supp: Identifiable{
    let id = UUID()
    let name: String
    let completed: Bool
}
