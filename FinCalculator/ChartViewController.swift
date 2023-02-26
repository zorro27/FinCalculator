//
//  ChartViewController.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 09.02.2023.
//

import UIKit
import Charts

class ChartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLineChart()
        view.backgroundColor = .lightGray
    }
}

extension ChartViewController {
    private func createLineChart() {
        let lineChart = LineChartView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        
    

        var entriesX = [ChartDataEntry]()
        for x in 0 ..< 10{
            entriesX.append(ChartDataEntry(x: Double(x),
                                           y: Double.random(in: 0...10)))
        }
        

        let set1 = LineChartDataSet(entries: entriesX, label: "Траты")
                            
       
        let data = LineChartData(dataSet: set1)
        lineChart.data = data
        view.addSubview(lineChart)
        lineChart.center = view.center
    }
}
