//
//  TableViewCell.swift
//  6th_hw_Kimsarang
//
//  Created by 김사랑 on 11/1/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let partLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "TableViewCell")
        setUI()
    }
    func setUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(partLabel)
        
        NSLayoutConstraint.activate([
            partLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            partLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                        
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: partLabel.trailingAnchor , constant: 20),
              ])
            }
    }

