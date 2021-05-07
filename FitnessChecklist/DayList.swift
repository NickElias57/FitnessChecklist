//
//  DayList.swift
//  FitnessChecklist
//
//  Created by Nick Elias on 5/7/21.
//

import Foundation
class DayList: ObservableObject {
    @Published var items : [Day] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Data")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Day].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}
