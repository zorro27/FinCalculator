//
//  addProfitViewController.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 15.10.2022.
//

import UIKit

protocol ProfitProtocol {
    func add (profit: Int, color: UIColor)
}

class addProfitViewController: UIViewController {
    
    var profitDelegate: ProfitProtocol!

    @IBOutlet weak var addProfitButton: UIButton!
    @IBOutlet weak var profitTextField: UITextField!
    @IBOutlet weak var sumLabel: UILabel!
    
    let settingsButton = SettingsProfitButton()
    let settingsTF = SettingsTextField()
    let settingsLabel = SettingsLabel()
    let nameAddProfitButtom = "Добавить доход"
    let nameLabel = "Сумма:"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsButton.setting(button: addProfitButton, alfa: 0.2)
        settingsTF.settings(textField: profitTextField, placeHolder: "Введите доход")
        settingsLabel.setting(label: sumLabel, text: nameLabel)
        pushButton()
        changeTF()
    }
    
    func changeTF() {
        profitTextField.addTarget(self, action: #selector(charge), for: .editingChanged)
    }
    
    @objc func charge() {
        let textTF = profitTextField.text
        if textTF == "" {
            addProfitButton.alpha = 0.2
        } else {
            addProfitButton.alpha = 0.8
        }
    }
    
    func pushButton(){
        addProfitButton.addTarget(self, action: #selector(add), for: .touchUpInside)
    }
    
    @objc func add() {
        guard let text = profitTextField.text else {return}
        if let numbersTF = Int(text) {
            profitDelegate.add(profit: Int(numbersTF), color: .white)
            dismiss(animated: true)
        } else {
            let alert = UIAlertController(title: "Неверные данные", message: "Введено не число. Нажмите закрыть и попробуйте снова", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel))
            self.present(alert, animated: true)
        }
    }
}
