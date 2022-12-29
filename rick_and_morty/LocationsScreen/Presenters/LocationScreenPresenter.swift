//
//  LocationScreenPresenter.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 26.12.2022.
//

import Foundation


enum LocationsError: Error {
    case invalidServerResponse
}

protocol ILocationScreenPresenter {
    func getData()
}

final class LocationScreenPresenter : ILocationScreenPresenter {
    weak var locationDelegate: ILocationScreeenDelegate?
    
    func getData() {
        Task {
            var data: LocationsWebModel = LocationsWebModel(results: []);
            do {
                data = try await getLocations()
            } catch {
                print(error)
            }
            
            locationDelegate?.setData(data: data.results.map {LocationScreenModel(name: $0.name, type: $0.type, dimension: $0.dimension)})
        }
    }
    
    func getLocations() async throws -> LocationsWebModel {
        let url = URL(string: "https://rickandmortyapi.com/api/location")!;
        
        let (data, response) = try await URLSession.shared.data(from: url);
    
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
            throw LocationsError.invalidServerResponse
        }
        return try JSONDecoder().decode(LocationsWebModel.self, from: data)
    }
}
