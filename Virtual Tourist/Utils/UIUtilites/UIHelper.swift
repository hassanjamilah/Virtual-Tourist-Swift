//
//  UIHelper.swift
//  Virtual Tourist
//
//  Created by Hassan on 22/02/2020.
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
    
    
    /**
     Show alert message to the user
     */
    class func showAlert(message:ErrorMsgs  , title:ErrorTitles , originalViewController viewController:UIViewController){
        let alert:UIAlertController = UIAlertController(title: title.rawValue, message: message.rawValue, preferredStyle: .alert)
        viewController.present(alert, animated: true, completion: nil)
        
    }
    
}
