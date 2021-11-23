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
                self.stories = data.stories
                viewController.activityIndicator.stopAnimating()
                viewController.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func story(in row: Int) -> Story? {
        return stories[safe: row]
    }
}
