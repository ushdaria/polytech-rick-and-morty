//
//  EpisodeScreenPresenter.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 26.12.2022.
//

import Foundation

enum EpisodesError: Error {
    case invalidServerResponse
}

protocol IEpisodesScreenPresenter {
    func getData()
}

final class EpisodesScreenPresenter : IEpisodesScreenPresenter {
    weak var episodeDelegate: IEpisodeScreenViewController?
    
    func getData() {
        Task {
            var data: EpisodesWebModel = EpisodesWebModel(results: []);
            do {
                data = try await getEpisodes()
            } catch {
                print(error)
            }
            
            episodeDelegate?.setData(data: data.results.map { EpisodeScreenModel(name: $0.name, number: $0.episode, date: $0.air_date)})
        }
    }
    
    func getEpisodes() async throws -> EpisodesWebModel {
        let url = URL(string: "https://rickandmortyapi.com/api/episode")!;
        
        let (data, response) = try await URLSession.shared.data(from: url);
    
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
            throw EpisodesError.invalidServerResponse
        }
        return try JSONDecoder().decode(EpisodesWebModel.self, from: data)
    }
}
