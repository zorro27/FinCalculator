//
//  ProfitController.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 12.10.2022.
//

import UIKit
import Foundation

class ProfitController: UIViewController {
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var profitTable: UITableView!
    @IBOutlet weak var addProfitButton: UIButton!
    
    var testTable: [Int] = []
    var totalScore: Int = 0
    let settingButton = SettingsProfitButton()
    let settingLabel = SettingsLabel()
    let balance = "Текущий баланс"
    let nameButton = "Добавить доход"
    let startValue = "0 руб."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profitTable.dataSource = self
        self.profitTable.delegate = self
        settingLabel.setting(label: balanceLabel, text: balance)
        settingLabel.setting(label: valueLabel, text: startValue)
        settingButton.setting(button: addProfitButton, setTitle: nameButton, backgtoundCollorButton: .blue, subTitle: nil, alfa: 0.8, cornerRadius: 12)
        pushButton()
        sumValue()
        let size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        print(size.height)
        print (size.width)
    }
}

extension ProfitController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.profitTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let value = testTable[indexPath.row]
        let separatedNum = separatedNumber(value)
        cell.textLabel?.text = separatedNum + ",00 руб"
        return cell
    }
    
    func pushButton() {
        addProfitButton.addTarget(self, action: #selector(addProfit), for: .touchUpInside)
    }
    @objc func addProfit() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "addProfitViewController") as? addProfitViewController else {return}
        if let sheet = vc.sheetPresentationController{
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 20
        }
        vc.profitDelegate = self
        present(vc, animated: true)
    }
}

extension ProfitController{
    func sumValue() {
        if testTable.isEmpty {
            valueLabel.text = startValue
        } else {
            let sum = testTable.reduce(0, +)
            let separateNum = separatedNumber(sum)
            valueLabel.text = String(separateNum) + ",00 руб"
        }
    }
}

extension ProfitController: ProfitProtocol{
    func add(profit: Int) {
        testTable.append(profit)
        sumValue()
        profitTable.reloadData()
    }
}

extension ProfitController {
    func separatedNumber(_ number: Int) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = " "
            let str = formatter.string(from: number as NSNumber)!
        return String(str)
    }
}
