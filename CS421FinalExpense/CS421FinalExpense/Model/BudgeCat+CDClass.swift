//
//  BudgeCat+CDClass.swift
//  CS421FinalExpense
//
//  Created by Student on 4/15/25.
//

import Foundation
import CoreData

@objc(Categories)
public class Categories: NSManagedObject{
    
    var transactionTotal: Double{
        guard let transactions = transactions
        else{
            return 0.0
        }
        let transactionsArray:[Transaction] = transactions.toArray()
        return transactionsArray.reduce(0){
            result, transaction in
            result + transaction.amount
        }
    }
    
    var transactionArray: [Transaction] {
        guard let transaction =  transactions
        else{
            return []
    }
    return transaction.allObjects as! [Transaction]
}
    
    static var all: NSFetchRequest<Categories> {
        let request = Categories.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        return request
    }
}
