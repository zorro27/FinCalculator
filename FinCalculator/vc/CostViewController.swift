//
//  CostViewController.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 17.01.2023.
//

import UIKit
import SnapKit

class CostViewController: UIViewController {
    var costArray:[Int] = []
    let table = UITableView()
    let button = UIButton(type: .system)
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        settingButton()
        settingTable()
        settingLabel()
        tapButton()
    }
}

extension CostViewController: UITableViewDelegate, UITableViewDataSource, ProfitProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        let value = costArray[indexPath.row]
        let separatedNum = separatedNumber(value)
        cell.textLabel?.text = "- " + separatedNum + ",00 руб"
        return cell
    }
    
    private func settingView()  {
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 64/255, alpha: 1)
    }
    private func settingLabel() {
        label.text = "Сумма:"
        label.font = UIFont(name: "Helvetica", size: 22)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(30)
        }
    }
    private func settingTable(){
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(label).inset(20)
            make.bottom.equalTo(button).inset(80)
        }
    }
    private func settingButton(){
        button.setTitle("Добавить расход", for: .normal)
        button.backgroundColor = UIColor(red: 99/255, green: 89/255, blue: 233/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitleColor(.white, for: .normal)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(60)
            make.height.equalTo(40)
            make.bottom.equalToSuperview().inset(100)
        }
    }
    
    
    
    private func tapButton(){
        button.addTarget(nil, action: #selector(addCost), for: .touchUpInside)
    }
    @objc func addCost() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "addProfitViewController") as? addProfitViewController else {return}
        vc.nameAddProfitButtom = "Добавить расход"
        if let sheet = vc.sheetPresentationController{
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 30
        }
        vc.profitDelegate = self
        present(vc, animated: true)
    }
    func add(profit: Int) {
        costArray.append(profit)
        label.text = "Сумма: " + sumValue(array: costArray)
        table.reloadData()
    }
}
