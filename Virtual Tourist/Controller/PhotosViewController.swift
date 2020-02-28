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
    /* let testImage = ["https://live.staticflickr.com/640/22942476064_21d7c40689.jpg" , "https://live.staticflickr.com/5704/22943578243_115f3990de.jpg" , "https://live.staticflickr.com/5633/23570182065_a00c00afaf.jpg" , "https://live.staticflickr.com/723/23570672465_928628aeb1.jpg" , "https://live.staticflickr.com/7368/11410777173_ebe84d73d9.jpg" ,
     "https://live.staticflickr.com/5704/22943578243_115f3990de.jpg" , "https://live.staticflickr.com/5633/23570182065_a00c00afaf.jpg" , "https://live.staticflickr.com/723/23570672465_928628aeb1.jpg" , "https://live.staticflickr.com/7368/11410777173_ebe84d73d9.jpg"
     
     ] ;*/
    
    
    var album:Album!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadStartLocation()
        loadPhotos()
        
        
    }
    
    
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
    
   
    
    func loadPhotos(){
        if let album = album {
            if album.photo?.count == 0 {
                loadPhotosFromURL(album)
            }else {
                print ("hassan Loading photos from database 😇")
                DataController.loadPhotosFromDatabase(album: album) { (photos, error) in
                    guard error == nil else {
                        return
                    }
                    self.Photos1 = photos
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }
            
        }
        
    }
    fileprivate func loadPhotosFromURL(_ album: Album) {
           print ("hassan loading data from url ")
            Photos1 = [Photo]()
           DataController.loadPhotosForAblum(album: album) { (photoResponse, error) in
               if let photoResponse = photoResponse{
                   
                   
                   self.savePhotosToDatabase(photoResopnse: photoResponse)
                   print ("Start Loading photos ")
                   
               }else {
                   print ("error in photos : \(error)")
               }
           }
       }
    
    func savePhotosToDatabase(photoResopnse:[PhotoResponse]){
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
        
    }
    
    @IBAction func newCollectionClick(_ sender: Any) {
        loadPhotosFromURL(album)
    }
    
  
}




extension PhotosViewController:MKMapViewDelegate{
    
}

extension PhotosViewController:UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if Photos1.count > 0 {
            showMsgNoData(show: false)
             return   Photos1.count
        }else {
            showMsgNoData(show: true)
            return 0
        }
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        
        if let data = Photos1[indexPath.row].photo_image {
            let  image = UIImage(data: data)!
            cell.photoImageView.image = image
            
            
        }
        
        return cell
    }
    
    
    func showMsgNoData(show:Bool){
        if show {
            let labelSize = CGRect(x: 0, y: 0, width: collectionView.bounds.width, height: collectionView.bounds.height)
            let label = UILabel(frame: labelSize)
            label.text = "No photos available"
            label.textAlignment = .center
            collectionView.backgroundView = label
        }else{
            collectionView.backgroundView  = nil
        }
        
    }
    
    
}






extension PhotosViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(view.frame.size.width)
        let space = 3
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

