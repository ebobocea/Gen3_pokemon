//
//  Pokemon+Ext.swift
//  Gen3
//
//  Created by Elisei Bobocea on 11/01/2023.
//

import Foundation

extension Pokemon {
    var background: String {
        switch self.types![0]{
        case "normal", "grass", "electric", "poison", "fairy":
            return "normalgrasselectricpoisonfairy"
        }
    }
}
