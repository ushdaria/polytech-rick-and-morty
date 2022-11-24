//
//  EpisodeScreenModel.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 22.11.2022.
//

import UIKit

class EpisodeViewCell : UICollectionViewCell{
    static let identifier = "EpisodeViewCell"
    
    private let labelName : UILabel = {
       let label = UILabel()
        label.text = "A Rickle in Time"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
    private let lilLabelNumber : UILabel = {
       let label = UILabel()
        label.text = "number"
        label.textColor = UIColor.systemGray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private let labelNumber : UILabel = {
       let label = UILabel()
        label.text = "S01E01"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let lilLabelDate : UILabel = {
       let label = UILabel()
        label.text = "date"
        label.textColor = UIColor.systemGray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private let labelDate : UILabel = {
       let label = UILabel()
        label.text = "December 2, 2013"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let lilLabelCharacters : UILabel = {
       let label = UILabel()
        label.text = "characters"
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
        contentView.addSubview(labelName)
        contentView.addSubview(lilLabelNumber)
        contentView.addSubview(labelNumber)
        contentView.addSubview(lilLabelDate)
        contentView.addSubview(labelDate)
        contentView.addSubview(lilLabelCharacters)
        contentView.addSubview(btn)
        contentView.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        labelName.frame = CGRect(x: 5, y: 10, width: contentView.frame.size.width - 10, height: 50)
        lilLabelNumber.frame = CGRect(x: 5, y: 60+5, width: contentView.frame.size.width - 10, height: 20)
        labelNumber.frame = CGRect(x: 5, y: 85, width: contentView.frame.size.width - 10, height: 30)
        lilLabelDate.frame = CGRect(x: 5, y: 115+5, width: contentView.frame.size.width - 10, height: 20)
        labelDate.frame = CGRect(x: 5, y: 140, width: contentView.frame.size.width - 10, height: 50)
        lilLabelCharacters.frame = CGRect(x: 5, y: 190+5, width: contentView.frame.size.width - 10, height: 20)
        btn.frame = CGRect(x: (contentView.frame.size.width/2)-(contentView.frame.size.width/3)/2,
                           y: 225,
                           width: contentView.frame.size.width/3,
                           height: 20)
        btn.layer.cornerRadius = 3
        btn.setTitle("see", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.systemGreen
        
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
    }
}


