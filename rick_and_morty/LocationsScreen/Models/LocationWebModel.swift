//
//  LocationWebModel.swift
//  rick_and_morty
//
//  Created by Daniil A. Korobtsov on 29.12.2022.
//

import Foundation

struct LocationWebModel: Decodable {
    let name: String
    let type: String
    let dimension: String
}
