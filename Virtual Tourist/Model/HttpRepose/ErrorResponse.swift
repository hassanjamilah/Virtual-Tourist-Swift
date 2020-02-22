//
//  ErrorResponse.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
struct ErrorResponse:Codable{
    let stat:String
    let code:Int
    let message:String
    
}

extension ErrorResponse:LocalizedError{
    var errorDescription: String?{
        return message
    }
    
    var localizedDescription: String{
        return message
    }
    
    
}
