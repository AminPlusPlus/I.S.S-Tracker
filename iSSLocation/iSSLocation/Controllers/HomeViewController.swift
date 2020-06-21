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

class SateliteAnotation : NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(title: String?,coordinate: CLLocationCoordinate2D) {
    
      self.title = title
      self.coordinate = coordinate
      
    }
}

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
        scroll.isPagingEnabled = true
        return scroll
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.addSubview(mapView)
       // view.addSubview(scrollview)
        //scrollview.addSubview(stackView)
       
        mapView.delegate = self
        
        initView()
        
      
        let randColors = [UIColor.red,.white,.brown,.green]
        
        (0...5).forEach { (_ ) in
        
            let crewView = CardView()
            crewView.backgroundColor = randColors.randomElement()
            view.addSubview(crewView)
           // stackView.addArrangedSubview(crewView)
            crewView.snp.makeConstraints { (make) in
                make.height.equalTo(180)
                make.left.right.equalToSuperview().inset(20)
                make.bottom.equalToSuperview().inset(50)
            }
        
        }
        
        
        setupAnotation()
        
    }
    
    
    /// Constrains
    private func initView(){
        //map
        mapView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        

        
    }
    
    private func setupAnotation () {
        
        let t1 = SateliteAnotation(title: "ISS", coordinate: CLLocationCoordinate2D(latitude: 41.006630 , longitude: -91.965050 ))

        mapView.addAnnotation(t1)
        
    }
    

}

extension HomeViewController  : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        //
        let customView = MKAnnotationView(annotation: annotation, reuseIdentifier: "iss")
        customView.backgroundColor = UIColor(named: "iss-annotation")
        customView.layer.cornerRadius = 20
        customView.layer.masksToBounds = false
        // customView.clipsToBounds = true
        customView.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 40, height: 40), cornerRadius: 20).cgPath
        customView.layer.shadowRadius = 5
        customView.layer.shadowOffset = .zero
        customView.layer.shadowOpacity = 1
        customView.layer.borderColor = UIColor(named: "StrokeAnnColor")!.cgColor
        customView.layer.borderWidth = 4.0
        
        customView.snp.makeConstraints { (make) in
            make.height.width.equalTo(40)
        }
       
        return customView
    }
        
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view)
    }
    
}
