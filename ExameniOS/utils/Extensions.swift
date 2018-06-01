//
//  Extensions.swift
//  ExameniOS
//
//  Created by Américo Cantillo on 1/06/18.
//  Copyright © 2018 Américo Cantillo Gutiérrez. All rights reserved.
//


import Foundation
import UIKit
//import GoogleMobileAds
import StoreKit
import CoreData

// Put this piece of code anywhere you like
extension UIViewController {


    // MARK: - Procedimiento para ocultar el teclado al tocar la pantalla en cualquier punto
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    // MARK: - Para terminar la edición de un UITextField
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

