//
//  NetworkServiceProtocol.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//
import Foundation

protocol NetworkServiceProtocol {
    func performRequest(with urlString: String, completion: @escaping (Data?) -> Void)
}
