//
//  Service.swift
//  VAppStore
//
//  Created by Victor Chang on 06/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import Foundation

class Service{
    
    static let shared = Service() // Singleton object
    
    func fetchApps(completion: @escaping ([Result]) -> ()) {
        print("Fetching iTunes apps from service layer")
        
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
                    completion(searchResult.results) 
        
                    } catch let jsonError{
                        print("Failed to decode JSON: ", jsonError.localizedDescription)
        
                    }
        
                }.resume()
    }
    
}
