//
//  SearchController.swift
//  VAppStore
//
//  Created by Victor Chang on 02/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit
import SDWebImage

class AppSearchControler: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchItunesApps()
        
    }
    
    fileprivate var appResults = [Result]()
    
    fileprivate func fetchItunesApps() {
        Service.shared.fetchApps { (results, err) in
            
            if let err = err {
                print("Failed to fetch Apps: ", err.localizedDescription)
                return
            }
            
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        
        cell.appResult = appResults[indexPath.item]
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
