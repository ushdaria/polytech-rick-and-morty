//
//  LocationScreenPresenter.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 26.12.2022.
//

import Foundation

protocol ILocationScreenPresenter {
    func getData()
}

final class LocationScreenPresenter : ILocationScreenPresenter {
    weak var characterDelegate: ILocationScreeenDelegate?
    
    func getData() {
        // api call
        var testData = [LocationScreenModel(name: "Earth", type: "planet", dimension: "Dimension C-137"),
                        LocationScreenModel(name: "Mars", type: "dead planet", dimension: "Dimension C-139"),
                        LocationScreenModel(name: "Jupyter", type: "loop planet", dimension: "Dimension A-137")
                       ]
        
        characterDelegate?.setData(data: testData)
    }
}
