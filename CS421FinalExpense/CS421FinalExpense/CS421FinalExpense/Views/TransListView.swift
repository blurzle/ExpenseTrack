//
//  TransListView.swift
//  CS421FinalExpense
//
//  Created by Student on 4/14/25.
//

import SwiftUI


struct TransListView: View {
    
    let transactions: [Transaction]
    let onDelete: (Transaction) -> Void
    
    var body: some View {
        List{
            ForEach(transactions){ transaction in
                HStack{
                    Text(transaction.title ?? "")
                    Spacer()
                    Text(transaction.amount as NSNumber, formatter:NumberFormatter.currency).frame(alignment: .center)
                }
            }.onDelete {index in
                guard let index = index.first
                else{
                    return }
                onDelete(transactions[index])
            
            }
        }
    }
}
        #Preview {
            TransListView(transactions: [], onDelete: { _ in })
    
}

