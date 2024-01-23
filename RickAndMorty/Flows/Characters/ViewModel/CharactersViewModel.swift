//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Temur Khushvaktov on 23/01/24.
//

import Foundation

final class CharactersViewModel {

    // MARK: - Properties

    weak var view: CharactersViewInput?

    // MARK: - Private Properties

    private var characters = [CharacterDetails]()
    private var page = 0

    // MARK: - Initialization

    init() {}

}

extension CharactersViewModel: CharactersViewOutput {

    func viewDidLoad() {
        view?.setupInitialState()
        getCharacters(with: page)
    }

    func fetchNextPage() {
        page += 1
        getCharacters(with: page)
    }

    func refresh() {
        page = 0
        characters = []
        getCharacters(with: page)
    }
}

// MARK: - Network Layer

private extension CharactersViewModel {

    func getCharacters(with page: Int) {
        CharacterService().getCharactersFrom(page: page) { [weak self] result in
            switch result {
            case .success(let model):
                self?.characters += model.results
                guard let characters = self?.characters else {
                    return
                }
                self?.view?.update(characters: characters)
            case .failure(let error):
                if
                    let error = error as? URLError,
                    error.code == URLError.Code.notConnectedToInternet
                {
                    print("No Internet Connection")
                } else {
                    print(error.localizedDescription)
                }
            }
        }
    }

}
