//
//  BookmarksViewModel.swift
//  nytimes
//
//  Created by Mark Dennis Diwa on 11/23/21.
//

import Foundation

class BookmarksViewModel {
    
    private var stories = [Story]()
    
    var numberOfItems: Int {
        return stories.count
    }
    
    func getStories(in viewController: BookmarksViewController) {
        self.stories = UserDefaults.bookmarks
        viewController.collectionView.reloadData()
    }
    
    func addOrRemoveBookmark(row: Int) {
        guard let story = stories[safe: row] else { return }
        guard !UserDefaults.bookmarkIds.contains(story.shortURL) else {
            removeBookmark(row: row)
            return
        }
        bookmark(row: row)
    }
    
    func story(in row: Int) -> Story? {
        return stories[safe: row]
    }
    
    private func removeBookmark(row: Int) {
        guard let story = stories[safe: row] else { return }
        UserDefaults.bookmarks.removeAll(where: { $0.shortURL == story.shortURL })
        UserDefaults.bookmarkIds.removeAll(where: { $0 == story.shortURL })
    }
    
    private func bookmark(row: Int) {
        guard let story = stories[safe: row] else { return }
        UserDefaults.bookmarks.append(story)
        UserDefaults.bookmarkIds.append(story.shortURL)
    }
}
