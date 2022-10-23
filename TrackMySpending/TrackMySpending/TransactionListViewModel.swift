//
//  TransactionListViewModel.swift
//  TrackMySpending
//
//  Created by Ray on 2022/10/20.
//

import Foundation
import Combine
import Collections


typealias TransactionGroup = OrderedDictionary<String, [Transaction]>

typealias TransactionPrefixSum = [(String, Double)]

final class TransactionListViewModel: ObservableObject {
    
    @Published var transactions: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransaction()
    }
    
    func getTransaction() {
        
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case.failure(let error):
                    print("Error fetching transactions: ", error.localizedDescription)
                case.finished:
                    print("Finished the fetching data")
                }
                
            } receiveValue: { [weak self] result in
                self?.transactions = result
//                dump(self?.transactions)
            }
            .store(in: &cancellables)
    }
    
    func groupTransactionsByMonth() -> TransactionGroup {
        
        guard !transactions.isEmpty else { return [:] }
        let groupedTransaction = TransactionGroup(grouping: transactions) { $0.month }
        return groupedTransaction
        
    }
    
    func accumulateTransaction() -> TransactionPrefixSum {
        print("accumulateTransaction")
        
        guard !transactions.isEmpty else { return [] }
        
        let today = "02/17/2022".dateParsed() // Date()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)
        print("dateInterval", dateInterval! as Any)
        var sum: Double = .zero
        var cumlulativeSum = TransactionPrefixSum()
        for date in stride(from: dateInterval!.start , to: today, by: 60 * 60 * 24) {
            let dailyExpense = transactions.filter{ $0.dateParsed == date && $0.isExpense }
            let dailyTotal = dailyExpense.reduce(0) { $0 - $1.signedAmount }
            sum += dailyTotal
            cumlulativeSum.append((date.formatted(), sum))
        }
        return cumlulativeSum
    }
    
}
