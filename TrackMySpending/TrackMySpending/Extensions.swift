//
//  Extensions.swift
//  TrackMySpending
//
//  Created by Ray on 2022/10/19.
//

import Foundation
import SwiftUI

extension Color {
    
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
    
    
}


extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initalizing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}


extension String {
    func dateParsed () -> Date {
        guard let paraseDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
        return paraseDate
    }
}
