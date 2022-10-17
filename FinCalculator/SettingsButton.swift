//
//  SettingsButton.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 16.10.2022.
//

import Foundation
import UIKit

class settingsProfitButton {
    func setting (button: UIButton, nameButton: String) {
        button.titleLabel?.text = nameButton
        button.backgroundColor = .blue
        button.alpha = 0.9
        button.tintColor = .white
        button.layer.cornerRadius = 12
    }
}
