//
//  DataController.swift
//  Virtual Tourist
//
//  Created by Hassan on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
import CoreData
import MapKit



class DataController{
    let persistanceContainer:NSPersistentContainer
    static var dataController:DataController!
    static var albumFetchedResultController:NSFetchedResultsController<Album>!
    static var photosFetchedResultController:NSFetchedResultsController<Photo>!
    var backgroundContext:NSManagedObjectContext!
    
    
    init(modelName:String) {
        persistanceContainer = NSPersistentContainer(name: modelName)
    }
    
    var context:NSManagedObjectContext {
        return persistanceContainer.viewContext
    }
    
    func prepareContexts(){
        backgroundContext = persistanceContainer.newBackgroundContext()
        
        context.automaticallyMergesChangesFromParent = true
        backgroundContext.automaticallyMergesChangesFromParent = true
        
        backgroundContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        context.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
    }
    
    func load(completion: (()->Void)? = nil ){
        persistanceContainer.loadPersistentStores { (storeDesc, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            self.prepareContexts()
            completion?()
            
        }
    }
    
    class func savePhotoToDatabase(){
        dataController.backgroundContext.perform {
            try? dataController.backgroundContext.save()
            print ("hassan image saved successfully")
        }
    }
    
    
}

//MARK: Extenstion for Controller the Album functionality
extension DataController{
    /**
     Save the album to the database
     */
    class func saveAlbum(album:Album){
        
        do {
            try dataController.context.save()
        }catch {
            print (error)
        }
    }
    
    
    /**
     Find the album in the database upon it's coordinate
     */
    class func setupFetchResultController(predicate predicate:NSPredicate?){
        let fetchRequest:NSFetchRequest<Album> = Album.fetchRequest()
        
        if let predicate = predicate {
            fetchRequest.predicate = predicate
            
        }
        
        let sortDescriptor = NSSortDescriptor(key: "latitude", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        albumFetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: DataController.dataController.backgroundContext, sectionNameKeyPath: nil, cacheName: nil )
    }
    
    /**
     Load all the albums from the database
     */
    class func loadAlbums()->NSFetchedResultsController<Album>{
        setupFetchResultController(predicate: nil)
        
        do{
            try albumFetchedResultController.performFetch()
        }catch {
            print ( "Error Fetching the data : \(error.localizedDescription)")
        }
        return albumFetchedResultController
    }
    
    /**
     Converty all albums to pins
     */
    class func loadAllPins()->[MKPointAnnotation]{
        let allPoints = loadAlbums()
        let albums  = allPoints.sections?[0].objects as! [Album]
        var allAnnotations = [MKPointAnnotation]()
        for album in albums {
            
            let annotation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D(latitude: album.latitude, longitude: album.longitude)
            annotation.coordinate = coordinate
            print (coordinate)
            allAnnotations.append(annotation)
            
        }
        return allAnnotations
    }
    
    /**
     Seearch for album in the database by it's coordinate
     */
    class func getAlbumByCoordinates( coordinate:CLLocationCoordinate2D)->Album?{
        
        let predicate = NSPredicate(format: " latitude == \(coordinate.latitude ) and longitude == \(coordinate.longitude) "    )
        setupFetchResultController(predicate: predicate)
        
        do {
            try albumFetchedResultController.performFetch()
            if let num = albumFetchedResultController.sections?[0].numberOfObjects  {
                
                print ("Number of objects is : \(num )")
                let indexPath = IndexPath(row: 0, section: 0)
                let album = albumFetchedResultController.object(at: indexPath)
                return album
            }
            
            return nil
        }catch {
            print ("Error in filtering : \(error)")
            return nil
        }
        
        
    }
    
    
    
}




//MARK: Photo database functionality
extension DataController{
    /**
     Load all the photos of the album
     */
    class func loadPhotosForAblum(album:Album , handler:@escaping([PhotoResponse]? , Error?)->Void){
        let coordinate = CLLocationCoordinate2D(latitude: album.latitude, longitude: album.longitude)
        let numOfPages:Int = Int(album.numOfPages)
        var pageNum = 1
        pageNum = Int.random(in: 1...10)
        print ("hassan the page number is : \(pageNum)")
        FlickerApiCaller.searchForGeo(coordinate: coordinate, page: pageNum) { (result, error) in
            if let result = result {
                print (result)
                handler(result.photoCol.photos , nil )
            }else {
                print (error)
                handler (nil ,error )
            }
        }
    }
    
    /**
     Setup the fetched request controller
     */
    class func setupPhotoFetchedResultController(album:Album){
        dataController.backgroundContext.perform {
            let fetchRequest:NSFetchRequest<Photo> = Photo.fetchRequest()
         
                let predicator:NSPredicate = NSPredicate(format: " album = %@ " ,album)
               // fetchRequest.predicate = predicator
                let sortDescriptor = NSSortDescriptor(key: "photo_url", ascending: true)
                fetchRequest.sortDescriptors = [sortDescriptor]
                photosFetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: DataController.dataController.backgroundContext, sectionNameKeyPath: nil, cacheName: nil )
            
        }
    }
    
    /**
     Load all the photos for specified album from the database
     */
    class func loadPhotosFromDatabase (album:Album  , handler:@escaping([Photo] , Error?)->Void){
        setupPhotoFetchedResultController(album: album)
        dataController.backgroundContext.perform {
            do {
                
                try photosFetchedResultController.performFetch()
                
                let allPhotos = photosFetchedResultController.sections?[0].objects as! [Photo]
                
                handler(allPhotos , nil )
                
            }catch{
                print ("error in getting photos from database")
                handler([], error)
            }
        }
        
    }
   
    
    /**
     Delete specified photo
     */
    class func deleteRow(photo:Photo){
        dataController.backgroundContext.delete(photo)
        try? dataController.backgroundContext.save()
    }
    
    
    /**
     Delete all the photos of the album
     */
    class func deleteAllAblumPhotos(album:Album){
        let fetchRequest:NSFetchRequest<Photo> = Photo.fetchRequest()
        let predicate = NSPredicate(format: " album = %@ ", album)
        fetchRequest.predicate = predicate
        if let result = try? dataController.backgroundContext.fetch(fetchRequest){
            for object in result {
                dataController.backgroundContext.delete(object)
            }
            try? dataController.backgroundContext.save()
        }
    }
    
    
    
    
}
