//
//  HorizontalSnappingController.swift
//  VAppStore
//
//  Created by Victor Chang on 16/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {
    
    init() {
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
            super.init(collectionViewLayout: layout)
        
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
