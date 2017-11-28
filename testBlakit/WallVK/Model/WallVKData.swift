//
//  WallVKData.swift
//  testBlakit
//
//  Created by Руслан on 27.11.2017.
//  Copyright © 2017 Руслан. All rights reserved.
//

import Foundation

struct WallVKData: Codable {
    var response: ResponseVK
}

struct ResponseVK: Codable {
    var items: [InfoItems]
    var groups: [InfoGroups]
}

struct InfoItems: Codable {
    var text: String
    var likes: LikesInfo
    var reposts: RepostsInfo
}

struct LikesInfo: Codable {
    var count: Int
}

struct RepostsInfo: Codable {
    var count: Int
}

struct InfoGroups: Codable {
    let photo_50: String
}

