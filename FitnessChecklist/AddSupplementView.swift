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
    @State private var dateTaken = Date()
    @Environment(\.presentationMode) var presentationMode
    static let names = ["Creatine, Whey, Preworkout, BCAAs"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Name", selection: $name) {
                    ForEach(Self.names, id: \.self) { name in
                        Text(name)
                    }
                }
                DatePicker("Date", selection: $dateTaken, displayedComponents: .date)
            }
            navigationBarTitle("Add New Supplement")
                .navigationBarItems(trailing: Button("Save") {
                    if name.count > 0 {
                        let item = SupplementItem(id: UUID(),
                                                  name: name,
                                                  dateTaken: dateTaken)
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
