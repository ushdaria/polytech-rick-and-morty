//
//  MainScreenButton.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 19.11.2022.
//

import Foundation
import UIKit

protocol MainScreenButtonDelegate: AnyObject{
    func DidTapMainScreenButton(with type: MainScreenButtonType)
}

final class MainScreenButton: UIButton{
    private let models: [MainScreenModel] = [
        MainScreenModel(title: "Characters", imgName: "characters", btnType: .characters),
        MainScreenModel(title: "Locations", imgName: "locations", btnType: .locations),
        MainScreenModel(title: "Episodes", imgName: "episodes", btnType: .episodes)
    ]
    
    var type: MainScreenButtonType
    weak var delegate: MainScreenButtonDelegate?	
    
    init(with type: MainScreenButtonType){
        self.type = type
        super.init(frame: .zero)
        
        self.setUpButton(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpButton(type: MainScreenButtonType){
        var title: String?
        var backgroundImg: UIImage?
        
        models.forEach{
            if $0.btnType == type{
                title = $0.title
                backgroundImg = UIImage(named: $0.imgName)
            }
        }
        
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        setTitleColor(.white, for: .selected)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        addTarget(self, action: #selector(buttonTouched), for: .touchUpInside )
        setBackgroundImage(backgroundImg, for: .normal)
    }
    
    @objc func buttonTouched(){
        delegate?.DidTapMainScreenButton(with: type)
    }
}
