//
//  FilterScreenAssemble.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 20.11.2022.
//

import Foundation
import UIKit

final class FilterScreenAssemble {
    func assembly()-> UIViewController {
        let presenter = FilterPresenter()
        let viewController = FilterViewController(presenter: presenter)
        presenter.transitionHandler = viewController
        return viewController
    }
}
