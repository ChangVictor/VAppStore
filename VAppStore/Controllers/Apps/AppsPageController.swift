//
//  AppsController.swift
//  VAppStore
//
//  Created by Victor Chang on 10/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit

class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "id"
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: "id")
        collectionView.register(AppsPageHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerId)
        
        fetchData()
    }
    
//    var sectionTitle: AppGroup?
    
    var groups = [AppGroup]()
    
    fileprivate func fetchData() {
        
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        // to sync your data together...
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        print("Fectching new JSON Data...")
        Service.shared.fetchEditorsChoiceGames { (appGroup, error) in
            dispatchGroup.leave()
            print("- done fetching Editor's Choice Games")
            group1 = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopFree { (appGroup, error) in
            dispatchGroup.leave()
            print("- done fetching Top Free Games")
            group2 = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopGrossing { (appGroup, error) in
            dispatchGroup.leave()
            print("- done fetching Top Grossing Apps")
            group3 = appGroup
        }
        
        // completion
        dispatchGroup.notify(queue: .main) {
            print("completed dispatch group tasks...")
            
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            if let group = group3 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width , height: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        
        let appGroup =  groups[indexPath.item]
        
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    

}
