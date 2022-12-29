//
//  EpisodeScreenAssemble.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 22.11.2022.
//

import Foundation
import UIKit

final class EpisodeScreenAssemble {
    func assembly()-> UIViewController {
        let presenter = EpisodesScreenPresenter()
        let viewController = EpisodeScreenViewController(presenter: presenter)
        
        presenter.episodeDelegate = viewController
        
        let navVC = UINavigationController(rootViewController: viewController)
        navVC.modalPresentationStyle = .fullScreen
        return navVC
    }
}
