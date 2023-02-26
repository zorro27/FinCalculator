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
    var testDate: [String] = []
    var totalScore: Int = 0
    let settingButton = SettingsProfitButton()
    let settingLabel = SettingsLabel()
    let balance = "Текущий баланс:"
    let nameButton = "Добавить доход"
    let startValue = "0 руб."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profitTable.dataSource = self
        self.profitTable.delegate = self
        settingLabel.setting(label: balanceLabel, text: balance)
        settingLabel.setting(label: valueLabel, text: sumValue(array: testTable))
        settingButton.setting(button: addProfitButton, setTitle: nameButton, backgtoundCollorButton: .blue, subTitle: nil, alfa: 0.8, cornerRadius: 12)
        profitTable.backgroundColor = .clear
        pushButton()
        //Необходимо передалать в отдельную функцию
        if let value = UserDefaults.standard.array(forKey: "profit") as? [Int] {
            testTable += value
            valueLabel.text = sumValue(array: testTable)
            if let value = UserDefaults.standard.array(forKey: "date") as? [String] {
                testDate += value
            }
        }
    }
}

extension ProfitController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.profitTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.font = UIFont(name: "Helvetica", size: 22)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        let value = testTable[indexPath.row]
        cell.detailTextLabel?.text = testDate[indexPath.row]
        let separatedNum = separatedNumber(value)
        cell.textLabel?.text = "+ " + separatedNum + ",00 руб"
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
            sheet.preferredCornerRadius = 30
        }
        vc.profitDelegate = self
        present(vc, animated: true)
    }
}

extension ProfitController: ProfitProtocol{

    func add(profit: Int, date: String) {
        testTable.append(profit)
        testDate.append(date)
        UserDefaults.standard.set(testTable, forKey: "profit")
        UserDefaults.standard.set(testDate, forKey: "date")
        UserDefaults.standard.synchronize()
        valueLabel.text = sumValue(array: testTable)
        profitTable.reloadData()
    }
}
