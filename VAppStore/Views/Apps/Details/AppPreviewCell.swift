//
//  AppPreviewCell.swift
//  VAppStore
//
//  Created by Victor Chang on 21/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit

class AppPreviewCell: UICollectionViewCell {
    
    let horizontalController = PreviewScreenshotsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        addSubview(horizontalController.view)
        horizontalController.view.fillSuperview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
