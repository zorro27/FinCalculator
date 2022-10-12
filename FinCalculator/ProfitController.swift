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
    @IBOutlet weak var AddProfitButton: UIButton!
    @IBOutlet weak var ProfitTable: UITableView!
    
    let a = ["1","2","3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ProfitTable.dataSource = self
        self.ProfitTable.delegate = self
    }
}

extension ProfitController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        a.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ProfitTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = a[indexPath.row]
        print("таблица дошла")
        return cell
    }
}
