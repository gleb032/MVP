//
//  TrafficLightView.swift
//  MVP
//
//  Created by Глеб Фандеев on 14.10.2022.
//

import Foundation
import UIKit

class TrafficLightView: UIButton {
    
    var color: TrafficLightColor
    
    init(trafficLight: TrafficLight) {
        color = trafficLight.color
        super.init(frame: .zero)
        backgroundColor = color.value
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
