//
//  BooksPresenter.swift
//  TableUI
//
//  Created by Кристина Максимова on 24.11.2021.
//

import UIKit

protocol BookListView: AnyObject {
    func showBooks(_ books: [Book])
}

class BookPresenter: BookListPresenterProtocol {
    var interactor: IneractorProtocol?
    weak var view: BookListView?
    weak var router: RouterProtocol?
    
    func didSelectedBook(_ book: Book) {
        router?.showDetailsBook(book, view as! UIViewController)
    }
    
    func viewDidLoad() {
        //let books = (interactor?.decodeBook())!
        //view?.showBooks(books)
        
        interactor?.decodeBookFromNet(completion: { books in
            self.view?.showBooks(books)
        })
    }
}
