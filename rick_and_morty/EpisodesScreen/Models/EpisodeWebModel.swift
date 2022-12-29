//
//  EpisodeWebModel.swift
//  rick_and_morty
//
//  Created by Daniil A. Korobtsov on 29.12.2022.
//

import Foundation

struct EpisodeWebModel: Decodable {
    let name: String
    let episode: String
    let air_date: String
}
