//
//  NetworkService.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    func performRequest(with urlString: String, completion: @escaping (Data?) -> Void) {
        if let data = (Cache.cache.object(forKey: urlString as AnyObject)) as? Data {
            completion(data)
        } else {
            guard let url = URL(string: urlString) else { return }
            let request = URLRequest(url: url)
            let task = createDataTask(with: request) { data in
                guard let data = data else { return }
                Cache.cache.setObject(data as NSData, forKey: urlString as AnyObject)
                completion(data)
            }
            task.resume()
        }
    }

    fileprivate func createDataTask(with request: URLRequest, completion: @escaping (Data?) -> Void) -> URLSessionDataTask {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil)
                print(String(describing: error.localizedDescription))
            }
            DispatchQueue.main.async {
                completion(data)
            }
        }
        return task
    }
}

