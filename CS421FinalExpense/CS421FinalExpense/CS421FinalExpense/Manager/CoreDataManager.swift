//
//  CoreDataManager.swift
//  CS421FinalExpense
//
//  Created by Student on 4/24/25.
//

import Foundation
import CoreData

class CoreDataManager{
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores {description, error in
            if let error {
                fatalError("Unable to load Core Data Model (\(error))")
            }
        }
    }
}
