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
    
    let stackView : UIStackView = {
        let v = UIStackView()
        v.alignment = .leading
        v.distribution = .equalSpacing
        v.spacing = 20
        return v
    }()
    
    let scrollview : UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .black
        scroll.isPagingEnabled = true
        return scroll
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(mapView)
        view.addSubview(scrollview)
        scrollview.addSubview(stackView)
       
        initView()
        
        (0...2).forEach { (_ ) in
        
            let crewView = CrewView()
           
            stackView.addArrangedSubview(crewView)
        
            crewView.snp.makeConstraints { (make) in
                make.height.equalTo(180)
                make.width.equalTo(self.view.frame.width - 100)
            }
            
    
        }
    }
    
    
    /// Constrains
    private func initView(){
        //map
        mapView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        //scroll
        scrollview.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(180)
            make.bottom.equalToSuperview().inset(25)
        }
        
        //stack
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    

}
