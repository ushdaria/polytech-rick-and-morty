//
//  LocationScreenAssemble.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 21.11.2022.
//

import Foundation
import UIKit

final class LocationScreenAssemble {
    func assembly()-> UIViewController {
        let presenter = LocationScreenPresenter()
        let viewController = LocationScreenViewController(presenter: presenter)
        presenter.characterDelegate = viewController
        let navVC = UINavigationController(rootViewController: viewController)
        navVC.modalPresentationStyle = .fullScreen
        return navVC
    }
}
