//
//  EpisodesWebModel.swift
//  rick_and_morty
//
//  Created by Daniil A. Korobtsov on 29.12.2022.
//

import Foundation

struct EpisodesWebModel: Decodable {
    let results: [EpisodeWebModel]
}
