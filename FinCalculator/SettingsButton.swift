//
//  SettingsButton.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 16.10.2022.
//

import Foundation
import UIKit

class SettingsProfitButton {
    func setting (button: UIButton, alfa: Double) {
        button.setTitle("Добавить доход", for: .normal)
        button.backgroundColor = .blue
        button.alpha = alfa
        button.tintColor = .white
        button.layer.cornerRadius = 12
    }
}
