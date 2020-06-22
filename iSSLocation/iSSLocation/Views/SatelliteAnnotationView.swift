//
//  SatelliteAnnotationView.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 6/21/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import MapKit
import SnapKit

class SatelliteAnnotationView: MKAnnotationView {

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
   
        setupView()
    
    }
    
    
    /// Setup View
    private func setupView(){
       
        backgroundColor = UIColor(named: "iss-annotation")
        layer.cornerRadius = 20
        layer.masksToBounds = false
        
        layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 40, height: 40), cornerRadius: 20).cgPath
        layer.shadowRadius = 5
        layer.shadowOffset = .zero
        layer.shadowOpacity = 1
        layer.borderColor = UIColor(named: "StrokeAnnColor")!.cgColor
        layer.borderWidth = 4.0
        
        snp.makeConstraints { (make) in
            make.height.width.equalTo(40)
        }
    
    }
    
   
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
