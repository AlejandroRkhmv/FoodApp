//
//  NetworkDataFetcher.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import Foundation

class NetworkDataFetcher: NetworkDataFetcherProtocol {
    var networkService: NetworkServiceProtocol
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchJSONData<T: Codable>(with urlString: String, complettion: @escaping (T?) -> Void) {
        typealias Object = T
        
        networkService.performRequest(with: urlString) { [weak self] data in
            guard let self = self else { return }
            guard let data = data else { return }
            let object = self.decodeJSONData(type: Object.self, from: data)
            DispatchQueue.main.async {
                complettion(object)
            }
        }
    }
    
    fileprivate func decodeJSONData<T: Codable>(type: T.Type, from data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(type.self, from: data)
            return response
        } catch let error as NSError {
            print(String(describing: error.localizedDescription))
            return nil
        }
    }
}


