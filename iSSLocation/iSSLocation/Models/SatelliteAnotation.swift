//
//  SatelliteAnotation.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 6/21/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation
import MapKit

final class SatelliteAnotation : NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(title: String?,coordinate: CLLocationCoordinate2D) {
    
      self.title = title
      self.coordinate = coordinate
      
    }
}
