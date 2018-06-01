//
//  CustomView.swift
//  ExameniOS
//
//  Created by Américo Cantillo on 29/05/18.
//  Copyright © 2018 Américo Cantillo Gutiérrez. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {
    override func awakeFromNib() {
        layer.cornerRadius = 3.0
        layer.shadowColor = UIColor.init(red: Global.SHADOW_COLOR, green: Global.SHADOW_COLOR, blue: Global.SHADOW_COLOR, alpha: 0.5).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize.init(width: 0.0, height: 2.0)
    }
}
