//
//  CharactersViewInput.swift
//  RickAndMorty
//
//  Created by Temur Khushvaktov on 23/01/24.
//

import Foundation

protocol CharactersViewInput: AnyObject {
    func setupInitialState()
    func update(characters: [CharacterDetails])
}
