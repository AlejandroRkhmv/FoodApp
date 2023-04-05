//
//  DataFetcherService.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import Foundation

class DataFetcherService: DataFetcherServiceProtocol {
    var urlStorage: URLStorage
    var networkDataFetcher: NetworkDataFetcherProtocol
    init(networkDataFetcher: NetworkDataFetcherProtocol = NetworkDataFetcher(), urlStorage: URLStorage = URLStorage()) {
        self.networkDataFetcher = networkDataFetcher
        self.urlStorage = urlStorage
    }
    
    func fetchProductsAPI(completion: @escaping (ProductAPI?) -> Void) {
        let urlString = urlStorage.productsURL
        networkDataFetcher.fetchJSONData(with: urlString, complettion: completion)
    }
}
