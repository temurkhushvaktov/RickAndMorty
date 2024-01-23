//
//  CharactersViewOutput.swift
//  RickAndMorty
//
//  Created by Temur Khushvaktov on 23/01/24.
//

import Foundation

protocol CharactersViewOutput {
    func viewDidLoad()
    func fetchNextPage()
    func refresh()
}
