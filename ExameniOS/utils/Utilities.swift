//
//  Utilities.swift
//  ExameniOS
//
//  Created by Américo Cantillo on 31/05/18.
//  Copyright © 2018 Américo Cantillo Gutiérrez. All rights reserved.
//

import Foundation


func valorFormateado(valor: Double, decimales: Int, estilo: NumberFormatter.Style = .none) -> String {
    let fmtNumber = NumberFormatter()
    
    fmtNumber.decimalSeparator = "."
    fmtNumber.numberStyle = estilo
    fmtNumber.maximumFractionDigits = decimales
    
    return fmtNumber.string(from: NSNumber.init(value: valor))!
}
