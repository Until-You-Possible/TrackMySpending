//
//  previewData.swift
//  TrackMySpending
//
//  Created by Ray on 2022/10/19.
//

import Foundation


var transactionPreviewData = Transaction(
    id: 1,
    date: "01/24/2022",
    institution: "Desjardins",
    account: "visa",
    merchant: "apple",
    amount: 113.4,
    type: "debit",
    categoryId: 304,
    category: "software",
    isPending: false,
    isTransfer: false,
    isExpense: true,
    isEdited: false
)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 20)
