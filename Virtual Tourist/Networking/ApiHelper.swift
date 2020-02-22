//
//  ss.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation


class ApiHelper {
    
   
    
    enum EndPoints {
         static let api_key = "3d9159e446af29147083c5ce6391086a"
        static let baseURL = "https://api.flickr.com/services/rest"
        static let  numberOfPhotosPerPage:Int = 10
        
       
        enum ApiMethods:String {
            case search = "flickr.photos.search"
        }
        
        enum ImageSizes:String{
            case small = "url_m"
            case medium = "url_c"
            case thumbnail="url_t"
        }
        
        case searchPhotoByLatAndLong(Double , Double )
       
        
        var urlString:String{
            switch self {
            case .searchPhotoByLatAndLong(let lat , let long):
                return EndPoints.baseURL + "?safe_search=1&nojsoncallback=1&api_key=\(EndPoints.api_key)&method=\(ApiMethods.search.rawValue)&per_page=\(EndPoints.numberOfPhotosPerPage)&lat=\(lat)&lon=\(long)&extras=\(EndPoints.ImageSizes.small.rawValue)&format=json"
            
            }
        }
        
        var url:URL{
            return URL(string: urlString)!
        }
        
    }
    
}
