//
//  RouterForViper.swift
//  TableUI
//
//  Created by Кристина Максимова on 25.11.2021.
//

import UIKit

protocol RouterProtocol: AnyObject {
    func showDetailsBook(_ book: Book, _ vc: UIViewController)
    func getFirstViewController() -> UIViewController
}

class BookRouter: RouterProtocol {
    
    func getFirstViewController() -> UIViewController {
        
        let vc = BookListController()
        let navigationController = UINavigationController()
        navigationController.pushViewController(vc, animated: true)
        
        let bookPresenter = BookPresenter()
        bookPresenter.interactor = BookInteractor()
        bookPresenter.view = vc
        bookPresenter.router = self
        
        vc.presenter = bookPresenter
        
        return vc
    }
    
    func showDetailsBook(_ book: Book, _ vc: UIViewController) {
        let detailsVC = DetailsViewController()
        detailsVC.setup(book: book)
        vc.present(detailsVC, animated: true)
    }
}
