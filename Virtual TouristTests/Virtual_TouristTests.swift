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
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        let url = ApiHelper.EndPoints.searchPhotoByLatAndLong(3.194045, 101.675362).url
        print (url)
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
        let promise = expectation(description: "Success getting data")
        FlickerApiCaller.searchForGeo(latitude: 3.194045, longitude: 101.675362) { (photos, error) in
            guard error == nil else {
                XCTFail("Test faild \(error!)")
                return
            }
            print (photos)
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)
    }
    
    func testAlbumFilter (){
        let coordinate = CLLocationCoordinate2D(latitude: 14.469325626296808, longitude: 106.41620195652177)
        DataController.getAlbumByCoordinates(coordinate: coordinate)
    }
    

}
