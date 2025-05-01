//
//  NumFormat.swift
//  CS421FinalExpense
//
//  Created by Student on 4/15/25.
//

import Foundation
extension NumberFormatter{

    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
