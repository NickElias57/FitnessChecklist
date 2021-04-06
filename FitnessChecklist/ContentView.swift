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
