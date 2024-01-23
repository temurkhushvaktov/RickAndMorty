//
//  CharactersConfigurator.swift
//  RickAndMorty
//
//  Created by Temur Khushvaktov on 23/01/24.
//

import UIKit

enum CharactersConfigurator {

    // MARK: - Internal Methods

    static func configure() -> CharactersViewController {
        let view = CharactersViewController()
        let viewModel = CharactersViewModel()

        viewModel.view = view
        view.output = viewModel

        return view
    }

}
