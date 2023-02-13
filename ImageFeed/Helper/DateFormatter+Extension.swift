//
//  DateFormatter+Extension.swift
//  ImageFeed
//
//  Created by Kirill on 24.01.2023.
//

import Foundation

extension DateFormatter {
    var displayFormat: DateFormatter {
        self.dateStyle = .long
        self.timeStyle = .none
        return self
    }
}
