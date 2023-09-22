//
//  Item.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 21/09/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
