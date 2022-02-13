//
//  BookDecoder.swift
//  TableUI
//
//  Created by Кристина Максимова on 11.11.2021.
//

import Foundation
import Alamofire

class BookDecoder {
    
    private let link = "https://api.npoint.io/f5093822511ab8b7365d"
    
    private let resource = "file"
    private let ext = "json"
    
    func decodeLocalFile() -> [Book] {
        guard let url = Bundle.main.url(forResource: resource, withExtension: ext) else { return [] }
        
        do {
            let data = try Data(contentsOf: url)
            return decode(data)
        } catch {
            print(error)
            return []
        }
    }
    
    func decodeNetFile(completion: @escaping ([Book]) -> Void) {
        AF.request(link, parameters: [:]).responseData { (response) in
            guard let data = response.data else { return }
            completion(self.decode(data))
        }
    }
    
    func decode(_ data: Data) -> [Book] {
        do {
            let library = try JSONDecoder().decode(Library.self, from: data)
            return library.items.map { $0.book }
        } catch {
            print(error)
            return []
        }
    }
}
