//
//  Virtual_TouristTests.swift
//  Virtual TouristTests
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import XCTest
import MapKit
@testable import Virtual_Tourist
class Virtual_TouristTests: XCTestCase {
    let coordinate = CLLocationCoordinate2D(latitude: 3.1412, longitude: 101.68653)
    let sampleSearchJson = """
    {
        "photos": {
            "page": 1,
            "pages": 20618,
            "perpage": 10,
            "total": "206177",
            "photo": [
                {
                    "id": "49566972618",
                    "owner": "46932702@N00",
                    "secret": "1d3178b61c",
                    "server": "65535",
                    "farm": 66,
                    "title": "_LH10911",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/65535/49566972618_1d3178b61c.jpg",
                    "height_m": 334,
                    "width_m": 500
                },
                {
                    "id": "49563984858",
                    "owner": "24696776@N06",
                    "secret": "ef3206c671",
                    "server": "65535",
                    "farm": 66,
                    "title": "Ming Hoe Hokkien Mee 民和茶餐室, Jalan Suppiah Pillay, 3rd Mile Jalan Ipoh, 51200 Kuala Lumpur, Malaysia",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/65535/49563984858_ef3206c671.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "49564709412",
                    "owner": "24696776@N06",
                    "secret": "ff3ceb3a17",
                    "server": "65535",
                    "farm": 66,
                    "title": "Ming Hoe Hokkien Mee 民和茶餐室, Jalan Suppiah Pillay, 3rd Mile Jalan Ipoh, 51200 Kuala Lumpur, Malaysia",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/65535/49564709412_ff3ceb3a17.jpg",
                    "height_m": 500,
                    "width_m": 375
                },
                {
                    "id": "49563984853",
                    "owner": "24696776@N06",
                    "secret": "fb89964ec1",
                    "server": "65535",
                    "farm": 66,
                    "title": "Ming Hoe Hokkien Mee 民和茶餐室, Jalan Suppiah Pillay, 3rd Mile Jalan Ipoh, 51200 Kuala Lumpur, Malaysia",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/65535/49563984853_fb89964ec1.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "49564709422",
                    "owner": "24696776@N06",
                    "secret": "4b916a005c",
                    "server": "65535",
                    "farm": 66,
                    "title": "Ming Hoe Hokkien Mee 民和茶餐室, Jalan Suppiah Pillay, 3rd Mile Jalan Ipoh, 51200 Kuala Lumpur, Malaysia",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/65535/49564709422_4b916a005c.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "49563984848",
                    "owner": "24696776@N06",
                    "secret": "bfbc2778be",
                    "server": "65535",
                    "farm": 66,
                    "title": "Ming Hoe Hokkien Mee 民和茶餐室, Jalan Suppiah Pillay, 3rd Mile Jalan Ipoh, 51200 Kuala Lumpur, Malaysia",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/65535/49563984848_bfbc2778be.jpg",
                    "height_m": 500,
                    "width_m": 375
                },
                {
                    "id": "49564385252",
                    "owner": "24696776@N06",
                    "secret": "8a2a5e9690",
                    "server": "65535",
                    "farm": 66,
                    "title": "Batu 3 Mamak Stall, Taman Million, 51100 Kuala Lumpur, Malaysia",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/65535/49564385252_8a2a5e9690.jpg",
                    "height_m": 500,
                    "width_m": 375
                },
                {
                    "id": "49563661493",
                    "owner": "24696776@N06",
                    "secret": "c078258e04",
                    "server": "65535",
                    "farm": 66,
                    "title": "Batu 3 Mamak Stall, Taman Million, 51100 Kuala Lumpur, Malaysia",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/65535/49563661493_c078258e04.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "49563661473",
                    "owner": "24696776@N06",
                    "secret": "c0e3de3ae4",
                    "server": "65535",
                    "farm": 66,
                    "title": "Batu 3 Mamak Stall, Taman Million, 51100 Kuala Lumpur, Malaysia",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/65535/49563661473_c0e3de3ae4.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "49563661488",
                    "owner": "24696776@N06",
                    "secret": "878bd3c7d6",
                    "server": "65535",
                    "farm": 66,
                    "title": "Batu 3 Mamak Stall, Taman Million, 51100 Kuala Lumpur, Malaysia",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/65535/49563661488_878bd3c7d6.jpg",
                    "height_m": 375,
                    "width_m": 500
                }
            ]
        },
        "stat": "ok"
    }
    
    """.data(using: .utf8)
    
    override func setUp() {
        super.setUp()
       
        DataController.dataController =  DataController(modelName: "Virtual_Tourist")
        DataController.dataController.load()
    }
    
