//
//  ContentView.swift
//  FitnessChecklist
//
//  Created by Nick Elias on 4/6/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var supplmentList = SupplementList()
    @State private var showingAddSupplementView = false
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
    @ObservedObject var supplmentList = SupplementList()
    @State private var showingAddSupplementView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(supplementList.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dateCompleted, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    supplementList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    supplementList.items.remove(atOffsets: indexSet)
                })
            }
            .sheet(isPresented: $showingAddSupplementView, content: {
                AddSupplementView(assignmentList: supplementList)
            })
            .navigationBarTitle("Supplement List")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                                    showingAddAssignmentView = true}) {
                                    Image(systemName: "plus")
                                })
        }
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
struct Supplement: Identifiable, Codable{
    var id = UUID()
    var name = String()
    var dateCompleted = Date()
}
