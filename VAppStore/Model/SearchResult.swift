//
//  SearchResult.swift
//  VAppStore
//
//  Created by Victor Chang on 05/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import UIKit

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
    
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
}
