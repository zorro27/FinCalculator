//
//  ProfitController.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 12.10.2022.
//

import UIKit

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
        settingButton.setting(button: addProfitButton, alfa: 0.9)
        pushButton()
        sumValue()
    }
}

extension ProfitController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.profitTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let value = String(testTable[indexPath.row])
        cell.textLabel?.text = value
        return cell
    }
    
    func pushButton() {
        addProfitButton.addTarget(self, action: #selector(addProfit), for: .touchUpInside)
    }
    @objc func addProfit() {
        self.view.backgroundColor = .lightGray
        self.profitTable.backgroundColor = .lightGray
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "addProfitViewController") as? addProfitViewController else {return}
        //vc.modalPresentationStyle = .custom
        //vc.transitioningDelegate = self
        vc.profitDelegate = self
        present(vc, animated: true)
    }
    
//    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
//            return HalfSizePresentationController(presentedViewController: presented, presenting: presentingViewController)
//        }
}
extension ProfitController{
    func sumValue() {
        if testTable.isEmpty {
            valueLabel.text = startValue
        } else {
            let sum = testTable.reduce(0, +)
            valueLabel.text = String(sum)
        }
    }
}

extension ProfitController: UIViewControllerTransitioningDelegate, UIAdaptivePresentationControllerDelegate {
    
}

extension ProfitController: ProfitProtocol{
    func add(profit: Int, color: UIColor) {
        testTable.append(profit)
        self.view.backgroundColor = color
        sumValue()
        profitTable.reloadData()
    }
}

