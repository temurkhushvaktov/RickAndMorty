//
//  CharactersAdapter.swift
//  RickAndMorty
//
//  Created by Temur Khushvaktov on 23/01/24.
//

import UIKit

final class CharactersAdapter: NSObject {

    // MARK: - Properties

    var onFetchNextPage: (() -> Void)?

    // MARK: - Private Properties

    private let tableView: UITableView
    private var characters = [CharacterDetails]()

    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        self.tableView.register(CharacterCell.self, forCellReuseIdentifier: String(describing: CharacterCell.self))
        self.tableView.rowHeight = 132
        self.tableView.separatorStyle = .none
        super.init()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    // MARK: - Methods

    func update(characters: [CharacterDetails]) {
        self.characters = characters
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

// MARK: - UITableViewDataSource

extension CharactersAdapter: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterCell.self), for: indexPath) as? CharacterCell else {
            return UITableViewCell()
        }
        cell.update(with: characters[indexPath.row])
        return cell
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            onFetchNextPage?()
        }
    }

}
