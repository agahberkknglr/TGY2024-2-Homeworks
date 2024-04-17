//
//  MapViewController.swift
//  Week-4
//
//  Created by Agah Berkin Güler on 5.04.2024.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var lastLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        checkLocationServices()
        mapView.delegate = self
        
    }
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            //Mark: - kullaniciya aralarlardan konum servislerini acmak icin yonlendirin
        }
    }
    
    private func setupLocationManager() {
        print("Location manager")
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationAuthorization() {
        
        switch CLLocationManager.authorizationStatus() {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            print("Kullanici izin vermis")
            trackingLocation()
            break
        }
    }
    
    private func showUserLocationCenterMap() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: true)
        }
    }
    
    private func getCenterLocation(_ mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func trackingLocation() {
        mapView.showsUserLocation = true
        showUserLocationCenterMap()
        locationManager.startUpdatingLocation()
        lastLocation = getCenterLocation(mapView)
    }

}

extension MapViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("mavview extension")
        let center = getCenterLocation(mapView)
        let geoCoder = CLGeocoder()
        print("center is: \(center)")
        
        guard let lastLocation else { return }
        
        guard center.distance(from: lastLocation) > 30 else { return }
        self.lastLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] placemarks, error in
            guard let self else { return }
            
            if let error {
                print("Hata: \(error)")
                return
            }
            
            guard let placemark = placemarks?.first else {return}
            let city1 = placemark.administrativeArea ?? "city"// il
            let city2 = placemark.locality ?? "City" //ilce
            let street = placemark.thoroughfare ?? "Street"
            let doorNumber = placemark.subThoroughfare ?? "DoorNumber"
            let city3 = placemark.subLocality ?? "aa" //??? semt?
            
            self.addressLabel.text = "\(city1) ~ \(city2) ~ \(street) ~ \(doorNumber)"
        }
    }
}


// kullanicinin konumu da pin ile hareket etmeli
// sehir ilce sokak kapi noya kadar almaya calisiniz
// hava durumu app
