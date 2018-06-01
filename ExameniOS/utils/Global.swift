//
//  Global.swift
//  ExameniOS
//
//  Created by Américo Cantillo on 29/05/18.
//  Copyright © 2018 Américo Cantillo Gutiérrez. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation


struct Global {
    
    static let CORNER_RADIUS: CGFloat = 12.0
    static let SHADOW_COLOR: CGFloat = 157.0 / 255.0
    
    static let GOOGLE_API_KEY: String = "AIzaSyCFJXBk9Qo1eDtM9UhdCZRqxXmLRjW71s0"
    
    static let API_PLACES_SEARCH = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#LATITUD#,#LONGITUD#&radius=#RADIUS#&type=#TYPE#&keyword=#FILTER#&key=#API_KEY#"
    
    static let RADIUS_COORDINATE: Double = 1500
    
    //static let API_MY_LOCATION = "https://www.googleapis.com/geolocation/v1/geolocate?key="
    
    static let KEY_UID: String = "uid"
    
    static let keychain = UserDefaults.standard
    
    static let APP_TITLE: String = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
    
    static let ERROR_CODE_TAG: String = "Code="
    
    struct segue {
        static let toMain: String = "segueMain"
    }
    
    struct title {
        static let EMAIL: String = "Registro de Email"
    }
    
    struct ACLocation {
        
        var latitud: Double? = 0
        var longitud: Double? = 0
        var radius: Double? = 0
        var name: String? = ""
        
    }
    
    var userLocation: ACLocation?
    
    struct message {
        static let EMAIL: String = "Email y/o contraseña invalidos.  Por favor verifique."
        static let PASSWORD_SIZE: String = "La contraseña debe tener 6 ó más caracteres.  Por favor verifique."
        static let PASSWORD_WRONG: String = "La contraseña ingresada para su cuenta de correo no es válida.  Por favor verifique."
        static let NEW_USER: String = "Se ha registrado con éxito su cuenta de correo para el uso de la aplicación."
        static let ERROR_NETWORK: String = "No se pudo establecer conexión con el servidor.  Por favor intente más tarde."
    }
    
    struct errcode {
        static let ERROR_USER_NOT_FOUND: String = "17011"
        static let ERROR_WRONG_PASSWORD: String = "17009"
        static let TIME_OUT: String = "-1001"
    }
}
