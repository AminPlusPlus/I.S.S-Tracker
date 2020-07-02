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
import Combine

class HomeViewController: UIViewController {
    
    private let mapView :  MKMapView = {
        let mapView = MKMapView()
        
        return mapView
    }()
    
    private let stackView : UIStackView = {
        let v = UIStackView()
        v.alignment = .leading
        v.distribution = .equalSpacing
        v.spacing = 20
        return v
    }()
    
    private let containerCardView = UIView()
    
    var cancellable : AnyCancellable?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.addSubview(mapView)
        view.addSubview(containerCardView)

       
        mapView.delegate = self
        
        initView()
        
        
        (0...1).forEach { (i) in
        
            let crewView = CardView()
            containerCardView.addSubview(crewView)
            
            crewView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            
            
            
            cancellable = crewView.gestureValue.sink(receiveValue: { value in
                
                let val = 0.5 * (abs(value) / 100)
                print(val )
                
                if val <= 1 {
                    self.containerCardView.subviews[0].transform = CGAffineTransform(scaleX: val, y:  val)
                    self.containerCardView.subviews[0].alpha = val
                }
              
            })
           
        
        }
        
        
        setupAnotation()
        
        
        
    }
    
    
    /// Constrains
    private func initView(){
        
        //map
        mapView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        //containerView
        containerCardView.snp.makeConstraints { (make) in
            make.height.equalTo(180)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(50)
        }

        
    }
    
    private func setupAnotation () {
        
        let t1 = SatelliteAnotation(title: "ISS", coordinate: CLLocationCoordinate2D(latitude: 41.006630 , longitude: -91.965050 ))

        mapView.addAnnotation(t1)
        
    }
    

}

extension HomeViewController  : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return SatelliteAnnotationView(annotation: annotation, reuseIdentifier: "iss")
    }
        
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view)
      
       
    }
    
}
