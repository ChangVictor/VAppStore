//
//  Service.swift
//  VAppStore
//
//  Created by Victor Chang on 06/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service() // singleton
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        print("Fetching itunes apps from Service layer")
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        // fetch data from internet
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch apps:", err)
                completion([], nil)
                return
            }
            
            // success
            guard let data = data else { return }
            do {
                let searchResult = try
                    JSONDecoder().decode(SearchResult.self, from: data)
                
                completion(searchResult.results, nil)
                
            } catch let jsonErr {
                
                print("Failed to decode json:", jsonErr)
                completion([], jsonErr)
                
            }
            
            }.resume() // fires off the request
    }
    
    public func fetchTopFree(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let topFreeUrl = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json"

        fetchAppGroup(urlString: topFreeUrl, completion: completion)
    }
    
    public func fetchEditorsChoiceGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let editorsChoirceUrl = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love-all/50/explicit.json"

        fetchAppGroup(urlString: editorsChoirceUrl, completion: completion)
    }
    
    public func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let topGrossingUrl = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json"
        
        fetchAppGroup(urlString: topGrossingUrl, completion: completion)
    }
    
    // helper func
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let url = URL(string: urlString ) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if let error = error {
        completion(nil, error)
        return
        }
        
        do {
        
        let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
        //succes case
        //                appGroup.feed.results.forEach({print($0.name)})
        completion(appGroup, nil)
        } catch {
        completion(nil, error)
        //                print("Failed to decode JSON: ", error.localizedDescription)
        }
        
        
        
        
        }.resume() // this will fire the request
    }
    
}
