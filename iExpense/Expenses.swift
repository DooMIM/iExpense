//
//  Expenses.swift
//  iExpense
//
//  Created by doha moustafa on 15/08/2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(items) {
                Foundation.UserDefaults.standard.set(data, forKey: "Items")
            }
        }
    }
    //Attempt to read from user defaults
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
