//
//  StoryDetailViewModel.swift
//  nytimes
//
//  Created by user204729 on 11/23/21.
//

import Foundation
import Kingfisher

class StoryDetailViewModel {
    
    private var story: Story
    
    var title: String {
        return story.title
    }
    
    var author: String {
        return story.byline
    }
    
    var url: String {
        return "URL: \(story.url)"
    }
    
    var abstract: String {
        return story.abstract
    }
    
    var publishedDate: String {
        let serverDateFormatter = DateFormatter()
        serverDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy"
        
        guard let date = serverDateFormatter.date(from: story.publishedDate) else { return "" }
        return "Published: \(dateFormatter.string(from: date))"
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
