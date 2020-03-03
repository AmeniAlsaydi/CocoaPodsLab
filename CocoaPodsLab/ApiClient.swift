//
//  ApiClient.swift
//  CocoaPodsLab
//
//  Created by Amy Alsaydi on 3/3/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import Foundation
import Alamofire 

struct ApiClient {
    static func getUsers(completion: @escaping (AFResult<[User]>) -> ()) {
        let endpoint = "https://randomuser.me/api/?results=50"
        
        guard let url = URL(string: endpoint) else {
             return
           }
        
        AF.request(url).response { (response) in
          //response.data
          //response.error
          //response.request
          if let error = response.error {
            completion(.failure(error))
          } else if let data = response.data {
            
            do {
              let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                let users = results.results
                completion(.success(users))
            } catch {
                print("could not decode.")
            }
          }
        }
    }
}
