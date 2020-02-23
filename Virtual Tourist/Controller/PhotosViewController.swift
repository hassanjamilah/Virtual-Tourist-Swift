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
    
    var photos = [PhotoResponse]()
    var images = [UIImage]()
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
            if album.owner_code == nil {
                print ("album is empty")
                DataController.loadPhotosForAblum(album: album) { (photoResponse, error) in
                    if let photoResponse = photoResponse{
                        self.photos = photoResponse
                        
                        
                        self.savePhotosToDatabase(photoResopnse: photoResponse)
                        
                    }else {
                        print ("error in photos : \(error)")
                    }
                }
            }else {
                
                print ("Loading photos from database 😇")
                DataController.loadPhotosFromDatabase(album: album)
            }
        }
        
    }
    
    
    func savePhotosToDatabase(photoResopnse:[PhotoResponse]){
        var i = 0 ;
        for photo in photoResopnse{
            let url = URL(string: photo.photoURL)
            if let url = url {
                FlickerApiCaller.loadImage(url: url) { (image, error) in
                    if let image = image {
                        DataController.savePhotoToDatabase(image: image, owner: photo.owner)
                        print ("hassan image saved to database : \(photo.owner)")
                        self.images.append(image)
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                            
                        }
                    }else {
                    }
                    
                }
            }
            
        }
        
    }
    
    
}




extension PhotosViewController:MKMapViewDelegate{
    
}

extension PhotosViewController:UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photoResponse = photos[indexPath.row]
        let urlStr = photos[indexPath.row].photoURL
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.photoImageView.image = images[indexPath.row]
        cell.urlString = photos[indexPath.row].photoURL
         return cell
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

