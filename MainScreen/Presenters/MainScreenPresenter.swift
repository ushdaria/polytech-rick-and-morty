//
//  MainScreenPresenter.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 19.11.2022.
//

import Foundation
import UIKit

protocol IMainScreenPresenter{
    func askToOpenNextScreen(type: MainScreenButtonType)
}

final class MainScreenPresenter: IMainScreenPresenter{
    weak var transitionHandler: UIViewController?
    
    func askToOpenNextScreen(type: MainScreenButtonType) {
        switch type{
        case .characters:
            let characterScreenAssemble = CharacterScreenAssemble()
            transitionHandler?.present(characterScreenAssemble.assembly(), animated: true)
        case .episodes:
            let episodeScreenAssemble = EpisodeScreenAssemble()
            transitionHandler?.present(episodeScreenAssemble.assembly(), animated: true)
        case .locations:
            let locationScreenAssemble = LocationScreenAssemble()
            transitionHandler?.present(locationScreenAssemble.assembly(), animated: true)
        }
    }
}
