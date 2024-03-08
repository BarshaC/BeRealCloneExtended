//
//  DataFormatter+Extensions.swift
//  BeReal
//
//  Created by Barsha Chaudhary on 3/7/24.
//

import Foundation

extension DateFormatter {
    static var postFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
}
