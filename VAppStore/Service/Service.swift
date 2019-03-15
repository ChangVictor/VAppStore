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
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        print("Fetching itunes apps from Service layer")
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
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
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
        
    }
    
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
        
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            do {
                let objects = try
                    JSONDecoder().decode(T.self, from: data!)
                // succes
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
        
    }
}
