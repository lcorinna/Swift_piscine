//
//  APIController.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/15/22.
//

import UIKit

class APIController {
    
    weak var delegate: APITwitterDelegate?
    let token: String
    init (delegate: APITwitterDelegate, token: String) {
        self.delegate = delegate
        self.token = token
    }

    func requestData(url urlStr: String) {
        guard let url = URL(string: urlStr) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            print(data)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        } .resume()
    }
}
