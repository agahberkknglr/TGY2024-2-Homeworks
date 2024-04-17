//
//  ToDoCreateViewController.swift
//  ToDoApp
//
//  Created by Agah Berkin Güler on 13.04.2024.
//

import UIKit
import Photos
import CoreData
import MapKit
import CoreLocation

class ToDoCreateViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var todoImage: UIImageView!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationLabel: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        todoImage?.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        todoImage.addGestureRecognizer(tap)
        self.navigationController?.navigationBar.tintColor = UIColor.systemPurple
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        
        
    }
    
    @objc func chooseImage() {
            
            let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
            switch photoAuthorizationStatus {
            case .authorized:
                presentImagePicker()
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { (status) in
                    if status == .authorized {
                        DispatchQueue.main.async {
                            self.presentImagePicker()
                        }
                    } else {
                        print("Fotoğraf izni reddedildi veya sınırlı.")
                    }
                }
            case .denied, .restricted, .limited:
                print("Fotoğraf izni reddedildi veya sınırlı.")
            @unknown default:
                break
            }
        }
    
    func presentImagePicker() {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            present(picker, animated: true)
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                todoImage.image = selectedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    
    @IBAction func locationButtonClicked(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
                let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                mapView.setRegion(region, animated: true)
                
                let latitude = location.coordinate.latitude
                let longitude = location.coordinate.longitude
                let center = CLLocation(latitude: latitude, longitude: longitude)
                let geoCoder = CLGeocoder()
                geoCoder.reverseGeocodeLocation(center) { [weak self] placemark, error in
                    guard let self else { return }
                    
                    if let error {
                        print("Hata: \(error)")
                        return
                    }
                    
                    guard let placemark = placemark?.first else { return }
                    let cityName = placemark.administrativeArea ?? ""
                    let cityDistrict = placemark.locality ?? ""
                    let cityStreet = placemark.thoroughfare ?? ""
                    let cityDoor = placemark.subThoroughfare ?? ""
                    
                    self.locationLabel.text = "\(cityName) \(cityDistrict) \(cityStreet) \(cityDoor)"
                }
            }
        }
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Location manager failed with error: \(error.localizedDescription)")
    }
    
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let newTodo = NSEntityDescription.insertNewObject(forEntityName: "Todos", into: context)
        
        let imageData = todoImage.image?.jpegData(compressionQuality: 0.5)
        let statusData = 0
        
        let latitudeData = locationManager.location?.coordinate.latitude ?? 0.0
        let longitudeData = locationManager.location?.coordinate.longitude ?? 0.0
        
        let locationData = locationLabel.text ?? ""

        
        newTodo.setValue(imageData, forKey: "image")
        newTodo.setValue(todoTextField.text, forKey: "name")
        newTodo.setValue(statusData, forKey: "status")
        newTodo.setValue(latitudeData, forKey: "latitude")
        newTodo.setValue(longitudeData, forKey: "longitude")
        newTodo.setValue(locationData, forKey: "location")
        
        
        do {
            try context.save()
            print("Data kaydedildi.. \(String(describing: todoTextField.text))")
        } catch {
            print("Data kaydedilemedi!..")
        }
        
        navigationController?.popViewController(animated: true)
    }
    

}
