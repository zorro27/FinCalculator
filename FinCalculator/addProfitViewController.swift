//
//  addProfitViewController.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 15.10.2022.
//

import UIKit

protocol ProfitProtocol {
    func add (profit: String, color: UIColor)
}

class addProfitViewController: UIViewController {
    
    var profitDelegate: ProfitProtocol!

    @IBOutlet weak var addProfitButton: UIButton!
    @IBOutlet weak var ProfitTextField: UITextField!
    @IBOutlet weak var SumLabel: UILabel!
    
    let settingsButton = settingsProfitButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsButton.setting(button: addProfitButton, nameButton: "Добавить доход")
        pushButton()
    }
    
    func pushButton(){
        addProfitButton.addTarget(self, action: #selector(add), for: .touchUpInside)
    }
    
    @objc func add() {
        profitDelegate.add(profit: "10", color: .white)
        dismiss(animated: true)
    }
}
