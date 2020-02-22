//
//  Virtual_TouristTests.swift
//  Virtual TouristTests
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import XCTest
@testable import Virtual_Tourist
class Virtual_TouristTests: XCTestCase {

    let sampleSearchJson = """
        {
            "photos": {
                "page": 4,
                "pages": 20618,
                "perpage": 10,
                "total": "206177",
                "photo": [
                    {
                        "id": "49560336167",
                        "owner": "24696776@N06",
                        "secret": "dca49c001a",
                        "server": "65535",
                        "farm": 66,
                        "title": "唯一叻沙 Laksa Stall, Chow Kit Market, Chow Kit, 50300 Kuala Lumpur, Malaysia",
                        "ispublic": 1,
                        "isfriend": 0,
                        "isfamily": 0,
                        "url_m": "https://live.staticflickr.com/65535/49560336167_dca49c001a.jpg",
                        "height_m": 375,
                        "width_m": 500
                    },
                    {
                        "id": "49560336177",
                        "owner": "24696776@N06",
                        "secret": "e62e5677fd",
                        "server": "65535",
                        "farm": 66,
                        "title": "唯一叻沙 Laksa Stall, Chow Kit Market, Chow Kit, 50300 Kuala Lumpur, Malaysia",
                        "ispublic": 1,
                        "isfriend": 0,
                        "isfamily": 0,
                        "url_m": "https://live.staticflickr.com/65535/49560336177_e62e5677fd.jpg",
                        "height_m": 375,
                        "width_m": 500
                    },
                    {
                        "id": "49560336162",
                        "owner": "24696776@N06",
                        "secret": "183e26de4d",
                        "server": "65535",
                        "farm": 66,
                        "title": "唯一叻沙 Laksa Stall, Chow Kit Market, Chow Kit, 50300 Kuala Lumpur, Malaysia",
                        "ispublic": 1,
                        "isfriend": 0,
                        "isfamily": 0,
                        "url_m": "https://live.staticflickr.com/65535/49560336162_183e26de4d.jpg",
                        "height_m": 375,
                        "width_m": 500
                    },
                    {
                        "id": "49560097101",
                        "owner": "24696776@N06",
                        "secret": "d211b84ef4",
                        "server": "65535",
                        "farm": 66,
                        "title": "唯一叻沙 Laksa Stall, Chow Kit Market, Chow Kit, 50300 Kuala Lumpur, Malaysia",
                        "ispublic": 1,
                        "isfriend": 0,
                        "isfamily": 0,
                        "url_m": "https://live.staticflickr.com/65535/49560097101_d211b84ef4.jpg",
                        "height_m": 500,
                        "width_m": 375
                    },
                    {
                        "id": "49560336172",
                        "owner": "24696776@N06",
                        "secret": "1b15ea48c3",
                        "server": "65535",
                        "farm": 66,
                        "title": "唯一叻沙 Laksa Stall, Chow Kit Market, Chow Kit, 50300 Kuala Lumpur, Malaysia",
                        "ispublic": 1,
                        "isfriend": 0,
                        "isfamily": 0,
                        "url_m": "https://live.staticflickr.com/65535/49560336172_1b15ea48c3.jpg",
                        "height_m": 375,
                        "width_m": 500
                    },
                    {
                        "id": "49559602828",
                        "owner": "24696776@N06",
                        "secret": "741f988528",
                        "server": "65535",
                        "farm": 66,
                        "title": "唯一叻沙 Laksa Stall, Chow Kit Market, Chow Kit, 50300 Kuala Lumpur, Malaysia",
                        "ispublic": 1,
                        "isfriend": 0,
                        "isfamily": 0,
                        "url_m": "https://live.staticflickr.com/65535/49559602828_741f988528.jpg",
                        "height_m": 500,
                        "width_m": 375
                    },
                    {
                        "id": "49559586953",
                        "owner": "24696776@N06",
                        "secret": "13498412a7",
                        "server": "65535",
                        "farm": 66,
                        "title": "Warisan Nasi Kukus, 140, Jalan Tun HS Lee, 50480, Kuala Lumpur City Centre, 50050 Kuala Lumpur, Malaysia",
                        "ispublic": 1,
                        "isfriend": 0,
                        "isfamily": 0,
                        "url_m": "https://live.staticflickr.com/65535/49559586953_13498412a7.jpg",
                        "height_m": 500,
                        "width_m": 375
                    },
                    {
                        "id": "49560081521",
                        "owner": "24696776@N06",
                        "secret": "7ca3d6a941",
                        "server": "65535",
                        "farm": 66,
                        "title": "Warisan Nasi Kukus, 140, Jalan Tun HS Lee, 50480, Kuala Lumpur City Centre, 50050 Kuala Lumpur, Malaysia",
                        "ispublic": 1,
                        "isfriend": 0,
                        "isfamily": 0,
                        "url_m": "https://live.staticflickr.com/65535/49560081521_7ca3d6a941.jpg",
                        "height_m": 500,
                        "width_m": 375
                    },
                    {
                        "id": "49559463346",
                        "owner": "24696776@N06",
                        "secret": "080149d58e",
                        "server": "65535",
                        "farm": 66,
                        "title": "Chicken Rice Street Food Stall, Taman Million, 51100 Kuala Lumpur, Malaysia",
                        "ispublic": 1,
                        "isfriend": 0,
                        "isfamily": 0,
                        "url_m": "https://live.staticflickr.com/65535/49559463346_080149d58e.jpg",
                        "height_m": 500,
                        "width_m": 375
                    },
                    {
                        "id": "49559463331",
                        "owner": "24696776@N06",
                        "secret": "3d5b80a996",
                        "server": "65535",
                        "farm": 66,
                        "title": "Chicken Rice Street Food Stall, Taman Million, 51100 Kuala Lumpur, Malaysia",
                        "ispublic": 1,
                        "isfriend": 0,
                        "isfamily": 0,
                        "url_m": "https://live.staticflickr.com/65535/49559463331_3d5b80a996.jpg",
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
            print  (x.photos)
        }catch {
            print (error)
        }
        
       
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
