//
//  DetailsViewController.swift
//  TableUI
//
//  Created by Кристина Максимова on 12.11.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    struct Const {
        static let horizontalMargin: CGFloat = 12
        static let marginTop: CGFloat = 10
        static let iconSide: CGFloat = 27
        static let iconsStack: CGFloat = iconSide * 2 + horizontalMargin
    }
    
    private let dateExpirationLabel = UILabel()
    private let dateAdmissionLabel = UILabel()
    private let priceAdmissionLabel = UILabel()
    private let fullNameAuthorLabel = UILabel()
    private let titleBookLabel = UILabel()
    
    private let typeImage = UIImageView()
    private let bookImage = UIImageView()
    private let ageLimitImage = UIImageView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.addSubview(titleBookLabel)
        view.addSubview(fullNameAuthorLabel)
        view.addSubview(dateAdmissionLabel)
        view.addSubview(dateExpirationLabel)
        
        priceAdmissionLabel.font = .systemFont(ofSize: 40)
        priceAdmissionLabel.textColor = .darkGray
        view.addSubview(priceAdmissionLabel)
        
        bookImage.image = UIImage(named: "bookImg.jpg")
        view.addSubview(bookImage)
        view.addSubview(typeImage)
        view.addSubview(ageLimitImage)
    }
    
    func setup(book: Book) {
        view.backgroundColor = .white

        titleBookLabel.text = "Название: \(book.title)"
        fullNameAuthorLabel.text = "Автор: \(book.authorFullName ?? "")"
        dateAdmissionLabel.text = "Дата поступления: \(book.admissionDate)"
        dateExpirationLabel.text = "Выдана до: \(book.expirationDate ?? "")"
        priceAdmissionLabel.text = "\(book.admissionPrice)"
        
        typeImage.image = UIImage(systemName: book.type.imageBookTypeName)
        ageLimitImage.image = UIImage(systemName: book.ageLimit.imageAgeLimit)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layout()
    }
    
    func layout() {
        let iconBookImageSide: CGFloat = view.frame.height * 0.3
        
        titleBookLabel.sizeToFit()
        fullNameAuthorLabel.sizeToFit()
        dateAdmissionLabel.sizeToFit()
        dateExpirationLabel.sizeToFit()
        priceAdmissionLabel.sizeToFit()

        bookImage.frame.size = CGSize(width: iconBookImageSide, height: iconBookImageSide)
        bookImage.frame.origin.x = CGFloat(view.bounds.width/2 - bookImage.frame.width/2)
        bookImage.frame.origin.y = CGFloat(Const.marginTop)

        
        typeImage.frame = CGRect(x: view.bounds.width/2 - Const.iconsStack/2, y: Const.marginTop * 2 + iconBookImageSide, width: Const.iconSide, height: Const.iconSide)
        
        ageLimitImage.frame = CGRect(x: view.bounds.width/2 + Const.horizontalMargin/2, y: iconBookImageSide + Const.marginTop * 2, width: Const.iconSide, height: Const.iconSide)
        
        titleBookLabel.frame.origin.x = CGFloat(Const.horizontalMargin)
        titleBookLabel.frame.origin.y = CGFloat(typeImage.frame.maxY + Const.marginTop)
        
        fullNameAuthorLabel.frame.origin.x = CGFloat(Const.horizontalMargin)
        fullNameAuthorLabel.frame.origin.y = CGFloat(titleBookLabel.frame.maxY + Const.marginTop)
        
        dateAdmissionLabel.frame.origin.x = CGFloat(Const.horizontalMargin)
        dateAdmissionLabel.frame.origin.y = CGFloat(fullNameAuthorLabel.frame.maxY + Const.marginTop)
        
        dateExpirationLabel.frame.origin.x = CGFloat(Const.horizontalMargin)
        dateExpirationLabel.frame.origin.y = CGFloat(dateAdmissionLabel.frame.maxY + Const.marginTop)
    
        priceAdmissionLabel.frame.origin.x = CGFloat(view.bounds.width/2 - priceAdmissionLabel.frame.width/2)
        priceAdmissionLabel.frame.origin.y = CGFloat(view.bounds.height - Const.marginTop - priceAdmissionLabel.frame.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
