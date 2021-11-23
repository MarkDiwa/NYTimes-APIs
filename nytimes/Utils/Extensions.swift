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

extension UserDefaults {
    
    static var bookmarks: [Story] {
        get {
            guard let data = UserDefaults.standard.data(forKey: "app.bookmarks") else { return [] }
            let bookmark = try? JSONDecoder().decode([Story].self, from: data)
            return bookmark ?? []
        }
        set {
            UserDefaults.standard.set(try? JSONEncoder().encode(newValue), forKey: "app.bookmarks")
        }
    }
    
    static var bookmarkIds: [String] {
        get {
            guard let data = UserDefaults.standard.data(forKey: "app.ids") else { return [] }
            let tempIds = try? JSONDecoder().decode([String].self, from: data)
            return tempIds ?? []
        }
        set {
            UserDefaults.standard.set(try? JSONEncoder().encode(newValue), forKey: "app.ids")
        }
    }
}
