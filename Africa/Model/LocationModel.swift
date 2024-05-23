//
//  LocationsModel.swift
//  Africa
//
//  Created by naswakhansa on 29/11/23.
//

import Foundation
import MapKit

struct NationalParkLocations: Codable, Identifiable {
  var id: String
  var name: String
  var image: String
  var latitude: Double
  var longitude: Double
  
  // Computed Property
  var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
