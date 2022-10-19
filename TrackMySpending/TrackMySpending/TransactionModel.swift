//
//  TransactionModel.swift
//  TrackMySpending
//
//  Created by Ray on 2022/10/19.
//

import Foundation
import SwiftUI

struct Transaction: Identifiable {
    
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    var isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
        
    
}


enum TransactionType: String {
    
    case debit = "debit"
    case credit = "credit"
    
}
