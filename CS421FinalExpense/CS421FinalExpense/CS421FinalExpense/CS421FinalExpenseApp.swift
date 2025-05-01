//
//  CS421FinalExpenseApp.swift
//  CS421FinalExpense
//
//  Created by Student on 4/10/25.
//

import SwiftUI

@main
struct CS421FinalExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}
