//
//  CharacterScreenPanel.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 20.11.2022.
//

import Foundation
import UIKit

class CharacterViewCell : UICollectionViewCell{
    static let identifier = "CharacterViewCell"
    
    private let imageView : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "rickandmorty")
        return imageView
    }()
    
    private let label : UILabel = {
       let label = UILabel()
        label.text = "Unknown"
        label.backgroundColor = UIColor.white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = CGRect(x: 5, y: contentView.frame.size.height - 50, width: contentView.frame.size.width - 10, height: 50)
        
        imageView.frame = CGRect(x: 5, y: 5, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 50)
        
    }
    
    func configure(labelText: String, imageUrl: String) {
        label.text = labelText
        imageView.image = UIImage(url: URL(string: imageUrl))
    }
}
