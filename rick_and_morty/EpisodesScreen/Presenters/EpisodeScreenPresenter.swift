//
//  EpisodeScreenPresenter.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 26.12.2022.
//

import Foundation

protocol IEpisodesScreenPresenter {
    func getData()
}

final class EpisodesScreenPresenter : IEpisodesScreenPresenter {
    weak var episodeDelegate: IEpisodeScreenViewController?
    
    func getData() {
        // api call
        var testData = [EpisodeScreenModel(name: "Pilot", number: "S01E01", date: "December 2, 2013")]
        
        episodeDelegate?.setData(data: testData)
    }
}
