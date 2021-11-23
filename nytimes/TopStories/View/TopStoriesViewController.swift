//
//  TopStoriesViewController.swift
//  nytimes
//
//  Created by Mark Dennis Diwa on 11/23/21.
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
        storyTableCell.bookmarkButtonTapped = { [weak self] storyCell in
            guard let row = tableView.indexPath(for: storyCell)?.row else { return }
            self?.viewModel.addOrRemoveBookmark(row: row)
            storyCell.reloadBookmarkImage()
        }
        return storyTableCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
}

extension TopStoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
