//
//  SecondViewCell.swift
//  3st_hw_KimSaRang
//
//  Created by 김사랑 on 10/3/24.
//

import UIKit

class SecondViewCell: UITableViewCell {
    
    
    let cllLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let cellplayImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let cellimage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    required init?(coder:NSCoder) {
        fatalError()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "secondCell")
        setUI()
        contentView.backgroundColor = .white
    }
    
    func setUI(){
        
        contentView.addSubview(cellimage)
        contentView.addSubview(cllLabel)
        contentView.addSubview(cellplayImage)
        
        NSLayoutConstraint.activate([
            cellimage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellimage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellimage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellimage.widthAnchor.constraint(equalToConstant: 140),
            
            cllLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            ///라벨이랑 이미지랑 5 떨어져잇다.
            cllLabel.leadingAnchor.constraint(equalTo: cellimage.trailingAnchor, constant: 5),
            
            cellplayImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellplayImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            cellplayImage.widthAnchor.constraint(equalToConstant: 28),
            cellplayImage.heightAnchor.constraint(equalToConstant: 28),
            
            
            
        
        ])
    }
    
    }
