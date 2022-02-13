//
//  BookInteractor.swift
//  TableUI
//
//  Created by Кристина Максимова on 26.11.2021.
//

import UIKit

protocol IneractorProtocol: AnyObject {
    func decodeBook() -> [Book]
    func decodeBookFromNet(completion: @escaping ([Book]) -> Void)
}

class BookInteractor: IneractorProtocol {
    
    func decodeBook() -> [Book] {
        BookDecoder().decodeLocalFile()
    }
    
    func decodeBookFromNet(completion: @escaping ([Book]) -> Void) {
        BookDecoder().decodeNetFile { books in
            completion(books)
        }
    }
}
