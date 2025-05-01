//
//  detailsPage.swift
//  CS421FinalExpense
//
//  Created by Student on 4/17/25.
//

import SwiftUI

struct detailsPage: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var category: Categories
    @State private var title: String = ""
    @State private var amount: String = ""
    private var isValid : Bool {
        !title.isEmpty && !amount.isEmpty && amount.isNumberic && amount.isGreaterThan(0)
    }
    
    private func saveTransaction(){
        let transaction = Transaction(context: viewContext)
        transaction.title = title
        transaction.amount = Double(amount)!
        
        category.addToTransactions(transaction)
        try? viewContext.save()
    }

    private func removeTransaction(_ transaction: Transaction){
        viewContext.delete(transaction)
        
        do{
            try viewContext.save()
        }catch{
            print(error)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(category.amount as NSNumber, formatter: NumberFormatter.currency).frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            
            Form{
                TextField("Title", text: $title)
                TextField("Amount", text: $amount)
            }//form
            HStack{
                Spacer()
                Button("Add Transaction"){
                    saveTransaction()
                }.disabled(!isValid)//Button
                Spacer()
            }
            Text(category.transactionTotal as NSNumber, formatter: NumberFormatter.currency).frame(alignment: .center).bold()
            TransListView(transactions: category.transactionArray, onDelete: {transaction in removeTransaction(transaction)
            })//trans list view
            }.padding()//HStack
        }//VStac
    }//var body some: View
    
struct detailsPage_Previews: PreviewProvider {
    static var previews: some View{
            
        let vc = CoreDataManager.shared.persistentContainer.viewContext
            let request = Categories.fetchRequest()
            let results = try! vc.fetch(request)
            NavigationStack{
                detailsPage(category: results[0]).environment(\.managedObjectContext, vc)
            }//NavigationStack
        }
    }


