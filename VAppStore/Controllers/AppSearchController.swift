//
//  SearchController.swift
//  VAppStore
//
//  Created by Victor Chang on 02/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit

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
    let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
    // fetch data from internet
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to fetch Apps: ", error)
                return
            }
            
            guard let data = data else { return }
            // succes
            do {
                let searchResult = try
                    JSONDecoder().decode(SearchResult.self, from: data)
//                searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
                self.appResults = searchResult.results
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            } catch let jsonError{
                print("Failed to decode JSON: ", jsonError.localizedDescription)
                
            }
            
        }.resume()
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        
        let appResult = appResults[indexPath.item]
        cell.nameLabel.text = appResult.trackName
        cell.categoryLabel.text = appResult.primaryGenreName
        cell.ratingLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
        
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
