//
//  AppGroup.swift
//  VAppStore
//
//  Created by Victor Chang on 12/03/2019.
//  Copyright © 2019 Victor Chang. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let artistName: String
    let name: String
    let artworkUrl100: String
}
