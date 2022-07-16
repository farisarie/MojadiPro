//
//  DateExtensions.swift
//  MojadiApp
//
//  Created by yoga arie on 05/07/22.
//

import Foundation

extension String {
    func date(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }
}
