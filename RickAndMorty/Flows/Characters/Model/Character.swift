//
//  Character.swift
//  RickAndMorty
//
//  Created by Temur Khushvaktov on 23/01/24.
//

import Foundation

struct Character: Decodable {
    let info: Info
    let results: [CharacterDetails]
}

struct CharacterDetails: Decodable {
    let id: Int
    let name: String
    let image: String
}

struct Info: Decodable {
    let count: Int
    let next: String
}
