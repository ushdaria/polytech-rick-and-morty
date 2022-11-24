//
//  LocationScreenPanel.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 21.11.2022.
//

import Foundation
import UIKit

class LocationViewCell : UICollectionViewCell{
    static let identifier = "LocationViewCell"
    
    private let labelPlanet : UILabel = {
       let label = UILabel()
        label.text = "Earth"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let lilLabelType : UILabel = {
       let label = UILabel()
        label.text = "type"
        label.textColor = UIColor.systemGray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private let labelType : UILabel = {
       let label = UILabel()
        label.text = "Planet"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let lilLabelDimension : UILabel = {
       let label = UILabel()
        label.text = "dimension"
        label.textColor = UIColor.systemGray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private let labelDimension : UILabel = {
       let label = UILabel()
        label.text = "unknown"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let lilLabelResidents : UILabel = {
       let label = UILabel()
        label.text = "residents"
        label.textColor = UIColor.systemGray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private let btn = UIButton()
    @objc func btnAction(){
        print("button pressed")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(patternImage: UIImage(named: "cell")!)
        
        contentView.layer.cornerRadius = 10
        contentView.addSubview(labelPlanet)
        contentView.addSubview(lilLabelType)
        contentView.addSubview(labelType)
        contentView.addSubview(lilLabelDimension)
        contentView.addSubview(labelDimension)
        contentView.addSubview(lilLabelResidents)
        contentView.addSubview(btn)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        labelPlanet.frame = CGRect(x: 5, y: 10, width: contentView.frame.size.width - 10, height: 30)
        lilLabelType.frame = CGRect(x: 5, y: 45, width: contentView.frame.size.width - 10, height: 20)
        labelType.frame = CGRect(x: 5, y: 65, width: contentView.frame.size.width - 10, height: 30)
        lilLabelDimension.frame = CGRect(x: 5, y: 100, width: contentView.frame.size.width - 10, height: 20)
        labelDimension.frame = CGRect(x: 5, y: 120, width: contentView.frame.size.width - 10, height: 30)
        lilLabelResidents.frame = CGRect(x: 5, y: 155, width: contentView.frame.size.width - 10, height: 20)
        btn.frame = CGRect(x: (contentView.frame.size.width/2)-(contentView.frame.size.width/3)/2,
                           y: 185,
                           width: contentView.frame.size.width/3,
                           height: 20)
        btn.layer.cornerRadius = 3
        btn.setTitle("see", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.systemGreen
        
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
    }
    
    /*func configure(labelText: String, imageUrl: String) {
        labelPlanet.text = labelText
        imageView.image = UIImage(url: URL(string: imageUrl))
    }*/
}
