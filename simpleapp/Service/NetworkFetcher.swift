//
//  NetworkFetcher.swift
//  simpleapp
//
//  Created by Cundy Sunardy on 27/11/24.
//

import Foundation

protocol NetworkFetcherProtocol {
    func fetchPost(completion: @escaping (Result<[PostModel], Error>) -> Void)
}

class NetworkFetcher: NetworkFetcherProtocol {
    func fetchPost(completion: @escaping (Result<[PostModel], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.org/posts") else {
            completion(.failure(NSError(domain: "InvalidURL", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                let error = NSError(domain: "ErrorResponse", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
                completion(.failure(error))
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([PostModel].self, from: data)
                completion(.success(posts))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
