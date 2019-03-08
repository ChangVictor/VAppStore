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
    
    func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
        print("Fetching itunes apps from Service layer")
        
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
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
    
}
