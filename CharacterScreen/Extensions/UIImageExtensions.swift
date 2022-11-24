//
//  UIImageExtensions.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 20.11.2022.
//

import UIKit

extension UIImage {
    convenience init?(url : URL?) {
        guard let url = url else {
            return nil
        }
        
        do {
            self.init(data: try Data(contentsOf: url))
        } catch {
            print("Cannot load picture")
            return nil
        }
    }
}
