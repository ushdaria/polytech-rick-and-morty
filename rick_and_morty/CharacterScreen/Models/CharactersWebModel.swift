//
//  CharactersWebModel.swift
//  rick_and_morty
//
//  Created by Daniil A. Korobtsov on 29.12.2022.
//

import Foundation

struct CharactersWebModel: Decodable {
    let results: [CharacterWebModel]
}
