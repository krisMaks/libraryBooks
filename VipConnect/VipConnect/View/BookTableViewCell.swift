//
//  BookTableViewCell.swift
//  TableUI
//
//  Created by Кристина Максимова on 12.11.2021.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    private let idLabel = UILabel()
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let typeImage = UIImageView()
    private let ageLimitImage = UIImageView()
    
    private struct Const {
        static let horizontalMargin: CGFloat = 12
        static let marginTop: CGFloat = 10
        static let iconSide: CGFloat = 27
        static let iconsStack = iconSide * 2 + 12
    }
    
    func setup(book: Book) {
        self.idLabel.text = String(book.id)
        self.titleLabel.text = book.title
        self.authorLabel.text = book.author
        
        typeImage.image = UIImage(systemName: book.type.imageBookTypeName)
        ageLimitImage.image = UIImage(systemName: book.ageLimit.imageAgeLimit)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        idLabel.textColor = .gray
        idLabel.textAlignment = .left
        idLabel.font = .systemFont(ofSize: 10)
        self.addSubview(idLabel)
        
        titleLabel.textAlignment = .left
        titleLabel.font = .systemFont(ofSize: 14)
        self.addSubview(titleLabel)
        
        authorLabel.textAlignment = .left
        authorLabel.font = .systemFont(ofSize: 14)
        self.addSubview(authorLabel)
        self.addSubview(typeImage)
        self.addSubview(ageLimitImage)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        layout()
        let cellHeight = authorLabel.frame.maxY + Const.marginTop
        return CGSize(width: size.width, height: cellHeight)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    private func layout() {
        let cellHeight = self.contentView.bounds.height
        let iconMarginX = self.frame.width - Const.horizontalMargin - Const.iconSide
        
        idLabel.sizeToFit()
        titleLabel.sizeToFit()
        authorLabel.sizeToFit()
        
        idLabel.frame.origin.x = CGFloat(Const.horizontalMargin)
        idLabel.frame.origin.y = CGFloat(Const.marginTop)
        
        titleLabel.frame.origin.x = CGFloat(Const.horizontalMargin)
        titleLabel.frame.origin.y = CGFloat(idLabel.frame.maxY + Const.marginTop)
    
        authorLabel.frame.origin.x = CGFloat(Const.horizontalMargin)
        authorLabel.frame.origin.y = CGFloat(titleLabel.frame.maxY + Const.marginTop)
        
        typeImage.frame = CGRect(x: iconMarginX, y: cellHeight/2 - Const.iconsStack/2, width: Const.iconSide, height: Const.iconSide)
    
        ageLimitImage.frame = CGRect(x: iconMarginX, y: cellHeight/2 + Const.marginTop/2, width: Const.iconSide, height: Const.iconSide)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookType {
    var imageBookTypeName: String {
        switch self {
        case .electronic:
            return "book.closed.fill"
        case .audio:
            return "headphones.circle.fill"
        case .pdf:
            return "doc.circle"
        case .unknown:
            return "camera.metering.unknown"
        }
    }
}

extension AgeLimit {
    var imageAgeLimit: String {
        switch self {
        case .zero:
            return "0.circle.fill"
        case .six:
            return "6.circle.fill"
        case .twelve:
            return "12.circle.fill"
        case .sixteen:
            return "16.circle.fill"
        case .eighteen:
            return "18.circle.fill"
        case .unknown:
            return "camera.metering.unknown"
        }
    }
}

