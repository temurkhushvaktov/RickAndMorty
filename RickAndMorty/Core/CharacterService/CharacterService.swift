//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Temur Khushvaktov on 23/01/24.
//

import Foundation

enum CharacterServiceeEndpoint: String {
    case url = "https://rickandmortyapi.com/api/character/?page="
}

protocol CharacterServiceProtocol {
    func getCharactersFrom(
        page: Int,
        completion: @escaping (Result<Character, Error>) -> Void
    )
}

struct CharacterService: CharacterServiceProtocol {

    func getCharactersFrom(
        page: Int,
        completion: @escaping (Result<Character, Error>) -> Void)
    {
        let url = CharacterServiceeEndpoint.url.rawValue + "\(page)"
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
            {
                do {
                    let character = try JSONDecoder().decode(Character.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(character))
                    }
                } catch let error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
}
