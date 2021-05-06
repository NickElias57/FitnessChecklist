//
//  SupplementList.swift
//  FitnessChecklist
//
//  Created by Darren Darlington on 4/27/21.
//

import Foundation
class SupplementList: ObservableObject {
    @Published var items : [Supplement] {
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
            if let decoded = try? decoder.decode([Supplement].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}
