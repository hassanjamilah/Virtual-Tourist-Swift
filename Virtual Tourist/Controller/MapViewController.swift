//
//  MapViewController.swift
//  Virtual Tourist
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        FlickerApiCaller.searchForGeo(latitude: 3.194045, longitude: 101.675362) { (photos, error) in
            guard error == nil else {
                print (error)
                return
            }
            print (photos)
        }
    }
    

    

}
