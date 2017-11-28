//
//  WallNetworkService.swift
//  testBlakit
//
//  Created by Руслан on 27.11.2017.
//  Copyright © 2017 Руслан. All rights reserved.
//

import Foundation

class WallNetworkServise {
    private init() {}
    static func getWall(completion: @escaping(GetWallResponse) ->()) {
        
       guard let url = URL(string: "https://api.vk.com/method/wall.get?domain=\(domain)&count=\(count)&filter=owner&extended=1&access_token=\(ACCESS_TOKEN)&v=5.69") else {return}
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetWallResponse(json: json)
                    completion(response)
            } catch {
                print(error.localizedDescription)
            }

        }
    }
}

