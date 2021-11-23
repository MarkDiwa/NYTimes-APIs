//
//  StoryCellViewModel.swift
//  nytimes
//
//  Created by Mark Dennis Diwa on 11/23/21.
//

import Kingfisher

class StoryCellViewModel {
    
    var story: Story
    
    var title: String {
        return story.title
    }
    
    var author: String {
        return story.byline
    }
    
    var bookmarkIcon: UIImage? {
        return UserDefaults.bookmarkIds.contains(story.shortURL)
        ? UIImage(systemName: "bookmark.fill")
        : UIImage(systemName: "bookmark")
    }
    
    var publishedDate: String {
        let serverDateFormatter = DateFormatter()
        serverDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy"
        
        guard let date = serverDateFormatter.date(from: story.publishedDate) else { return "" }
        return dateFormatter.string(from: date)
    }
    
    func setImage(of imageView: UIImageView) {
        guard let urlString = story.multimedia?.first?.url,
        let url = URL(string: urlString) else { return }
        imageView.kf.setImage(with: url)
    }
    
    init(story: Story) {
        self.story = story
    }
}
