//
//  DataFetcherServiceProtocol.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import Foundation

protocol DataFetcherServiceProtocol {
    var urlStorage: URLStorage { get set }
    var networkDataFetcher: NetworkDataFetcherProtocol { get set }
    
    func fetchProductsAPI(completion: @escaping (ProductAPI?) -> Void)
}
