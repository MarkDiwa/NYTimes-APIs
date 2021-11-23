//
//  StoryTableViewCell.swift
//  nytimes
//
//  Created by Mark Dennis Diwa on 11/23/21.
//

import Kingfisher
import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    static let reuseIdentifier = "StoryTableViewCell"
    static let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    
    var storyViewModel: StoryCellViewModel?
    var bookmarkButtonTapped: (StoryTableViewCell) -> Void = { _ in }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 10
        cardView.layer.borderWidth = 0.5
        cardView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setup(with storyViewModel: StoryCellViewModel) {
        self.storyViewModel = storyViewModel
        titleLabel.text = storyViewModel.title
        publishedLabel.text = storyViewModel.publishedDate
        authorLabel.text = storyViewModel.author
        bookmarkButton.setImage(storyViewModel.bookmarkIcon, for: .normal)
        storyViewModel.setImage(of: storyImage)
    }
    
    func reloadBookmarkImage() {
        bookmarkButton.setImage(storyViewModel?.bookmarkIcon, for: .normal)
    }
    
    @IBAction private func bookMarkButtonTapped(_ sender: Any) {
        bookmarkButtonTapped(self)
    }
}
