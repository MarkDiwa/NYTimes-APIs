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
    
    var publishedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy"
        return dateFormatter.string(from: story.publishedDate)
    }
    
    func setImage(of imageView: UIImageView) {
        guard let urlString = story.multimedia.first?.url,
        let url = URL(string: urlString) else { return }
        imageView.kf.setImage(with: url)
    }
    
    init(story: Story) {
        self.story = story
    }
}
