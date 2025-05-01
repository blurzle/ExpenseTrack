//
//  NSSet+Extensions.swift
//  CS421FinalExpense
//
//  Created by Student on 4/16/25.
//

import Foundation

extension NSSet{
    func toArray<T>() -> [T]{
        let array = self.map {$0 as! T}
        return array
    }
}
