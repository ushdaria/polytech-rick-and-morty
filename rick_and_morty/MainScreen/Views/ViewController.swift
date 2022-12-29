//
//  ViewController.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {

    private let presenter: IMainScreenPresenter?
    
    //UI
    private let charactersBtn = MainScreenButton(with: .characters)
    private let locationsBtn = MainScreenButton(with: .locations)
    private let episodesBtn = MainScreenButton(with: .episodes)
    
    required init?(coder: NSCoder) {
        self.presenter = nil
        super.init(coder: coder)
    }
    
    //???
    init(presenter: IMainScreenPresenter){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rick And Morty"
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemBlue]
        
        //navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        
        self.view.backgroundColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpButton(button: charactersBtn)
        setUpButton(button: locationsBtn)
        setUpButton(button: episodesBtn)
    }
    
    func setUpButton(button: MainScreenButton){
        button.delegate = self
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: view.frame.width * 0.9).isActive = true
        button.heightAnchor.constraint(equalToConstant: view.frame.height * 0.25).isActive = true
        
        
        switch button.type {
        case .characters:
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        case .locations:
            button.topAnchor.constraint(equalTo: charactersBtn.bottomAnchor, constant: 30).isActive = true
        case .episodes:
            button.topAnchor.constraint(equalTo: locationsBtn.bottomAnchor, constant: 30).isActive = true
        }
    }

}

extension ViewController: MainScreenButtonDelegate {
    func DidTapMainScreenButton(with type: MainScreenButtonType){
        presenter?.askToOpenNextScreen(type: type)
    }
}
