//
//  PhotosSearchResponse.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation

struct PhotosCollection:Codable {
    let page:Int
    let numberOfPages:Int
  //  let photos:[PhotoResponse]
    
    enum CodingKeys:String,CodingKey{
        case page
        case numberOfPages = "pages"
    //    case photos = "photo"
    }
}
