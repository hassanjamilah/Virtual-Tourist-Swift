//
//  PhotoResponse.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
struct PhotoResponse:Codable {
    let owner:String
    let photoURL:String
    let title:String
    
    enum CodingKeys:String , CodingKey{
        case  owner
        case photoURL = "url_m"
        case title
    }
}
