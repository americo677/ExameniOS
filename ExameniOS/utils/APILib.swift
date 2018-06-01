//
//  APILib.swift
//  ExameniOS
//
//  Created by Américo Cantillo on 30/05/18.
//  Copyright © 2018 Américo Cantillo Gutiérrez. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation


public class APILib {
    
    func getPlaces(searchText: String, searchType: String, coords: CLLocationCoordinate2D, radius: Double, completed: @escaping Places) {
        
        let lat = coords.latitude as Double
        var latitud: String? = valorFormateado(valor: lat, decimales: 15)
        
        let lon = coords.longitude as Double
        let longitud: String? = valorFormateado(valor: lon, decimales: 15)

        var places = [ACPlace]()
        
        let radio: String? = NumberFormatter().string(from: NSNumber.init(value: radius))
        
        let filter: String? = searchText
        
        
        let type: String? = searchType
        
        
        let url_with_api: String = Global.API_PLACES_SEARCH.replacingOccurrences(of: "#API_KEY#", with: Global.GOOGLE_API_KEY, options: .literal, range: nil)
        
        let url_with_type = url_with_api.replacingOccurrences(of: "#TYPE#", with: type!, options: .literal, range: nil)
        
        let url_with_filter = url_with_type.replacingOccurrences(of: "#FILTER#", with: filter!, options: .literal, range: nil)
        
        let url_with_radius = url_with_filter.replacingOccurrences(of: "#RADIUS#", with: radio!, options: .literal, range: nil)
        
        let url_with_lat: String = url_with_radius.replacingOccurrences(of: "#LATITUD#", with: latitud!, options: .literal, range: nil)
        
        let url_final: NSString = url_with_lat.replacingOccurrences(of: "#LONGITUD#", with: longitud!, options: .literal, range: nil) as NSString
        
        
        //print("URL: \(url_final)")
        
        let url = url_final.replacingOccurrences(of: " ", with: "%20")
        
        print("URL: \(url)")

        var request: URLRequest?
        
        if let urlRequest: NSURL = NSURL(string: url as String) {
            request = URLRequest(url: urlRequest as URL)
        } else {
            print("No se pudo convertir el string de la URL")
            return
        }
        
        
        DispatchQueue.main.async(execute: {
            
            let _ = URLSession.shared.dataTask(with: request! as URLRequest) { data, response, error in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                
                // no hay errores
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? Dictionary<String, AnyObject> {
                        
                        //print(json)
                        if let results = json["results"] as? [Dictionary<String, AnyObject>] {
                         
                            var place = ACPlace()
                            
                            for item in results {
                         
                            
                                if let name = item["name"] as? String {
                                    //print(name)
                                    place._name = name
                                }
                         
                                if let icon = item["icon"] as? String {
                                    //print(icon)
                                    place._iconurl = icon
                                    if place._iconurl != "" {
                                        let urlData = URL.init(string: icon)
                                        do {
                                            let dataImage: Data = try Data.init(contentsOf: urlData!)
                                            
                                            place._icon = dataImage
                                        } catch {
                                            print("Error downloading image.  \(error.localizedDescription)")
                                        }
                                    }
                                }
                                if let geometry = item["geometry"] as? Dictionary<String, AnyObject> {
                                    
                                    //for geometry in geometries {
                                        if let location = geometry["location"] as? Dictionary<String, AnyObject> {
                                            
                                            //for location in locations {
                                                if let data_lat = location["lat"] as? Double {
                                                    //print(data_lat)
                                                    place._latitud =  valorFormateado(valor: data_lat, decimales: 15)
                                                }
                                                if let data_lng = location["lng"] as? Double {
                                                    //print(data_lng)
                                                    place._longitud = valorFormateado(valor: data_lng, decimales: 15)
                                                }
                                            //}
                                            
                                        }
                                   // }
                                }
                                places.append(place)
                            } // for item in results

                        }
                        
                     }
                    completed(places)
                 } catch {
                     print("Failure on request API.  It is not possible downloading the data: \(error.localizedDescription)")
                 }
                
            }.resume()
                
        })
        
    }

}
