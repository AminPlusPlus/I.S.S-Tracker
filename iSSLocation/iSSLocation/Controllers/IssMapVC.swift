//
//  ViewController.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 7/19/18.
//  Copyright © 2018 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import Mapbox

class IssMapVC: UIViewController, MGLMapViewDelegate,MGLCalloutViewDelegate
{
    @IBOutlet weak var Map: MGLMapView!
    @IBOutlet weak var TimeLabel: UILabel!

    private var markerIss = MGLPointAnnotation()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Set Map Delegate
        Map.delegate = self
        
        markerIss.title = ""
        //set position i.s.s position
        updateIssPosition()
        //crew i.s.s
        setupIssCrew()
        
        //Every 5 second request update position I.S.S
        Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector (updateIssPosition), userInfo: nil, repeats: true)
        
        //Adding Annotion to Map
        Map.addAnnotation(markerIss)
        
    }
    
    //MARK: updating Crew of I.S.S from End
    fileprivate func setupIssCrew ()
    {
        
         //Requesting and handle Location of Crew of I.S.S
        DataService.instance.RequestCrewISS(issCrewResult: { (crew) in
            DispatchQueue.main.async
                {
                    self.markerIss.title = crew.getListCrew()
                 }
        } ,Error: { (error) in
            //AlertView
            self.alert(title: "Opps", message: error)
        })
        
    }
    
    //MARK: Updating Iss Position
    @objc fileprivate func updateIssPosition ()
    {
        //Requesting and handle Location of ISS
        DataService.instance.RequestLocationISS( issLocationResult: { (location) in
            
            let lat = Double(location.issPosition.latitude)
            let lon = Double(location.issPosition.longitude)
            
            //Center Location Map
            let center = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
            
            //Main Thread Updating UI
            DispatchQueue.main.async
                {
                    self.Map.setCenter(center, zoomLevel: 5, animated: false)
                    self.markerIss.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
                    self.TimeLabel.text = location.getUTCTime().description
            }
            
        }, Error: { (error) in
            //AlertView
            self.alert(title: "Opps!", message: error)
        })
    }

    //MARK: Use the default marker. See also: our view annotation or custom marker examples.
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        guard annotation is MGLPointAnnotation else {
            return nil
        }
        
        // Use the point annotation’s longitude value (as a string) as the reuse identifier for its view.
        let reuseIdentifier = "circle"
        
        // For better performance, always try to reuse existing annotations.
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
    
            annotationView = CustomAnnotationView(reuseIdentifier: reuseIdentifier)
            annotationView?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            annotationView!.bounds = CGRect(x: 0, y: 0, width: 40, height: 40)
            
            // Set the annotation view’s background color to a value determined by its longitude.
            let hue = CGFloat(annotation.coordinate.longitude) / 100
            annotationView!.backgroundColor = UIColor(hue: hue, saturation: 0.5, brightness: 1, alpha: 1)
        
        
        return annotationView!
    }
    
    //Mark: Allow callout view to appear when an annotation is tapped.
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
    //Mark: After finishing Loading Map Move Camere to Annotation
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        // Wait for the map to load before initiating the first camera movement.
  
        // `fromDistance:` is meters above mean sea level that an eye would have to be in order to see what the map view is showing.
        let camera = MGLMapCamera(lookingAtCenter: mapView.centerCoordinate, fromDistance: 8500, pitch: 4, heading: 0)
        
        // Animate the camera movement over 45 seconds.
        mapView.setCamera(camera, withDuration: 45, animationTimingFunction: CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
    }
    
    //MARK: Custom CallOutView
    func mapView(_ mapView: MGLMapView, calloutViewFor annotation: MGLAnnotation) -> MGLCalloutView? {
        
        return CustomCalloutView(representedObject: annotation)
    }
    
    
}

extension UIViewController {
    
    func alert(title: String = "", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

