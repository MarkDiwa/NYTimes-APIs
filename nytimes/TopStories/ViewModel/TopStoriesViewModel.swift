//
//  TopStoriesViewModel.swift
//  nytimes
//
//  Created by user204729 on 11/23/21.
//

import Foundation

class TopStoriesViewModel {
    
    private var stories = [Story]()
    
    var numberOfItems: Int {
        return stories.count
    }
    
    func getStories(in viewController: TopStoriesViewController) {
        TopStoriesAPI.getStories(category: .business) { [weak self] apiResponse in
            guard let self = self else { return }
            switch apiResponse.result {
            case .success(let data):
                self.stories = data.stories?.filter({ !$0.title.isEmpty }) ?? []
                viewController.activityIndicator.stopAnimating()
                viewController.tableView.reloadData()
            case .failure(let error):
                print("Errorrrrr: \(error)")
            }
        }
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
