//
//  ExpenseItem.swift
//  iExpense
//
//  Created by doha moustafa on 15/08/2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}


//We’re going to leverage four important technologies to help us save and load data in a clean way:

// The Codable protocol, which will allow us to archive all the existing expense items ready to be stored.
// UserDefaults, which will let us save and load that archived data.
// A custom initializer for the Expenses class, so that when we make an instance of it we load any saved data from UserDefaults
// A didSet property observer on the items property of Expenses, so that whenever an item gets added or removed we’ll write out changes.
