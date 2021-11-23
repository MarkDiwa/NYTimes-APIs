//
//  TopStoriesViewController.swift
//  nytimes
//
//  Created by user204729 on 11/23/21.
//

import UIKit

class TopStoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension TopStoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
}

extension TopStoriesViewController: UITableViewDelegate {
    
}
