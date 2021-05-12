//
//  AddSupplementView.swift
//  FitnessChecklist
//
//  Created by Darren Darlington on 4/27/21.
//

import SwiftUI

struct AddSupplementView: View {
    @ObservedObject var supplementList: SupplementList
    @State private var name = ""
    @State private var type = ""
    @State private var dateTaken = Date()
    @Environment(\.presentationMode) var presentationMode
    static let types = ["Recovery", "Performance", "Herbs & Natural", "Muscle Builders", "Fat Burners", "Pre-Workout"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Types", selection: $type) {
                    ForEach(Self.types, id: \.self) { type in
                        Text(type)
                    }
                }
                TextField("Supplement Name", text: $name)
                DatePicker("Date", selection: $dateTaken, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Supplement")
            .navigationBarItems(trailing: Button("Save") {
                if (type.count > 0) {
                    let item = Supplement(id: UUID(),
                                          name: name,
                                          dateCompleted: dateTaken,
                                          type: type)
                    supplementList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddSupplementView_Previews: PreviewProvider {
    static var previews: some View {
        AddSupplementView(supplementList: SupplementList())
    }
}
