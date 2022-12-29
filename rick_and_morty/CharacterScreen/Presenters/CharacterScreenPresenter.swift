//
//  CharacterScreenPresenter.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 20.11.2022.
//

import Foundation

enum CharactersError: Error {
    case invalidServerResponse
}

protocol ICharacterScreenPresenter {
    func getData(status: String?, gender: String?, name: String?)
}

final class CharacterScreenPresenter : ICharacterScreenPresenter {
    weak var characterDelegate: ICharacterScreeenDelegate?
    
    func getData(status: String?, gender: String?, name: String?) {
        var baseUrl = "https://rickandmortyapi.com/api/character/?"
        if (status != nil) {
            baseUrl += "status=\(status!)&"
        }
        if (gender != nil) {
            baseUrl += "gender=\(gender!)&"
        }
        if (name != nil) {
            baseUrl += "name=\(name!)&"
        }

        let url = URL(string: baseUrl)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                return;
            }
            
            do {
                let decodedData = try JSONDecoder().decode(CharactersWebModel.self, from: data!)
                
                DispatchQueue.main.async {
                    self.characterDelegate?.setData(data: decodedData.results.map {CharacterScreenModel(name: $0.name, imgURL: $0.image)})
                }
            }
            catch {
                return;
            }
        }
        task.resume()
    }
}
