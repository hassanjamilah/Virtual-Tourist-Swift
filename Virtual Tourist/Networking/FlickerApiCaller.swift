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
    
    class func searchForGeo (coordinate:CLLocationCoordinate2D , page:Int   , handler:@escaping(PhotosCollection? , Error?)->Void){
        let url:URL = ApiHelper.EndPoints.searchPhotoByLatAndLong(coordinate.latitude  , coordinate.longitude , page).url
        ApiHelper.taskForGetRequest(url: url, responseType: SearchResponse.self) { (data, error) in
           
                guard error == nil else{
                    handler(nil , error)
                    return
                }
               
                handler(data?.photoCol , nil )
                
                
            
        }
    }
    
    class func loadImage (url:URL  , handler:@escaping(UIImage? , Error?)->Void){
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    let image = UIImage(data: data)
                    handler(image , nil )
                }else {
                    handler(nil , error)
                }
            }
            
        }
        task.resume()
    }
    
}
