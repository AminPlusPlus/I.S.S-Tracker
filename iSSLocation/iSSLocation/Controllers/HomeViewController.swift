//
//  HomeViewController.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 5/29/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import MapKit
import SnapKit

class HomeViewController: UIViewController {
    
    let mapView :  MKMapView = {
        let mapView = MKMapView()
        
        return mapView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(mapView)
        initView()
    }
    
    
    
    /// Constrains
    private func initView(){
        mapView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    

}
