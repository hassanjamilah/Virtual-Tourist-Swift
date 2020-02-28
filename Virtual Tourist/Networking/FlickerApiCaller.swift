//
//  FlickerApiCaller.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
import MapKit
class FlickerApiCaller{
    
    class func searchForGeo (coordinate:CLLocationCoordinate2D , page:Int   , handler:@escaping(SearchResponse? , Error?)->Void){
        let url:URL = ApiHelper.EndPoints.searchPhotoByLatAndLong(coordinate.latitude  , coordinate.longitude , page).url
        print ("The url is : \(url)")
        ApiHelper.taskForGetRequest(url: url, responseType: SearchResponse.self) { (result, error) in
            if let result = result {
                handler(result , nil )
            }else {
                print (error)
                handler(nil , error)
            }
        }
    }
    
    class func loadImage (url:URL  , handler:@escaping(Data? , Error?)->Void){
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
           // DispatchQueue.main.async {
                if let data = data {
                    
                    handler(data , nil )
                    print ("hassan Image downloaded successfully")
                }else {
                    handler(nil , error)
                }
           // }
            
        }
        task.resume()
    }
    
}
