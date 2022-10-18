//
//  PresentationController.swift
//  FinCalculator
//
//  Created by Роман Зобнин on 16.10.2022.
//

import Foundation
import UIKit

class HalfSizePresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let bounds = containerView?.bounds else { return .zero }
        return CGRect(x: 0, y: bounds.height / 3, width: bounds.width, height: bounds.height / 1)
    }
}