    override func tearDown() {
        super.tearDown()
        DataController.dataController = nil
    }
    
    func testExample() {
        
    }
    
    
    func testSearchResultResponseCodeable (){
        do{
            let x = try JSONDecoder().decode(SearchResponse.self, from: sampleSearchJson!)
            print  (x.photoCol.photos)
        }catch {
            print (error)
        }
        
        
    }
    
    func testSearchMethod (){
        let promise = expectation(description: "Test succeeded")
        let coordinate = CLLocationCoordinate2D(latitude: 3.1412, longitude: 101.68653)
        FlickerApiCaller.searchForGeo(coordinate: coordinate, page: 1) { (photoCollection, error) in
            guard  error == nil else {
                XCTFail("Test failed")
                return
            }
            if photoCollection?.photos.count == 0 {
                XCTFail("No photos for location")
                return
            }
            print ("The number of photos is : \(photoCollection?.photos.count) ✌️")
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)
        
    }
    
    func testAlbumFilter (){
        let coordinate = CLLocationCoordinate2D(latitude: 14.469325626296808, longitude: 106.41620195652177)
        DataController.getAlbumByCoordinates(coordinate: coordinate)
    }
    
    func testgetPhotosFromDatabase (){
        let album = Album(context: DataController.dataController.context)
        album.owner_code = ""
        
        DataController.loadPhotosFromDatabase(album: album)
        
    }
    
    
    func testSaveToDatabase(){
        let album:Album = Album(context: DataController.dataController.context)
        
        album.latitude = coordinate.latitude
        album.longitude = coordinate.longitude
        let promise = expectation(description: "Test succeeded")
        FlickerApiCaller.searchForGeo(coordinate: coordinate , page: 1) { (photoCollection, error) in
            guard error == nil else{
                    XCTFail("Test faild with error : \(error)")
                return
            }
            
            if let photoCollection = photoCollection{
                if (photoCollection.photos.count == 0 ){
                    XCTFail("Test fialid no photos for location ")
                    return
                }
                album.numOfPages = Int16(photoCollection.numberOfPages)
                if photoCollection.photos.count > 0 {
                    album.owner_code = photoCollection.photos[0].owner
                }
                
                album.lastLoadedPage = 1
                var i = 0
                for photoResponse in photoCollection.photos{
                    print ("hassan")
                    let photo = Photo(context: DataController.dataController.context)
                    let url = URL(string: photoResponse.photoURL)!
                    FlickerApiCaller.loadImage(url: url) { (image, error) in
                        print("hassan11")
                        if let image = image {
                            photo.photo_image = image.pngData()
                            photo.photo_owner_code = photoResponse.owner
                            print ("hassan photo response owner is : \(photoResponse.owner)")
                            print (photo)
                        }else {
                            print ("hassan image not returned")
                        }
                        FlickerApiCaller.loadImage(url: url) { (image, error) in
                            
                        }
                    }
                }
                
            }else {
                print ("error \(error)")
            }
            
            DataController.saveAlbum(album: album)
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)
    }
    
    
    
    func testLoatImage(){
        let url = URL(string: "https://live.staticflickr.com/65535/49571967282_6db56d4eb9.jpg")!
        let promise = expectation(description: "Test succeeded")
        FlickerApiCaller.loadImage(url: url) { (image, error) in
            guard error == nil else {
                XCTFail("Test faild with error : \(error)")
                return
            }
            if let image = image {
                promise.fulfill()
            }else {
                XCTFail("Image obtained but not returned")
            }
            
        }
        
        wait(for: [promise], timeout: 5 )
    }
    
    
    func testSaveImage(){
        let data = try? Data(contentsOf: URL(string: "https://live.staticflickr.com/65535/49563661488_878bd3c7d6.jpg")!)
        let promise = expectation(description: "Test succeeded")
        if let data = data {
            let image = UIImage(data: data)!
            DataController.savePhotoToDatabase(image: image, owner: "H1")
            promise.fulfill()
        }else {
            XCTFail("Test failed error : ")
        }
        wait(for: [promise], timeout: 5)
    }
    
    func testLoadPhotosForAlbum(){
        let album = Album(context: DataController.dataController.context)
        album.latitude = coordinate.latitude
        album.longitude = coordinate.longitude
        DataController.loadPhotosForAblum(album: album) { (photoResponse, error) in
            if let photoResponse = photoResponse {
                print ("hassan \(photoResponse.count)")
            }else {
                XCTFail("Test failed")
            }
        }
        
    }
}

