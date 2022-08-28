//
//  MapViewController.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/16/22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, UIGestureRecognizerDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var MyMapView: MKMapView!
    
    @IBOutlet weak var MySegCon: UISegmentedControl!
    
    @IBAction func changeEvent(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            MyMapView.mapType = .standard
        case 1:
            MyMapView.mapType = .satellite
        default:
            MyMapView.mapType = .hybrid
        }
    }
    
    @IBAction func MyLocation(_ sender: UIButton) {
        MyMapView.setRegion(MKCoordinateRegion(center: MyMapView.userLocation.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)), animated: true)
    }

    
    
    private static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    
    private var region = MKCoordinateRegion()
    
    public var place: Favourites {
        didSet {
            region.center = place.coordinate
            region.span = MapViewController.defaultSpan
        }
    }
    
    required init?(coder: NSCoder) {
        self.place = Favourites(name: "None", description: "None", coordinate: .init())
        super.init(coder: coder)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        MyMapView.setRegion(region, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        region = MyMapView.region
    }
    
    
    
    let locationManager = CLLocationManager()
    
    let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyMapView.delegate = self
        
        
        for place in places {
            let annotation = MKPointAnnotation()
            annotation.title = place.name
            annotation.subtitle = place.description
            annotation.coordinate = place.coordinate
            MyMapView.addAnnotation(annotation)
        }
        
//        var region = MKCoordinateRegion()
        var span = MKCoordinateSpan()
        
        span.latitudeDelta = 0.002;     // 0.0 is min value u van provide for zooming
        span.longitudeDelta = 0.002
        region.span = span;
        region.center = places.first!.coordinate;     // to locate to the center
        MyMapView.setRegion(region, animated: true)
        MyMapView.regionThatFits(region)
        
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        MyMapView.showsUserLocation = true
    }
    
}

extension MapViewController: MKMapViewDelegate {

    func mapView(_ MyMapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let markerAnnotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        if annotation.coordinate.latitude == places.first?.coordinate.latitude
            && annotation.coordinate.longitude == places.first?.coordinate.longitude {
            markerAnnotationView.markerTintColor = .green
        }
        return markerAnnotationView
    }
}
