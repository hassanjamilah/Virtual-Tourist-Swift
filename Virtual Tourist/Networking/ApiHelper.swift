//
//  ss.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation


class ApiHelper {
    
    
    //MARK: The EndPoints
    enum EndPoints {
        static let api_key = ""
        static let baseURL = "https://api.flickr.com/services/rest"
        static let  numberOfPhotosPerPage:Int = 25
        
        
        enum ApiMethods:String {
            case search = "flickr.photos.search"
        }
        
        enum ImageSizes:String{
            case small = "url_m"
            case medium = "url_c"
            case thumbnail="url_t"
        }
        
        case searchPhotoByLatAndLong(Double , Double  , Int)
        
        
        var urlString:String{
            switch self {
            case .searchPhotoByLatAndLong(let lat , let long , let page):
                return EndPoints.baseURL + "?safe_search=1&nojsoncallback=1&api_key=\(EndPoints.api_key)&method=\(ApiMethods.search.rawValue)&per_page=\(EndPoints.numberOfPhotosPerPage)&lat=\(lat)&lon=\(long)&extras=\(EndPoints.ImageSizes.small.rawValue)&format=json&page=\(page)"
                
            }
        }
        
        var url:URL{
            return URL(string: urlString)!
        }
        
    }
    
    
    
    /**
     Method for get request
     */
    class func taskForGetRequest <ResponseType:Decodable>(url:URL , responseType:ResponseType.Type , handler:@escaping(ResponseType? , Error?)->Void){
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(ResponseType.self, from: data)
                    handler(result , nil)
                }catch {
                    do{
                        let errorResult = try JSONDecoder().decode(ErrorResponse.self, from: data)
                        handler(nil , errorResult)
                    }catch {
                        handler(nil , error)
                    }
                }
            }else {
                print ("Error in Get request : \(error)")
            }
        }
        task.resume()
        
    }
    
}
