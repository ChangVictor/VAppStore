//
//  ScreenshotCell.swift
//  VAppStore
//
//  Created by Victor Chang on 22/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit

class ScreenshotCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .purple
        addSubview(imageView)
        imageView.fillSuperview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
