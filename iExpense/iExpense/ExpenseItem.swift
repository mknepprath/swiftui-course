//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Michael Knepprath on 8/15/20.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
