//
//  AddView.swift
//  iExpense
//
//  Created by doha moustafa on 15/08/2023.
//

import SwiftUI

struct AddView: View {
    @Environment (\.dismiss) var dismiss
    
    @ObservedObject var expenses : Expenses
    
    @State private var name = ""
    @State private var type = ""
    @State private var amount = 0.0
    
  
    
    let types = ["Housing", "Transportation", "Food", "Utilities", "Recreation & Entertainment"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {

                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                 
                }
                Button("Dismiss") {
                    dismiss()
                }
            }
            
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
