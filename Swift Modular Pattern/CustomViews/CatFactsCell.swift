//
//  CatFactsCell.swift
//  Swift Modular Pattern
//
//  Created by Irinka Datoshvili on 03.05.24.
//

import UIKit

class CatFactsCell: UITableViewCell {
    var titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupBackground()
        setupTitleLabel()
    }
    
    private func setupBackground() {
        backgroundColor = .clear
        contentView.layer.cornerRadius = 25
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = UIColor(red: 3/255, green: 0, blue: 46/255, alpha: 1.0)
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.layer.borderWidth = 1.0
    }
    
    private func setupTitleLabel() {
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "FiraGO-Medium", size: 16)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        titleLabel.edgesToSuperview(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let cellSpacing: CGFloat = 10
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: cellSpacing / 2, left: 0, bottom: cellSpacing / 2, right: 0))
    }
}

