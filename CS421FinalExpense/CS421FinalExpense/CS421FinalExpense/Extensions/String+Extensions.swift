//
//  String+Extensions.swift
//  CS421FinalExpense
//
//  Created by Student on 4/24/25.
//

import Foundation

extension String{
    var isNumberic: Bool {
        Double(self) != nil
    }
    
    func isGreaterThan(_ value: Double) -> Bool {
        guard self.isNumberic else {
            return false
        }
        return Double(self)! > value
    }
}
