//
//  RecentTransactionList.swift
//  TrackMySpending
//
//  Created by Ray on 2022/10/20.
//

import SwiftUI

struct RecentTransactionList: View {
    var body: some View {
        VStack {
            HStack {
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                NavigationLink {
                    
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            padding(.top)
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
        
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static var previews: some View {
        RecentTransactionList()
    }
}
