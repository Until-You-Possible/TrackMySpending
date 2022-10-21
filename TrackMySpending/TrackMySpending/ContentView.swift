//
//  ContentView.swift
//  TrackMySpending
//
//  Created by Ray on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // track title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // MARK: transaction list
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
