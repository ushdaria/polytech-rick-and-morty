//
//  FilterPresenter.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 25.12.2022.
//

import Foundation

protocol IFilterPresenter {
    func openCharactersScreen(status: String?, gender: String?)
}

final class FilterPresenter: IFilterPresenter{
    weak var transitionHandler: FilterViewController?
    
    func openCharactersScreen(status: String?, gender: String?) {
        let episodeScreenAssemble = CharacterScreenAssemble()
        transitionHandler?.present(episodeScreenAssemble.assembly(status: status, gender: gender, name: nil), animated: true)
    }
}
