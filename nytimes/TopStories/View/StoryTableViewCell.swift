//
//  StoryTableViewCell.swift
//  nytimes
//
//  Created by user204729 on 11/23/21.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func bookMarkButtonTapped(_ sender: Any) {
        
    }
}
