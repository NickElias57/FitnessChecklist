//
//  WorkoutTask.swift
//  FitnessChecklist
//
//  Created by Nick Elias on 4/16/21.
//

import Foundation
class AssignmentTask: ObservableObject {
    @Published var items: [Cycle] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Cycle].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}

