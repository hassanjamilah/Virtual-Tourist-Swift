//
//  FlickerApiCaller.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
class FlickerApiCaller{
    
    class func searchForGeo (latitude lat:Double , longitude long:Double , handler:@escaping([PhotoResponse]? , Error?)->Void){
        let url:URL = ApiHelper.EndPoints.searchPhotoByLatAndLong(lat, long).url
        ApiHelper.taskForGetRequest(url: url, responseType: SearchResponse.self) { (data, error) in
            DispatchQueue.main.async {
                guard error == nil else{
                    handler(nil , error)
                    return
                }
               
                handler(data?.photoCol.photos , nil )
                
                print (data)
            }
        }
    }
    
}
