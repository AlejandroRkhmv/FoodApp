//
//  NetworkDataFetcherProtocol.swift
//  FoodApp
//
//  Created by Александр Рахимов on 05.04.2023.
//

import Foundation

protocol NetworkDataFetcherProtocol {
    var networkService: NetworkServiceProtocol { get set }
    func fetchJSONData<T: Codable>(with urlString: String, complettion: @escaping (T?) -> Void)
}
