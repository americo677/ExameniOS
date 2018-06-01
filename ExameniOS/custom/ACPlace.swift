//
//  ACPlace.swift
//  ExameniOS
//
//  Created by Américo Cantillo on 30/05/18.
//  Copyright © 2018 Américo Cantillo Gutiérrez. All rights reserved.
//

import Foundation

class ACPlace {
    var _formatted_address: String!
    var _latitud: String!
    var _longitud: String!
    var _icon: Data!
    var _iconurl: String!
    var _name: String!
    
    var formatted_address: String {
        if _formatted_address == nil {
            _formatted_address = ""
        }
        return _formatted_address
    }
    
    var latitud: String {
        if _latitud == nil {
            _latitud = ""
        }
        return _latitud
    }
    
    var longitud: String {
        if _longitud == nil {
            _longitud = ""
        }
        return _longitud
    }
    
    var iconurl: String {
        if _iconurl == nil {
            _iconurl = ""
        }
        return _iconurl
    }
    
    var icon: Data? {
        if _iconurl == nil {
            _icon = nil
        }
        return _icon
    }
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    init() {
        _formatted_address = nil
        _latitud = nil
        _longitud = nil
        _iconurl = nil
        _icon = nil
        _name = nil
    }
    
}
