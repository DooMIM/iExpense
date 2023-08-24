//
//  ContentView.swift
//  iExpense
//
//  Created by doha moustafa on 15/08/2023.
//

import SwiftUI

// Still needs to be solved.. Apply if statement to the text is throwing an error.
struct under10: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.gray)
    }
}

struct under100: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.primary)
    }
}

struct above100: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.red)
    }
}


struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Housing costs"){
                    ForEach(expenses.items.filter {$0.type == "Housing"} ) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            Text(item.amount, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        
                    }
                    .onDelete(perform: removeItems)
                }
                Section("Transportation costs"){
                    ForEach(expenses.items.filter {$0.type == "Transportation"} ) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            Text(item.amount, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        
                    }
                    .onDelete(perform: removeItems)
                }
                Section("Food costs"){
                    ForEach(expenses.items.filter {$0.type == "Food"} ) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            Text(item.amount, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        
                    }
                    .onDelete(perform: removeItems)
                }
                Section("Utilities costs"){
                    ForEach(expenses.items.filter {$0.type == "Utilities"} ) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            Text(item.amount, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        
                    }
                    .onDelete(perform: removeItems)
                }
                Section("Recreation & Entertainment costs"){
                    ForEach(expenses.items.filter {$0.type == "Recreation & Entertainment"} ) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            Text(item.amount, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: expenses)
                }
                EditButton()
            }
        }
        .padding()
    }
  
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
