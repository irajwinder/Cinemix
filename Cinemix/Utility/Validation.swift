//
//  Validation.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import SwiftUI

struct Validation {
    static func isValidName(_ name: String?) -> Bool {
        guard let name = name, !name.isEmpty else {
            return false
        }
        return true
    }

    static func showAlert(title: String, message: String) -> Alert {
        return Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("OK")))
    }
}
