//
//  FilterViewController.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 20.11.2022.
//

import UIKit

class FilterViewController: UIViewController {
    private let aliveStatus = RadioButton()
    private let deadStatus = RadioButton()
    private let unknownStatus = RadioButton()
    
    private let femaleGender = RadioButton()
    private let maleGender = RadioButton()
    private let genderlessGender = RadioButton()
    private let unknownGender = RadioButton()
    
    private let labelStatus: UILabel = {
    let label = UILabel()
     label.text = "Status"
     label.font = UIFont.boldSystemFont(ofSize: 20)
     label.textColor = .systemYellow
     return label
 }()
    
    private let labelGender: UILabel = {
    let label = UILabel()
     label.text = "Gender"
     label.font = UIFont.boldSystemFont(ofSize: 20)
     label.textColor = .systemYellow
     return label
 }()
    
    private let buttonReset = UIButton()
    private let buttonResetGender = UIButton()
    private let buttonSubmit = UIButton()
    
    private let presenter: IFilterPresenter
    
    init(presenter: IFilterPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func resetStatusAction(){
        aliveStatus.isSelected = false
        deadStatus.isSelected = false
        unknownStatus.isSelected = false
    }
    
    @objc func resetGenderAction(){
        femaleGender.isSelected = false
        maleGender.isSelected = false
        unknownGender.isSelected = false
        genderlessGender.isSelected = false
    }
    
    @objc func submitAction(){
        //реализовать функцию по применению фильтров и отображению нужных персов
        var status : String? = nil
        var gender : String? = nil
        if aliveStatus.isSelected {
            status = aliveStatus.currentTitle?.lowercased()
        }
        else if deadStatus.isSelected {
            status = deadStatus.currentTitle?.lowercased()
        }
        else if unknownStatus.isSelected {
            status = unknownStatus.currentTitle?.lowercased()
        }
        
        if femaleGender.isSelected {
            gender = femaleGender.currentTitle?.lowercased()
        }
        else if maleGender.isSelected {
            gender = maleGender.currentTitle?.lowercased()
        }
        else if unknownGender.isSelected {
            gender = unknownGender.currentTitle?.lowercased()
        }
        else if genderlessGender.isSelected {
            gender = genderlessGender.currentTitle?.lowercased()
        }
        presenter.openCharactersScreen(status: status, gender: gender)
        print("открываю страницу с фильтрами \(status ?? "nil") и \(gender ?? "nil")")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        
        aliveStatus.alternateButton = [deadStatus, unknownStatus]
        deadStatus.alternateButton = [aliveStatus, unknownStatus]
        unknownStatus.alternateButton = [aliveStatus, deadStatus]
        
        femaleGender.alternateButton = [maleGender, genderlessGender, unknownGender]
        maleGender.alternateButton = [femaleGender, genderlessGender, unknownGender]
        genderlessGender.alternateButton = [femaleGender, maleGender, unknownGender]
        unknownGender.alternateButton = [femaleGender, maleGender, genderlessGender]
        
        
        labelStatus.frame = CGRect(x: 40, y: 150, width: view.frame.size.width/4, height: 20)
        labelGender.frame = CGRect(x: 40, y: view.frame.size.height/2, width: view.frame.size.width/4, height: 20)
        buttonReset.frame = CGRect(x: view.frame.size.width - view.frame.size.width/4 - 40, y: 150, width: view.frame.size.width/4, height: 20)
        buttonResetGender.frame = CGRect(x: view.frame.size.width - view.frame.size.width/4 - 40, y: view.frame.size.height/2, width: view.frame.size.width/4, height: 20)
        
        view.addSubview(labelStatus)
        view.addSubview(labelGender)
        
        setUpResetButton(button: buttonReset)
        setUpResetButton(button: buttonResetGender)
        
        setUpButton(button: aliveStatus)
        setUpButton(button: deadStatus)
        setUpButton(button: unknownStatus)
        setUpButton(button: femaleGender)
        setUpButton(button: maleGender)
        setUpButton(button: genderlessGender)
        setUpButton(button: unknownGender)
        
        self.view.addSubview(buttonSubmit)
        buttonSubmit.setTitle("Apply filters", for: .normal)
        buttonSubmit.setTitleColor(UIColor.systemGreen, for: .normal)
        buttonSubmit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonSubmit.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
        buttonSubmit.frame = CGRect(x: 0, y: view.frame.size.height-100, width: view.frame.size.width, height: 40)
    }
    
    
    func setUpButton(button: RadioButton){
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: view.frame.width * 0.9).isActive = true
        button.heightAnchor.constraint(equalToConstant: view.frame.height*0.05).isActive = true
        button.setTitleColor(.systemGreen, for: .normal)
        button.imageEdgeInsets.left = -10
        button.isSelected = false
        
        switch button {
        case aliveStatus:
            button.setTitle("Alive", for: .normal)
            button.topAnchor.constraint(equalTo: labelStatus.topAnchor, constant: 30).isActive = true
        case deadStatus:
            button.setTitle("Dead", for: .normal)
            button.topAnchor.constraint(equalTo: aliveStatus.bottomAnchor, constant: 15).isActive = true
        case unknownStatus:
            button.setTitle("Unknown", for: .normal)
            button.topAnchor.constraint(equalTo: deadStatus.bottomAnchor, constant: 15).isActive = true
        case femaleGender:
            button.setTitle("Female", for: .normal)
            button.topAnchor.constraint(equalTo: labelGender.bottomAnchor, constant: 30).isActive = true
        case maleGender:
            button.setTitle("Male", for: .normal)
            button.topAnchor.constraint(equalTo: femaleGender.bottomAnchor, constant: 15).isActive = true
        case genderlessGender:
            button.setTitle("Genderless", for: .normal)
            button.topAnchor.constraint(equalTo: maleGender.bottomAnchor, constant: 15).isActive = true
        case unknownGender:
            button.setTitle("Unknown", for: .normal)
            button.topAnchor.constraint(equalTo: genderlessGender.bottomAnchor, constant: 15).isActive = true
        default:
            return
        }
    }
    
    func setUpResetButton(button: UIButton){
        self.view.addSubview(button)
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        switch button{
        case buttonReset:
            button.addTarget(self, action: #selector(resetStatusAction), for: .touchUpInside)
        case buttonResetGender:
            button.addTarget(self, action: #selector(resetGenderAction), for: .touchUpInside)
        default:
            return
        }
        
    }
}
