//
//  DetailTableViewCell.swift
//  5th_hw_Kimsarang
//
//  Created by 김사랑 on 10/21/24.
//

import UIKit



class DetailTableViewCell: UITableViewCell {
    static let identifier = "DetailTableViewCell"
    
    
    let videoBox: UIView = {
        let box = CGRect(x: 0, y: 0, width: 124, height: 69)
        let renderBox = UIView(frame: box)
        renderBox.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.16)
        
        let cornerRadius: CGFloat = 4
        
        // Apply corner radius to only specific corners (top left and top right in this case)
        let roundedCorners: UIRectCorner = [.topLeft, .topRight]
        
        // The path should match the size of the view (124x69)
        let path = UIBezierPath(roundedRect: renderBox.bounds,
                                byRoundingCorners: roundedCorners,
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        // Create a shape layer to act as the mask
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        renderBox.layer.mask = mask
        
        renderBox.translatesAutoresizingMaskIntoConstraints = false
        return renderBox
    }()
    
    let playMainImageView: UIImageView = {
        let imageView = UIImageView()
        
        if let image = UIImage(named: "play-large") {
            imageView.image = image.withRenderingMode(.alwaysTemplate) // Use the image as a template
        }
        
        imageView.tintColor = .white // Set the desired color (white in this case)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "1. Game Changer"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    let timeLabel:UILabel = {
        let label = UILabel()
        label.text = "37m"
        
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let descriptionLabel:UILabel = {
        let label = UILabel()
        label.text = "Flying high: Chrishell reveals her latest love - Jason. In LA, the agents get real about the relationship while Christine readies her return."
        
        label.numberOfLines = 0;
        label.lineBreakMode = .byWordWrapping
        
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI(){
           
           videoBox.addSubview(playMainImageView)
           contentView.addSubview(videoBox)
           
           contentView.addSubview(titleLabel)
           contentView.addSubview(timeLabel)
           contentView.addSubview(descriptionLabel)
           
           NSLayoutConstraint.activate([
               videoBox.topAnchor.constraint(equalTo: contentView.topAnchor),
               videoBox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
               videoBox.widthAnchor.constraint(equalToConstant: 124),
               videoBox.heightAnchor.constraint(equalToConstant: 69),
               
               playMainImageView.centerXAnchor.constraint(equalTo: videoBox.centerXAnchor),
               playMainImageView.centerYAnchor.constraint(equalTo: videoBox.centerYAnchor),
               playMainImageView.widthAnchor.constraint(equalToConstant: 28),
               playMainImageView.heightAnchor.constraint(equalToConstant: 28),
               
               titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.5),
               titleLabel.leadingAnchor.constraint(equalTo: videoBox.trailingAnchor, constant: 8),
               titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
               
               timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
               timeLabel.leadingAnchor.constraint(equalTo: videoBox.trailingAnchor, constant: 8),
               timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
               descriptionLabel.topAnchor.constraint(equalTo: videoBox.bottomAnchor, constant: 8),
               descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
               descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                           
                       ])
                       
                   }
                   
               }
