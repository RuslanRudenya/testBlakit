//
//  GetWallResponse.swift
//  testBlakit
//
//  Created by Руслан on 27.11.2017.
//  Copyright © 2017 Руслан. All rights reserved.
//

import Foundation

struct GetWallResponse {
    var wallData : WallVKData
    
    init(json: WallVKData) throws {
        self.wallData = json
    }
}


