//
//  RadioButton.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 20.11.2022.
//

import UIKit

class RadioButton: UIButton {
    var alternateButton:Array<RadioButton>?
    
    func unselectAlternateButtons() {
        if alternateButton != nil {
            self.isSelected = true
            
            for aButton:RadioButton in alternateButton! {
                aButton.isSelected = false
            }
        } else {
            toggleButton()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }
    
    func toggleButton() {
        self.isSelected = !isSelected
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.setImage(UIImage(named: "checked-radio-button"), for: .normal)
                
            } else {
                self.setImage(UIImage(named: "unchecked-radio-button"), for: .normal)
            }
        }
    }
}
