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
        layoutConstraints()
        settingView()
        settingLabel()
        settingTable()
        settingButton()
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
    
    func layoutConstraints () {
        view.addSubview(label)
        view.addSubview(table)
        view.addSubview(button)
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        table.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        button.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(60)
            make.top.equalTo(table.snp.bottom).inset(20)
            make.height.equalTo(40)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    private func settingLabel() {
        label.text = "Сумма:"
        label.font = UIFont(name: "Helvetica", size: 22)
        label.tintColor = .white
    }
    private func settingTable(){
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
    }
    private func settingButton(){
        button.setTitle("Добавить расход", for: .normal)
        button.backgroundColor = UIColor(red: 99/255, green: 89/255, blue: 233/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitleColor(.white, for: .normal)
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
