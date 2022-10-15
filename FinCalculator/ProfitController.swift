//
//  ProfitController.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 12.10.2022.
//

import UIKit

class ProfitController: UIViewController {
    
    @IBOutlet weak var BalanceLabel: UILabel!
    @IBOutlet weak var ValueLabel: UILabel!
    @IBOutlet weak var ProfitTable: UITableView!
    @IBOutlet weak var AddProfitButton: UIButton!
    
//    testTable.append("1")
//    totalScore += 500
//    ValueLabel.text = String(totalScore) + "руб."
//    print (totalScore)
//    ProfitTable.reloadData()
    
    var testTable: [String] = []
    var totalScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ProfitTable.dataSource = self
        self.ProfitTable.delegate = self
        settingsButton(button: AddProfitButton)
        pushButton()
        ValueLabel.text = "0 руб."
    }
}

extension ProfitController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ProfitTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = testTable[indexPath.row]
        return cell
    }
    
    func settingsButton(button: UIButton) {
        button.titleLabel?.text = "Добавить доход"
        button.backgroundColor = .blue
        button.alpha = 0.6
        button.tintColor = .white
        button.layer.cornerRadius = 10
    }
    
    func pushButton() {
        AddProfitButton.addTarget(self, action: #selector(addProfit), for: .touchUpInside)
    }
    @objc func addProfit() {
        testTable.append("1")
        totalScore += 500
        ValueLabel.text = String(totalScore) + "руб."
        ProfitTable.reloadData()
    }
}
