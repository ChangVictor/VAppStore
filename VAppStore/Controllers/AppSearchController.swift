//
//  SearchController.swift
//  VAppStore
//
//  Created by Victor Chang on 02/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit

class AppSearchControler: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
