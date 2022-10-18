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
    
    var testTable: [Int] = []
    var totalScore: Int = 0
    var seting = settingsProfitButton()
    let nameButton = "Добавить доход"
    let startValue = "0 руб."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ProfitTable.dataSource = self
        self.ProfitTable.delegate = self
        seting.setting(button: AddProfitButton, nameButton: nameButton)
        pushButton()
        sumValue()
        ValueLabel.text = startValue
    }
}

extension ProfitController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ProfitTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let value = String(testTable[indexPath.row])
        cell.textLabel?.text = value
        return cell
    }
    
    func pushButton() {
        AddProfitButton.addTarget(self, action: #selector(addProfit), for: .touchUpInside)
    }
    @objc func addProfit() {
        self.view.backgroundColor = .lightGray
        self.ProfitTable.backgroundColor = .lightGray
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
            ValueLabel.text = startValue
        } else {
            var sum = testTable.reduce(0, +)
            ValueLabel.text = String(sum)
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
        ProfitTable.reloadData()
    }
}

