//
//  StoryDetailViewController.swift
//  nytimes
//
//  Created by Mark Dennis Diwa on 11/23/21.
//

import UIKit

class StoryDetailViewController: UIViewController {

    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    
    var viewModel: StoryDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else {
            return
        }
        viewModel.setImage(of: imageVIew)
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
        publishedDateLabel.text = viewModel.publishedDate
        urlLabel.text = viewModel.url
        abstractLabel.text = viewModel.abstract
    }

}
