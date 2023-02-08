//
//  addProfitViewController.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 15.10.2022.
//

import UIKit

protocol ProfitProtocol {
    func add (profit: Int)
}

class addProfitViewController: UIViewController {
    
    var profitDelegate: ProfitProtocol!
    
    @IBOutlet weak var addProfitButton: UIButton!
    @IBOutlet weak var profitTextField: UITextField!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var areaView: UIView!
    
    @IBAction func cleanerPassed(_ sender: Any) {
        let text = profitTextField.text!
        let createInt = Int(text)!
        let total = createInt/10
        profitTextField.text = String(total)
    }
               
    @IBAction func numberPressed(_ sender: UIButton) {
        addProfitButton.alpha = 0.8
        profitTextField.text = profitTextField.text! + String(sender.tag)
    }
    
    let settingsButton = SettingsProfitButton()
    let settingsLabel = SettingsLabel()
    var nameAddProfitButtom = "Добавить доход"
    let nameLabel = "Сумма:"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsButton.setting(button: addProfitButton, setTitle: nameAddProfitButtom, backgtoundCollorButton: .blue, subTitle: nil, alfa: 0.2, cornerRadius: 12)
        settingsLabel.setting(label: sumLabel, text: nameLabel)
        pushButton()
        changeTF()
    }
    
    func changeTF() {
        profitTextField.addTarget(self, action: #selector(charge), for: .allEditingEvents)
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
        guard let text = profitTextField.text, text.count < 10
        else {
            let alert = UIAlertController(title: "Введено некоректное значение", message: " Нажмите закрыть и попробуйте указать другое значение", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel))
            self.present(alert, animated: true)
            profitTextField.text = ""
            return
        }
        if let numbersTF = Int(text) {
            profitDelegate.add(profit: Int(numbersTF))
            profitTextField.text = ""
        }
    }
}

