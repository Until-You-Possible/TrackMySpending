//
//  ContentView.swift
//  TrackMySpending
//
//  Created by Ray on 2022/10/19.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        
        var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // track title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // MARK: charts
                    CardView {
                        VStack {
                            ChartLabel("$900", type: .title)
                            LineChart()
                        }
                        .background(Color.systemBackground)
                    }
                    .data(demoData)
                    .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                    .frame(height: 300)
                    
                    
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
        .accentColor(.primary)
        
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
