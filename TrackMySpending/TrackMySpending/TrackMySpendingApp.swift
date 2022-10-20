//
//  TrackMySpendingApp.swift
//  TrackMySpending
//
//  Created by Ray on 2022/10/19.
//

import SwiftUI

@main
struct TrackMySpendingApp: App {
    
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
