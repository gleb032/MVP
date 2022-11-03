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
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        text = ""
        font = .systemFont(ofSize: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
