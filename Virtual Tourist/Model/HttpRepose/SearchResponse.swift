//
//  SearchResponse.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
struct SearchResponse:Codable {
    //let photoCol:PhotosCollection
    let stat:String
    
    enum CodingKeys:String , CodingKey{
      //  case photoCol = "photos"
        case stat
    }
}
