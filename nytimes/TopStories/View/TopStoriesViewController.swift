//
//  TopStoriesViewController.swift
//  nytimes
//
//  Created by user204729 on 11/23/21.
//

import UIKit

class TopStoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel = TopStoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.getStories(in: self)
    }

}

extension TopStoriesViewController {
    
    func setup() {
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(StoryTableViewCell.nib,
                           forCellReuseIdentifier: StoryTableViewCell.reuseIdentifier)
    }
}

extension TopStoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.reuseIdentifier,
                                                         for: indexPath)
        guard let storyTableCell = dequeuedCell as? StoryTableViewCell,
              let story = viewModel.story(in: indexPath.row) else { return dequeuedCell }
        storyTableCell.setup(with: StoryCellViewModel(story: story))
        return UITableViewCell(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
}

extension TopStoriesViewController: UITableViewDelegate {
    
}
