//
//  TrafficLightPresenter.swift
//  MVP
//
//  Created by Глеб Фандеев on 14.10.2022.
//

import Foundation
import UIKit


protocol TrafficLightViewDelegate: NSObjectProtocol {
    func displayTrafficLight(description: String)
}

class TrafficLightPresenter {
    private let trafficLightService: TrafficLightService
    weak private var trafficLightViewDelegate : TrafficLightViewDelegate?
    
    init(trafficLightService:TrafficLightService){
        self.trafficLightService = trafficLightService
    }
    
    func setViewDelegate(trafficLightViewDelegate:TrafficLightViewDelegate?){
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    func trafficLightColorSelected(color: TrafficLightColor) {
        trafficLightService.getTrafficLight(for: color) { [weak self] trafficLight in
            if let trafficLight = trafficLight {
                self?.trafficLightViewDelegate?.displayTrafficLight(
                    description: trafficLight.description
                )
            }
        }
    }
}
