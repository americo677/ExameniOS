//
//  VCConsultarLugar.swift
//  ExameniOS
//
//  Created by Américo Cantillo on 30/05/18.
//  Copyright © 2018 Américo Cantillo Gutiérrez. All rights reserved.
//

import UIKit
import MapKit


class VCConsultarLugar: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var viewHeader: UIView!
    
    @IBOutlet weak var txtSearch: UITextField!
    
    private let locationManager = LocationManager.shared
    
    private var userLocation: CLLocationCoordinate2D?
    
    private var places: [ACPlace] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.locationManager.startUpdatingLocation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.locationManager.stopUpdatingLocation()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.places.count > 0 {
            return self.places.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        
        print("Nombre: \(self.places[indexPath.row].name.capitalized)")
        print("Imagen: \(self.places[indexPath.row].iconurl)")
        
        cell.imageCell.image = UIImage(data: self.places[indexPath.row].icon!)
        cell.lblCell.text = self.places[indexPath.row].name.capitalized
        
        
        return cell
        
    }
    
    @IBAction func btnPruebaOnTouchUpInside(_ sender: UIButton) {
        
        if let searchPlace = self.txtSearch.text {
            let tipo_predefinido: String = "restaurant"
            
            APILib().getPlaces(searchText: searchPlace, searchType: tipo_predefinido, coords: self.userLocation!, radius: Global.RADIUS_COORDINATE, completed: {(Places) -> Void in
                
                self.places = Places
                //print(self.places)
                
                self.collectionView.reloadData()
            })
        }
    }
        
        
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VCConsultarLugar:  CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.userLocation = locations.last!.coordinate
        //print("Coordenasas usuario: Lat<\(self.userLocation?.latitude)> - Long<\(self.userLocation?.longitude)>)")
        
    }
    
}
