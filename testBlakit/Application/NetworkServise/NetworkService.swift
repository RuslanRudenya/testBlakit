//
//  NetworkService.swift
//  testBlakit
//
//  Created by Руслан on 27.11.2017.
//  Copyright © 2017 Руслан. All rights reserved.
//

import Foundation

class NetworkService {
    private init() {}
    static let shared = NetworkService()
    
    public func getData(url: URL, completion: @escaping (WallVKData) -> ()) {
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do {
                let decoded = try JSONDecoder().decode(WallVKData.self, from: data)
                DispatchQueue.main.async {
                    completion(decoded)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
