//
//  assistantFile.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 07.02.2023.
//

import Foundation
import UIKit

func controllerCall() -> (UIViewController?){
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let vc = storyboard.instantiateViewController(withIdentifier: "addProfitViewController") as? addProfitViewController else {return nil}
        if let sheet = vc.sheetPresentationController{
        sheet.detents = [.medium()]
        sheet.preferredCornerRadius = 30
    }
    return vc
}

func separatedNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        let str = formatter.string(from: number as NSNumber)!
    return String(str)
}

func sumValue(array: [Int]) -> String {
        let sum = array.reduce(0, +)
        let separateNum = separatedNumber(sum)
        return String(separateNum) + ",00 руб"
}
