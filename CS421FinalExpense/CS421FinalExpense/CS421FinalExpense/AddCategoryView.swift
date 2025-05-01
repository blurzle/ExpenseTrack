//
//  AddCategoryView.swift
//  CS421FinalExpense
//
//  Created by Student on 4/24/25.
//

import SwiftUI

struct AddCategoryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var amount: String = ""
    
    var isFormValid: Bool {
        !name.isEmpty && !amount.isEmpty && amount.isNumberic && amount.isGreaterThan(0)
    }
    
    private func saveCategories() {
        let categories = Categories(context: viewContext)
        categories.name = name
        categories.amount = Double(amount)!
        
        do {
            try viewContext.save()
            dismiss()
        } catch {
            print(error)
        }
    }
    var body: some View {
        NavigationStack{
            Form {
                TextField("Title", text: $name)
                TextField("Amount", text: $amount).keyboardType(.decimalPad)
            }.toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save"){
                        if isFormValid{
                            saveCategories()
                        }
                    }.disabled(!isFormValid)
                }
            }
        }
    }
}
    #Preview {
        NavigationStack{
            
            AddCategoryView()
        }
    }
