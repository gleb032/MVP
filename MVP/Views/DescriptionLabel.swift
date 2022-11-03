//
//  DescriptionLabel.swift
//  MVP
//
//  Created by Глеб Фандеев on 14.10.2022.
//

import Foundation
import UIKit

class DescriptionLabel: UILabel {
    init() {
        super.init(frame: .zero)
        isUserInteractionEnabled = false
        textAlignment = .center
        text = ""
        font = .systemFont(ofSize: 25)
        numberOfLines = 0
        adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
