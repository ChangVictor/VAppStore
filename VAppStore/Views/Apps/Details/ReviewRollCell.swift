//
//  ReviewRollCell.swift
//  VAppStore
//
//  Created by Victor Chang on 23/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewController = ReviewsController()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        addSubview(reviewController.view)
        reviewController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
