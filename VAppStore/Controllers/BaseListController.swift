//
//  BaseListController.swift
//  VAppStore
//
//  Created by Victor Chang on 10/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
