//
//  Extensions.swift
//  nytimes
//
//  Created by Mark Dennis Diwa on 11/23/21.
//

import Foundation


extension Collection {

    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
