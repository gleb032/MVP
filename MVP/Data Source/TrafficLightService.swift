//
//  TrafficLightService.swift
//  MVP
//
//  Created by Глеб Фандеев on 14.10.2022.
//

import Foundation
import UIKit

class TrafficLightService {
    func getTrafficLight(for color: TrafficLightColor, callback: (TrafficLight?) -> Void) {        
        if let foundTrafficLight = trafficLights.first(where: { _, light in
            light.color == color
        }) {
            callback(foundTrafficLight.value)
        } else {
            callback(nil)
        }
    }
}
