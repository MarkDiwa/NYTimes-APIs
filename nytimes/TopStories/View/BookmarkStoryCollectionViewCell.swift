//
//  BookmarkStoryCollectionViewCell.swift
//  nytimes
//
//  Created by Mark Dennis Diwa on 11/23/21.
//

import UIKit

class BookmarkStoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    
    static let reuseIdentifier = "BookmarkStoryCollectionViewCell"
    static let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    
    var storyViewModel: StoryCellViewModel?
    var bookmarkButtonTapped: (BookmarkStoryCollectionViewCell) -> Void = { _ in }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 10
        cardView.layer.borderWidth = 0.5
        cardView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setup(with storyViewModel: StoryCellViewModel) {
        self.storyViewModel = storyViewModel
        titleLabel.text = storyViewModel.title
        publishedDateLabel.text = storyViewModel.publishedDate
        authorLabel.text = storyViewModel.author
        bookmarkButton.setImage(storyViewModel.bookmarkIcon, for: .normal)
        storyViewModel.setImage(of: storyImageView)
    }
    
    func reloadBookmarkImage() {
        bookmarkButton.setImage(storyViewModel?.bookmarkIcon, for: .normal)
    }
    

    @IBAction func bookmarkButtonTapped(_ sender: Any) {
        bookmarkButtonTapped(self)
    }
}
