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

        ApiHelper.EndPoints.searchPhotoByLatAndLong(1.3242, 2.3324).url
    }
    

    

}
