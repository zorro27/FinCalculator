//
//  SettingsButton.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 16.10.2022.
//

import Foundation
import UIKit

class SettingsProfitButton {
    func setting (button: UIButton, setTitle: String, backgtoundCollorButton: UIColor, subTitle: String?, alfa: Double, cornerRadius: Int) {
        button.setTitle(setTitle, for: .normal)
        if subTitle != nil {
            button.configuration?.subtitle = subTitle
        }
        button.contentHorizontalAlignment = .center
        button.backgroundColor = backgtoundCollorButton
        button.alpha = alfa
        button.tintColor = .white
        button.layer.cornerRadius = CGFloat(cornerRadius)
    }
}

