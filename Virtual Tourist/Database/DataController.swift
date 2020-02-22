//
//  DataController.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
import CoreData
import MapKit



class DataController{
    let persistanceContainer:NSPersistentContainer
    static var dataController:DataController!
    static var albumFetchedResultController:NSFetchedResultsController<Album>!
    
    init(modelName:String) {
        persistanceContainer = NSPersistentContainer(name: modelName)
        
        
    }
    
    var context:NSManagedObjectContext {
        return persistanceContainer.viewContext
    }
    
    func load(completion: (()->Void)? = nil ){
        persistanceContainer.loadPersistentStores { (storeDesc, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            
            completion?()
            
        }
    }
    
    
    
    
    
    class func savePhotos(){
        
    }
    class func loadPhotos(){
        
    }
    
    
    
}

//MARK: Extenstion for Controller the Album functionality
extension DataController{
    
    
    class func saveAlbum(lat:Double , long:Double){
        let album:Album = Album(context: DataController.dataController.context)
        album.latitude = lat
        album.longitude = long
        do {
            try dataController.context.save()
        }catch {
            print (error)
        }
    }
    
    class func loadAlbums()->NSFetchedResultsController<Album>{
        let fetchRequest:NSFetchRequest<Album> = Album.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "latitude", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        albumFetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: DataController.dataController.context, sectionNameKeyPath: nil, cacheName: nil )
        do{
            try albumFetchedResultController.performFetch()
        }catch {
            print ( "Error Fetching the data : \(error.localizedDescription)")
        }
        return albumFetchedResultController
    }
    
    class func loadAllPins()->[MKPointAnnotation]{
        let allPoints = loadAlbums()
        let albums  = allPoints.sections?[0].objects as! [Album]
        var allAnnotations = [MKPointAnnotation]()
        for album in albums {
            let annotation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D(latitude: album.latitude, longitude: album.longitude)
            annotation.coordinate = coordinate
            allAnnotations.append(annotation)
            
        }
        return allAnnotations
    }
}




//MARK: Extenstion for Controller the Photos functionality
extension DataController{
    
}
