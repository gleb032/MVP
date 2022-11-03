//
//  TraficViewController.swift
//  MVP
//
//  Created by Глеб Фандеев on 14.10.2022.
//

import Foundation
import UIKit

import SnapKit

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
    
    private func setUpActions() {
        for (_, light) in trafficLightViews {
            light.addTarget(self, action: #selector(lightAction(_:)), for: .touchUpInside)
        }
    }
    
    @objc func lightAction(_ sender: Any) {
        guard let trafficLight = sender as? TrafficLightView else { return }
        trafficLightPresenter.trafficLightColorSelected(color: trafficLight.color)
    }
    
    func displayTrafficLight(description: String) {
        descriptionLabel.text = description
    }
}

// MARK: Set Up Layout

extension TrafficLightViewController {
    private func setUpTrafficLightsLayout() {
        guard let red = trafficLightViews["red"],
              let yellow = trafficLightViews["yellow"],
              let green = trafficLightViews["green"]
        else {
            return assertionFailure("Must have all lights!")
        }
        
        let lightSize = min(view.frame.width / 3, view.frame.height * 2/3/3)
        
        for (_, light) in trafficLightViews {
            view.addSubview(light)
            light.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.height.equalTo(lightSize)
                make.width.equalTo(lightSize)
            }
            light.layer.cornerRadius = lightSize / 2
        }
        
        red.snp.makeConstraints { $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20) }
        yellow.snp.makeConstraints { $0.top.equalTo(red.snp.bottom).offset(20) }
        green.snp.makeConstraints { $0.top.equalTo(yellow.snp.bottom).offset(20) }
    }
    
    private func setUpDescriptionLabelLayout() {
        view.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
        }
    }
}

