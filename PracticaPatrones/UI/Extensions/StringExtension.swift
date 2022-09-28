//
//  StringExtension.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 29/9/22.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
