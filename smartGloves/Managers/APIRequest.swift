//
//  APIRequest.swift
//  smartGloves
//
//  Created by Gerardo on 05/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import Foundation

enum APIError:Error {
    case responseProblems
    case encodingProblems
    case decodingProblems
}

struct APIResquest {
    let resourceURL : URL
    
    init(endpoint: String) {
        let baseURL = "http://127.0.0.1:8000/apiLogin/\(endpoint)/"
        guard let resourceURL = URL(string: baseURL) else { fatalError() }
        
        self.resourceURL = resourceURL
    }
    
//    func save(_ dataToSave: String, completion:  @escaping(Result<String, APIError>) -> Void ) {
//        do {
//            var urlRequest = URLRequest(url: resourceURL)
//            urlRequest.httpMethod = "Post"
//            urlRequest.addValue("application-json", forHTTPHeaderField: "Content-Type")
//        }
//        catch {
//            completion()
//        }
//    }
    
    func get(_ dataToSave: String, completion:  @escaping(Result<Datos, APIError>) -> Void ) {
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "Get"
            urlRequest.addValue("application-json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: urlRequest){
                data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200, let JSONData = data else {
                        completion(.failure(.responseProblems))
                        return
                }

                do {
                    let decoder = JSONDecoder()

                    let contentData = try decoder.decode (Datos.self, from: JSONData)
                    completion(.success(contentData))
                }catch {
                    completion(.failure(.decodingProblems))
                }
            }
            task.resume()
        }
        catch {
            completion(.failure(.encodingProblems))
        }
    }
    
    
}
