//
//  Date+Extensions.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

extension Date {
    internal func toString(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension Date {
    internal func ordinalDayMonthYear() -> String {
        let component = Calendar.current.component(.day, from: self)
        let formatter = NumberFormatter()
        
        formatter.locale      = .current
        formatter.numberStyle = .ordinal
        
        let dayString = formatter.string(from: component as NSNumber) ?? "\(component)"

        return "\(dayString) \(toString("MMMM yyyy"))"
    }
}
