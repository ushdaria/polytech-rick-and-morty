//
//  CharacterScreenAssemble.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 20.11.2022.
//

import Foundation
import UIKit

final class CharacterScreenAssemble {
    func assembly()-> UIViewController {
        let presenter = CharacterScreenPresenter()
        let viewController = CharacterScreenViewController(presenter: presenter)
        presenter.characterDelegate = viewController
        
        let navVC = UINavigationController(rootViewController: viewController)
        
        navVC.modalPresentationStyle = .fullScreen
        return navVC
    }
}
