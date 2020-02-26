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
            "pages": 4,
            "perpage": 25,
            "total": "94",
            "photo": [
                {
                    "id": "36302429071",
                    "owner": "49111993@N00",
                    "secret": "df023aafb4",
                    "server": "4353",
                    "farm": 5,
                    "title": "IMG_20170331_152737",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/4353/36302429071_df023aafb4.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "32681739914",
                    "owner": "69676579@N02",
                    "secret": "02550fd37b",
                    "server": "697",
                    "farm": 1,
                    "title": "Ini foto sudah gk ngedot lagi Lo, udah gedean anak TK gituu lo, sekolah di TK Pertiwi Kotagajah tempat Bu Suci yg terkenal itu ......  Foto diambil di studio Djakarta yg deket jembatan ledeng seberang Masjid Agung arah Punggur, bareng eyang putri tahun 19",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0
                },
                {
                    "id": "33342478235",
                    "owner": "86608120@N05",
                    "secret": "80c11c3fac",
                    "server": "2833",
                    "farm": 3,
                    "title": "LATEPOST: (Edisi belum move on dari #pantai 😂😂😂) Sun,  February 26th, 2017 ---- Being #Bohemian #BeachGirl in #modestfashion #stylecovered way . 🎼 #Row...Row...Row... your #boat gently down the #stream... 🎶Let's go to #Masj",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/2833/33342478235_80c11c3fac.jpg",
                    "height_m": 500,
                    "width_m": 411
                },
                {
                    "id": "32871271935",
                    "owner": "49673860@N07",
                    "secret": "8a885cd4ba",
                    "server": "407",
                    "farm": 1,
                    "title": "IMG_20170211_130445_762",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/407/32871271935_8a885cd4ba.jpg",
                    "height_m": 500,
                    "width_m": 500
                },
                {
                    "id": "31936658073",
                    "owner": "49673860@N07",
                    "secret": "f5b9e59fb9",
                    "server": "377",
                    "farm": 1,
                    "title": "P_20170207_013305.jpg",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/377/31936658073_f5b9e59fb9.jpg",
                    "height_m": 500,
                    "width_m": 375
                },
                {
                    "id": "29623146172",
                    "owner": "49111993@N00",
                    "secret": "7f032c3458",
                    "server": "8414",
                    "farm": 9,
                    "title": "IMG_20160901_123624",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/8414/29623146172_7f032c3458.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "27735241782",
                    "owner": "133877840@N03",
                    "secret": "c76f6af7e2",
                    "server": "7579",
                    "farm": 8,
                    "title": "June 22nd, 2016 Thanks Lord for today I was birthday to 18 years old. Thank you so much darling for your surprise. 🎂🎁 I hope we become true friends forever until God calls us to return to his home. 👯👯💋 #22June #Jakarta #",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/7579/27735241782_c76f6af7e2.jpg",
                    "height_m": 500,
                    "width_m": 500
                },
                {
                    "id": "27720910881",
                    "owner": "133877840@N03",
                    "secret": "a3bcd9f00b",
                    "server": "7459",
                    "farm": 8,
                    "title": "June 20,2016 Guten nacht.. #night #vsco #nite #gutenacht #vscocam",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/7459/27720910881_a3bcd9f00b.jpg",
                    "height_m": 500,
                    "width_m": 400
                },
                {
                    "id": "26033549086",
                    "owner": "133877840@N03",
                    "secret": "1e92e1357c",
                    "server": "1644",
                    "farm": 2,
                    "title": "Feliz Pascua All! 💒🎉 Jesus Christ bless us 🙏",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0
                },
                {
                    "id": "25248071779",
                    "owner": "120298096@N06",
                    "secret": "1a444716ce",
                    "server": "1459",
                    "farm": 2,
                    "title": "\"GEGANA\" antara nunggu jodoh dan kapal rombongan TKI tak pernah kunjung datang 😂🌊🚢 #kiluan",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1459/25248071779_1a444716ce.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "25167127390",
                    "owner": "49673860@N07",
                    "secret": "77b48b6918",
                    "server": "1606",
                    "farm": 2,
                    "title": "P_20150805_151952_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1606/25167127390_77b48b6918.jpg",
                    "height_m": 281,
                    "width_m": 500
                },
                {
                    "id": "25369822791",
                    "owner": "49673860@N07",
                    "secret": "7d7d47b1af",
                    "server": "1646",
                    "farm": 2,
                    "title": "P_20150805_151857_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1646/25369822791_7d7d47b1af.jpg",
                    "height_m": 281,
                    "width_m": 500
                },
                {
                    "id": "24835992713",
                    "owner": "49673860@N07",
                    "secret": "317592abd0",
                    "server": "1633",
                    "farm": 2,
                    "title": "P_20150805_151855_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1633/24835992713_317592abd0.jpg",
                    "height_m": 281,
                    "width_m": 500
                },
                {
                    "id": "24835991923",
                    "owner": "49673860@N07",
                    "secret": "2538660803",
                    "server": "1548",
                    "farm": 2,
                    "title": "P_20150805_151840_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1548/24835991923_2538660803.jpg",
                    "height_m": 281,
                    "width_m": 500
                },
                {
                    "id": "24835991963",
                    "owner": "49673860@N07",
                    "secret": "d72154b44d",
                    "server": "1716",
                    "farm": 2,
                    "title": "P_20150805_151837_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1716/24835991963_d72154b44d.jpg",
                    "height_m": 281,
                    "width_m": 500
                },
                {
                    "id": "25167123530",
                    "owner": "49673860@N07",
                    "secret": "bc4e3603dc",
                    "server": "1703",
                    "farm": 2,
                    "title": "P_20150805_151830_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1703/25167123530_bc4e3603dc.jpg",
                    "height_m": 281,
                    "width_m": 500
                },
                {
                    "id": "25369818611",
                    "owner": "49673860@N07",
                    "secret": "d568461c30",
                    "server": "1603",
                    "farm": 2,
                    "title": "P_20150805_151826_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1603/25369818611_d568461c30.jpg",
                    "height_m": 281,
                    "width_m": 500
                },
                {
                    "id": "24832058374",
                    "owner": "49673860@N07",
                    "secret": "f421c1a773",
                    "server": "1619",
                    "farm": 2,
                    "title": "P_20150804_060336_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1619/24832058374_f421c1a773.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "25436464976",
                    "owner": "49673860@N07",
                    "secret": "3218670608",
                    "server": "1460",
                    "farm": 2,
                    "title": "P_20150804_060306_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1460/25436464976_3218670608.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "24832056864",
                    "owner": "49673860@N07",
                    "secret": "bf4410b0e2",
                    "server": "1529",
                    "farm": 2,
                    "title": "P_20150804_060314_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1529/24832056864_bf4410b0e2.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "25436454676",
                    "owner": "49673860@N07",
                    "secret": "b17281eed3",
                    "server": "1516",
                    "farm": 2,
                    "title": "P_20150804_060227_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1516/25436454676_b17281eed3.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "25167014900",
                    "owner": "49673860@N07",
                    "secret": "4c055759a4",
                    "server": "1446",
                    "farm": 2,
                    "title": "P_20150804_060201_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1446/25167014900_4c055759a4.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "25369703231",
                    "owner": "49673860@N07",
                    "secret": "853ab2b654",
                    "server": "1464",
                    "farm": 2,
                    "title": "P_20150804_060127_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1464/25369703231_853ab2b654.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "24835872223",
                    "owner": "49673860@N07",
                    "secret": "f78e0b7cfa",
                    "server": "1458",
                    "farm": 2,
                    "title": "P_20150804_060051_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1458/24835872223_f78e0b7cfa.jpg",
                    "height_m": 375,
                    "width_m": 500
                },
                {
                    "id": "25462592385",
                    "owner": "49673860@N07",
                    "secret": "8500efd71d",
                    "server": "1685",
                    "farm": 2,
                    "title": "P_20150804_060039_1_p",
                    "ispublic": 1,
                    "isfriend": 0,
                    "isfamily": 0,
                    "url_m": "https://live.staticflickr.com/1685/25462592385_8500efd71d.jpg",
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
            print ("\(error)🚑🚑🚑🚑🚑🚑🚑🚑🚑")
            XCTFail(error.localizedDescription)
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
        
        //DataController.loadPhotosFromDatabase(album: album)
        
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
                         //   photo.photo_image = image.pngData()
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
          //  DataController.savePhotoToDatabase(image: image, owner: "H1",url: "https")
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
    
    func testDeleteRecord (){
        DataController.deleteRow(urlString: "")
        
    }
}

