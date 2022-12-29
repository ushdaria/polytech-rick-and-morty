//
//  CharacterScreenAssemble.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 20.11.2022.
//

import Foundation
import UIKit

final class CharacterScreenAssemble {
    func assembly(status: String?, gender: String?, name: String?)-> UIViewController {
        let presenter = CharacterScreenPresenter()
        let viewController = CharacterScreenViewController(presenter: presenter, status: status, gender: gender, name: name)
        presenter.characterDelegate = viewController
        
        let navVC = UINavigationController(rootViewController: viewController)
        
        navVC.modalPresentationStyle = .fullScreen
        return navVC
    }
}
