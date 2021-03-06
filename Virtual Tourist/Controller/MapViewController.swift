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
    
    
    let LAST_LAT_USERDEFAULTS_KEY = "lastlat"
    let LAST_LONG_USERDEFAULTS_KEY = "lastlong"
    let LAST_SPAN_LAT_USERDEFAULTS_KEY = "lastSpanLat"
    let LAST_SPAN_LONG_USERDEFAULTS_KEY = "lastSpanLong"
    
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let GestRecognize = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation))
        GestRecognize.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(GestRecognize)
        
        setLastRegion()
        
        let allPoints = DataController.loadAllPins()
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(allPoints)
        
    }
    
    
    /**
     Set the map to the last location
     */
    func setLastRegion(){
        let lat = UserDefaults.standard.value(forKey: LAST_LAT_USERDEFAULTS_KEY) as? Double
        let long = UserDefaults.standard.value(forKey: LAST_LONG_USERDEFAULTS_KEY) as? Double
        let span_lat = UserDefaults.standard.value(forKey: LAST_SPAN_LAT_USERDEFAULTS_KEY) as? Double
        let span_long = UserDefaults.standard.value(forKey: LAST_SPAN_LONG_USERDEFAULTS_KEY) as? Double
        
        guard let lat1 = lat , let long1 = long  , let span_lat1 = span_lat , let span_long1 = span_long else {
            return
        }
        
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat1, longitude: long1) , span: MKCoordinateSpan(latitudeDelta: span_lat1, longitudeDelta: span_long1))
        
        mapView.setRegion(region, animated: true)
        
    }
    
    
    /**
     Add Annotation 
     */
    @objc func addAnnotation(gestRecognizer:UIGestureRecognizer){
        
        if gestRecognizer.state == UIGestureRecognizer.State.began {
            print ("Location saved")
            let   pin = MKPointAnnotation()
            let touchLoc = gestRecognizer.location(in: mapView)
            let coordinate = mapView.convert(touchLoc, toCoordinateFrom: mapView)
            pin.coordinate = coordinate
            let album:Album = Album(context: DataController.dataController.context)
            album.latitude = coordinate.latitude
            album.longitude = coordinate.longitude
            
            self.mapView.addAnnotation(pin)
            self.mapView.deselectAnnotation(pin, animated: true)
            DataController.saveAlbum(album: album)
                  
            
            
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
        print ("Pin Selected")
        if let coordinate = view.annotation?.coordinate{
            if let album = DataController.getAlbumByCoordinates(coordinate: coordinate){
                let controller = self.storyboard?.instantiateViewController(identifier: "PhotosViewController") as! PhotosViewController
                controller.album = album
                performSegue(withIdentifier: "toPhotoAlbum", sender:album )
                mapView.deselectAnnotation(view.annotation, animated: true)
                //present(controller, animated: true, completion: nil )
            }else {
                debugPrint ("error presenting view controller")
            }
        }
        
      
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? PhotosViewController else {
            return
        }
        guard let album = sender as? Album else {
            return
        }
        controller.album = album
        
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let region = mapView.region
        UserDefaults.standard.set(region.center.latitude, forKey: LAST_LAT_USERDEFAULTS_KEY)
        UserDefaults.standard.set(region.center.longitude, forKey: LAST_LONG_USERDEFAULTS_KEY)
        UserDefaults.standard.set(region.span.latitudeDelta, forKey: LAST_SPAN_LAT_USERDEFAULTS_KEY)
        UserDefaults.standard.set(region.span.longitudeDelta, forKey: LAST_SPAN_LONG_USERDEFAULTS_KEY)
        print ("Region saved into user defaults \(region)")
        
    }
    
    
    
    
    
    
}




