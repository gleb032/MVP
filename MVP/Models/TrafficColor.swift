//
//  TrafficColor.swift
//  MVP
//
//  Created by Глеб Фандеев on 14.10.2022.
//

import Foundation
import UIKit

enum TrafficLightColor {
    case red,yellow,green
    
    var value: UIColor {
        switch self {
            case .red:
                return .red
            case .yellow:
                return .yellow
            case .green:
                return .green
        }
    }
}

