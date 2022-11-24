//
//  MainScreenAssembly.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 19.11.2022.
//

import Foundation
import UIKit

final class MainScreenAssemble {
    func assembly()-> UIViewController {
        let presenter = MainScreenPresenter()
        let viewController = ViewController(presenter: presenter)
        presenter.transitionHandler = viewController
        return viewController
    }
}
