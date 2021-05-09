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
    @ObservedObject var dayList = DayList()
    
    @State private var showingAddDayView = false
    @State var showingAddWorkoutView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(dayList.items) {
                    
                    item in
                    
                    
                NavigationLink(
                    destination: VStack {
                        
                        NavigationView {
                            
                            List {
                                ForEach(item.workouts) { workoutt in
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading) {

                                            Text(workoutt.name)
                                        }
                                        Spacer()
                                        
                                    }
                                }
                                
                                
                            }
                            .sheet(isPresented: $showingAddWorkoutView, content: {
                                AddWorkoutView(day: item)
                            })
                            .navigationBarTitle("Workout List")
                            .navigationBarItems(leading: EditButton(),
                                                trailing: Button(action: {
                                                                    showingAddWorkoutView = true}) {
                                                    Image(systemName: "plus")
                                                })
                        }
                   },
                    label: {
                        HStack {
                            Text(item.name)
                            
                        }
                    })
                }}
                .sheet(isPresented: $showingAddDayView, content: {
                    AddDayView(dayList: dayList)
                })
            .navigationTitle("Split List")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                                    showingAddDayView = true}) {
                                    Image(systemName: "plus")
                                })
        }
    }
}
struct IntakeView: View {
    @ObservedObject var supplementList = SupplementList()
    @State private var showingAddSupplementView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(supplementList.items) { item in
                    HStack {
                        
                        VStack(alignment: .leading) {
                            Text(item.type)
                                .font(.headline)
                            Text(item.name)
                            
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
                AddSupplementView(supplementList: supplementList)
            })
            .navigationBarTitle("Supplement List")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                                    showingAddSupplementView = true}) {
                                    Image(systemName: "plus")
                                })
        }
    }
}



struct Day: Identifiable, Codable {
    var id = UUID()
    var workouts : [Workout]
    var name: String
}
 
struct Workout: Identifiable, Codable {
    var id = UUID()
    var name: String
    var  numReps:String
    var numSets : String
   
}


struct Supplement: Identifiable, Codable{
    var id = UUID()
    var name = String()
    var dateCompleted = Date()
    var type = String()
}
