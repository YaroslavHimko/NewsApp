//
//  Config.swift
//  NewsApp
//
//  Created by Yaroslav Himko on 16.05.21.
//

import UIKit

struct Config: Decodable {
    let clientSecret: String
}

struct ConfigValues {
    static func get() -> Config {
        guard let url = Bundle.main.url(forResource: "NewsApiConnection", withExtension: "plist") else {
            fatalError("Could not find NewsApiConnection.plist in your Bundle")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            return try decoder.decode(Config.self, from: data)
        } catch let err {
            fatalError(err.localizedDescription)
        }
    }
}
