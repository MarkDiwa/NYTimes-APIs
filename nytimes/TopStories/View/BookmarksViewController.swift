//
//  BookmarksViewController.swift
//  nytimes
//
//  Created by Mark Dennis Diwa on 11/23/21.
//

import UIKit

class BookmarksViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = BookmarksViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getStories(in: self)
    }

}

extension BookmarksViewController {
    
    func setup() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BookmarkStoryCollectionViewCell.nib,
                                forCellWithReuseIdentifier: BookmarkStoryCollectionViewCell.reuseIdentifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        collectionView
              .setCollectionViewLayout(layout, animated: true)
    }
}

extension BookmarksViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = collectionViewLayout as? UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - (layout?.minimumInteritemSpacing ?? 4)
        
        return CGSize(width: widthPerItem - 8, height: 250)
    }
}

extension BookmarksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequeuedCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: BookmarkStoryCollectionViewCell.reuseIdentifier,
                                 for: indexPath)
        guard let bookmarkCell = dequeuedCell as? BookmarkStoryCollectionViewCell,
              let story = viewModel.story(in: indexPath.row) else { return dequeuedCell }
        bookmarkCell.setup(with: StoryCellViewModel(story: story))
        bookmarkCell.bookmarkButtonTapped = { [weak self] storyCell in
            guard let self = self else { return }
            guard let row = collectionView.indexPath(for: storyCell)?.row else { return }
            self.viewModel.addOrRemoveBookmark(row: row)
            bookmarkCell.reloadBookmarkImage()
            self.viewModel.getStories(in: self)
        }
        return bookmarkCell
    }
    
}

extension BookmarksViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let story = viewModel.story(in: indexPath.row) else { return }
        let viewController = StoryDetailViewController()
        let viewModel = StoryDetailViewModel(story: story)
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}
