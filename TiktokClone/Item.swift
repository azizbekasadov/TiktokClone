//
//  Item.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 14.10.2025.
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
