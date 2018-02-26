//
//  ViewController.swift
//  CoreLocationChallenge
//
//  Created by Eduardo Vital Alencar Cunha on 29/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    let locationManger = CLLocationManager()
    var currentLocation: CLLocation!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManger.delegate = self
        self.locationManger.requestWhenInUseAuthorization()
        self.locationManger.desiredAccuracy = kCLLocationAccuracyBest

        self.getLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getLocation() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            self.currentLocation = self.locationManger.location

            print(currentLocation)
            self.latitudeLabel.text = String(self.currentLocation.coordinate.latitude)
            self.longitudeLabel.text = String(self.currentLocation.coordinate.longitude)
        } else {
            self.locationManger.requestWhenInUseAuthorization()
            self.getLocation()
        }
    }

    var locationManager: CLLocationManager = CLLocationManager()

   

}

extension ViewController: CLLocationManagerDelegate {

}

