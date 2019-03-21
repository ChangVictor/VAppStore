//
//  AppPreviewCell.swift
//  VAppStore
//
//  Created by Victor Chang on 21/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit

class AppPreviewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
