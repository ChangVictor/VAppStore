//
//  VerticalStackView.swift
//  VAppStore
//
//  Created by Victor Chang on 03/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubViews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubViews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        
        self.axis = .vertical
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
