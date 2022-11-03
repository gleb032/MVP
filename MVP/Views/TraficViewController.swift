//
//  TraficViewController.swift
//  MVP
//
//  Created by Глеб Фандеев on 14.10.2022.
//

import Foundation
import UIKit

class TrafficLightViewController: UIViewController, TrafficLightViewDelegate {
    
    private var descriptionLabel = DescriptionLabel()
    private let trafficLightViews = trafficLights.mapValues {
        TrafficLightView.init(trafficLight: $0)
    }
    
    private let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
        setUpTrafficLightsLayout()
        setUpDescriptionLabelLayout()
        setUpActions()
    }
    
    @objc func lightAction(_ sender: Any) {
        guard let trafficLight = sender as? TrafficLightView else { return }
        trafficLightPresenter.trafficLightColorSelected(color: trafficLight.color)
    }
    
    func displayTrafficLight(description: String) {
        descriptionLabel.text = description
    }
    
    private func setUpTrafficLightsLayout() {
        for (_, light) in trafficLightViews {
            view.addSubview(light)
        }
        
        guard let red = trafficLightViews["red"],
              let yellow = trafficLightViews["yellow"],
              let green = trafficLightViews["green"]
        else {
            return assertionFailure("Must have all lights!")
        }
        
        for (_, light) in trafficLightViews {
            light.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                .isActive = true
        }
        
        let lightSize = min(
            view.frame.width / 3,
            view.frame.height * 2 / 3 / 3
        )
        
        for (_, light) in trafficLightViews {
            light.heightAnchor.constraint(equalToConstant: lightSize)
                .isActive = true
        }
        
        red.widthAnchor.constraint(equalTo: red.heightAnchor)
            .isActive = true
        yellow.widthAnchor.constraint(equalTo: yellow.heightAnchor)
            .isActive = true
        green.widthAnchor.constraint(equalTo: green.heightAnchor)
            .isActive = true
        
        red.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 20
        ).isActive = true
        yellow.topAnchor.constraint(
            equalTo: red.bottomAnchor,
            constant: 20
        ).isActive = true
        green.topAnchor.constraint(
            equalTo: yellow.bottomAnchor,
            constant: 20
        ).isActive = true
        
        for (_, light) in trafficLightViews {
            light.layer.cornerRadius = lightSize / 2
            light.layer.borderColor = UIColor.gray.cgColor
            light.layer.borderWidth = 3
        }
    }
    
    private func setUpDescriptionLabelLayout() {
        view.addSubview(descriptionLabel)
        
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            .isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
            .isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            .isActive = true
        descriptionLabel.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: -40
        ).isActive = true
        
    }
    
    private func setUpActions() {
        for (_, light) in trafficLightViews {
            light.addTarget(self, action: #selector(lightAction(_:)), for: .touchUpInside)
        }
    }
}

