//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Temur Khushvaktov on 23/01/24.
//

import SnapKit
import UIKit

final class CharactersViewController: UIViewController {

    // MARK: - Properties

    var output: CharactersViewOutput?

    // MARK: - Private Properties

    private let tableView = UITableView()
    private var refreshConrol = UIRefreshControl()

    private var adapter: CharactersAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }

}

// MARK: - CharactersViewInput

extension CharactersViewController: CharactersViewInput {

    func setupInitialState() {
        configureAppearance()
    }

    func update(characters: [CharacterDetails]) {
        refreshConrol.endRefreshing()
        adapter?.update(characters: characters)
    }

}

// MARK: - Appearance

private extension CharactersViewController {

    func configureAppearance() {
        view.backgroundColor = .white
        configureAdapter()
        configureTableViewLayout()
        configureRefreshControl()
    }

    func configureAdapter() {
        adapter = CharactersAdapter(tableView: tableView)
        adapter?.onFetchNextPage = { [weak self] in
            self?.output?.fetchNextPage()
        }
    }

    func configureTableViewLayout() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func configureRefreshControl() {
        refreshConrol.tintColor = .black
        refreshConrol.addTarget(self, action: #selector(pullToRefreshAction), for: .valueChanged)
        tableView.addSubview(refreshConrol)
    }

}


// MARK: - Actions

private extension CharactersViewController {

    @objc
    func pullToRefreshAction() {
        output?.refresh()
    }

}
