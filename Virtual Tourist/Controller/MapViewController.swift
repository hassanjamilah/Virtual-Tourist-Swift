//
//  MapViewController.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import UIKit
import MapKit
import CoreData
class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let GestRecognize = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation))
        GestRecognize.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(GestRecognize)
        
        let allPoints = DataController.loadAllPins()
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(allPoints)
        
    }
    
    
    
    @objc func addAnnotation(gestRecognizer:UIGestureRecognizer){
        
        if gestRecognizer.state == UIGestureRecognizer.State.began {
            print ("Location saved")
            let   pin = MKPointAnnotation()
            let touchLoc = gestRecognizer.location(in: mapView)
            let coordinate = mapView.convert(touchLoc, toCoordinateFrom: mapView)
            pin.coordinate = coordinate
            
            
            mapView.addAnnotation(pin)
            DataController.saveAlbum(lat: coordinate.latitude, long: coordinate.longitude)
        }
        
     
        
    }
    
}


//MARK: Map Delegate
extension MapViewController:MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let id = "Pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: id ) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print ("Hello")
    }
    
    
    
    
}




