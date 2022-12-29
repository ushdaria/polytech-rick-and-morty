//
//  CharacterScreenPresenter.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 20.11.2022.
//

import Foundation

protocol ICharacterScreenPresenter {
    func getData(status: String?, gender: String?, name: String?)
}

final class CharacterScreenPresenter : ICharacterScreenPresenter {
    weak var characterDelegate: ICharacterScreeenDelegate?
    
    func getData(status: String?, gender: String?, name: String?) {
        // api call
        var testData = [CharacterScreenModel(name: "Rick", imgURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
                        CharacterScreenModel(name: "Morty", imgURL: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),
                        CharacterScreenModel(name: "Summer", imgURL: "https://rickandmortyapi.com/api/character/avatar/3.jpeg")
                       ]
        
        characterDelegate?.setData(data: testData)
    }    
}
