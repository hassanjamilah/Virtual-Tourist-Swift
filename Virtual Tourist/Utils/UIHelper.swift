//
//  UIHelper.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
import UIKit
class UIHelper{
    
    enum ErrorMsgs:String{
        case NoData = "Error getting data from the server.\nPlease check your internet connection"
    }
    
    enum ErrorTitles:String{
        case NoData = "No Connection"
    }
    
    
    class func showAlert(message message:ErrorMsgs  , title title:ErrorTitles , originalViewController viewController:UIViewController){
        let alert:UIAlertController = UIAlertController(title: title.rawValue, message: message.rawValue, preferredStyle: .alert)
        
        
    }
    
}
