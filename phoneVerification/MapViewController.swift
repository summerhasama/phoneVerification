//
//  MapViewController.swift
//  phoneVerification
//
//  Created by Summer Hasama on 1/2/21.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self

         
          if CLLocationManager.locationServicesEnabled() {
     
            locationManager.requestLocation()

    
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
          } else {
   
            locationManager.requestWhenInUseAuthorization()
          }
        }

}



extension MapViewController: CLLocationManagerDelegate {
  
  func locationManager(
    _ manager: CLLocationManager,
    didChangeAuthorization status: CLAuthorizationStatus
  ) {
  
    guard status == .authorizedWhenInUse else {
      return
    }
  
    locationManager.requestLocation()

  
    mapView.isMyLocationEnabled = true
    mapView.settings.myLocationButton = true
  }


  func locationManager(
    _ manager: CLLocationManager,
    didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }


    mapView.camera = GMSCameraPosition(
      target: location.coordinate,
      zoom: 15,
      bearing: 0,
      viewingAngle: 0)
  }


  func locationManager(
    _ manager: CLLocationManager,
    didFailWithError error: Error
  ) {
    print(error)
  }
}
