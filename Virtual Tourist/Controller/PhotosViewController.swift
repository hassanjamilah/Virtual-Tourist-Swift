//
//  PhotosViewController.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import UIKit
import MapKit
import CoreData
class PhotosViewController: UIViewController  {
    
    
    @IBOutlet weak var newCollectionButton: UIButton!
    var Photos1 = [Photo]()
    
    @IBOutlet weak var collectionFlowLayout: UICollectionViewFlowLayout!
    var album:Album!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStartLocation()
        loadPhotos()
    }
    
    /**
     Load the start location of the map
     */
    func loadStartLocation(){
        if let album = album {
            let coordinate = CLLocationCoordinate2D(latitude: album.latitude, longitude: album.longitude)
            let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            mapView.addAnnotation(pin)
            mapView.setRegion(region, animated: true)
        }
    }
    
    /**
     load the photos in the collection view
     */
    func loadPhotos(){
        if let album = album {
            
            DataController.loadPhotosFromDatabase(album: album) { (allPhotos, error) in
                if allPhotos.count == 0 || error != nil  {
                    self.loadPhotosFromURL(album)
                }else {
                    self.Photos1 = allPhotos
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }
            
            
        }
    }
    
    
    /**
     load photos from the url
     */
    fileprivate func loadPhotosFromURL(_ album: Album) {
        print ("hassan loading data from url ")
        Photos1 = [Photo]()
        disableNewCollectionButton(disable: true)
        DataController.loadPhotosForAblum(album: album) { (photoResponse, error) in
            if let photoResponse = photoResponse{
                
                self.showMsgNoData(show: false)
                self.savePhotosToDatabase(photoResopnse: photoResponse) { (finished) in
                    if finished {
                        DispatchQueue.main.async {
                            self.disableNewCollectionButton(disable: false)
                        }
                    }
                }
                print ("Start Loading photos ")
                
            }else {
                self.showMsgNoData(show: true)
                
            }
        }
    }
    
    /**
     Save the photos to the database
     */
    func savePhotosToDatabase(photoResopnse:[PhotoResponse] , handler:(Bool)->Void){
        DataController.deleteAllAblumPhotos(album: album)
        for photoResp in photoResopnse{
            if let url = URL(string: photoResp.photoURL){
                
                FlickerApiCaller.loadImage(url: url) { (imageData, error) in
                    if let imageData = imageData {
                        let photo = Photo(context: DataController.dataController.backgroundContext)
                        photo.photo_image = imageData
                        photo.photo_owner_code = photoResp.owner
                        photo.album = self.album
                        //photo.photo_url = photoResp.photoURL
                        
                        self.Photos1.append(photo)
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                            
                        }
                    }else {
                        print (error)
                    }
                    
                }
            }
            
        }
        DataController.savePhotoToDatabase()
        print ("Hassan all photos saved to database")
        handler(true)
        
    }
    
    @IBAction func newCollectionClick(_ sender: Any) {
        loadPhotosFromURL(album)
    }
    
    
}

//MARK: Collection View Delegate
extension PhotosViewController:UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return   Photos1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        
        if let data = Photos1[indexPath.row].photo_image {
            let  image = UIImage(data: data)!
            cell.photoImageView.image = image
            
            
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = Photos1[indexPath.row]
        DataController.deleteRow(photo: photo)
        Photos1.remove(at: indexPath.row)
        collectionView.reloadData()
    }
    
    func showMsgNoData(show:Bool){
        DispatchQueue.main.async {
            if show {
                let labelSize = CGRect(x: 0, y: 0, width: self.collectionView.bounds.width, height: self.collectionView.bounds.height)
                let label = UILabel(frame: labelSize)
                label.text = "No photos available"
                label.textAlignment = .center
                self.collectionView.backgroundView = label
                self.disableNewCollectionButton(disable: false)
            }else{
                self.collectionView.backgroundView  = nil
            }
        }
        
    }
    
    func disableNewCollectionButton (disable:Bool){
        if disable {
            newCollectionButton.isEnabled = false
            newCollectionButton.backgroundColor = UIColor.gray
            
        }else {
            newCollectionButton.isEnabled = true
            newCollectionButton.backgroundColor = UIColor.link
        }
    }
    
}





//MARK: The Collection View Flow layout control 
extension PhotosViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(view.frame.size.width)
        let space = 2
        let numInRow = 3
        let spacesSize = space * (numInRow - 1)
        let cellWidth = (width - spacesSize)/numInRow
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return -10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


extension PhotosViewController:NSFetchedResultsControllerDelegate{
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        //collectionView.reloadData()
        print("hassan there are changes")
    }
    
    
    
    
    
    
}

