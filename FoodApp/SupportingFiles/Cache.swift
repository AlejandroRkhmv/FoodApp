//
//  Cache.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import UIKit

class Cache {
    static var cache: NSCache<AnyObject, NSData> = {
        let cache = NSCache<AnyObject, NSData>()
        return cache
    }()
    
    private init() {}
}
