//
//  Extensions.swift
//  MemoryGame
//
//  Created by Rafał on 02/12/2023.
//

import SwiftUI

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        return .linear(duration: duration).repeatForever(autoreverses: false)
    }
}
