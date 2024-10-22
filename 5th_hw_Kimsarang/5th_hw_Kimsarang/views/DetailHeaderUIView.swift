//
//  DetailHeaderUIView.swift
//  5th_hw_Kimsarang
//
//  Created by 김사랑 on 10/21/24.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func didTapBackButton()
}

class DetailHeaderUIView: UIView {
    
    weak var delegate: HeaderViewDelegate?
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Jangu")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let customBackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "xx"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside) // Add target for back button
        return button
    }()
    
    private let tvShareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "rr"), for: .normal)
        return button
    }()
    
    private let topButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let playMainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "play")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let netflixImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logos_netflix-icon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let slabel: UILabel = {
        let label = UILabel()
        let text = "SERIES"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([.kern: 2.5], range: NSRange(location: 0, length: text.count))
        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let logoStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Selling Sunset"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.text = "2022"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let seasonsLabel: UILabel = {
        let label = UILabel()
        label.text = "5 Seasons"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tvImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tvma")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let hdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "video quality badges-2")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let visionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "video quality badges")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let adImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "video quality badges-3")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let playButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "play"
        if let image = UIImage(named: "play") {
            let size = CGSize(width: 18, height: 18)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            config.background.backgroundColor = .white
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        config.imagePadding = 8
        config.titlePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10)
        config.baseForegroundColor = .black
        let playButton = UIButton(configuration: config)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    
    private let downloadButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor(red: 44/255.0, green: 44/255.0, blue: 44/255.0, alpha: 1.0)
        config.title = "Download"
        if let image = UIImage(named: "Vector") {
            let resizedImage = UIGraphicsImageRenderer(size: CGSize(width: 19, height: 19)).image { _ in
                image.draw(in: CGRect(origin: .zero, size: CGSize(width: 19, height: 19)))
            }
            config.image = resizedImage
        }
        config.imagePadding = 8
        config.titlePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10)
        config.baseForegroundColor = .gray
        let downloadButton = UIButton(configuration: config)
        downloadButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        return downloadButton
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "S5: E10 Nothing Remains The Same"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Heart flip as Heather Weds Tarek. Jason and Mary grapple with being ghosted. Go solo or take the next step: The agents face life-changing decisions."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let myListButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.imagePlacement = .top
        if let image = UIImage(named: "p") {
            let size = CGSize(width: 24, height: 24)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        var text = AttributedString("My List")
        text.foregroundColor = .white
        text.font = UIFont.systemFont(ofSize: 10, weight: .light)
        config.attributedTitle = text
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let rateButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.imagePlacement = .top
        if let image = UIImage(named: "Rate") {
            let size = CGSize(width: 24, height: 24)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        var text = AttributedString("Rate")
        text.foregroundColor = .white
        text.font = UIFont.systemFont(ofSize: 10, weight: .light)
        config.attributedTitle = text
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shareButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.imagePlacement = .top
        if let image = UIImage(named: "share") {
            let size = CGSize(width: 24, height: 24)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        var text = AttributedString("Share")
        text.foregroundColor = .white
        text.font = UIFont.systemFont(ofSize: 10, weight: .light)
        config.attributedTitle = text
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(mainImageView)
        addSubview(topButtonStackView)
        addSubview(titleStackView)
        addSubview(playButton)
        addSubview(downloadButton)
        addSubview(descriptionTitleLabel)
        addSubview(descriptionLabel)
        addSubview(buttonsStackView)
        addSubview(customBackButton)
        
        topButtonStackView.addArrangedSubview(customBackButton)
        topButtonStackView.addArrangedSubview(tvShareButton)
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(yearLabel)
        titleStackView.addArrangedSubview(seasonsLabel)
        
        buttonsStackView.addArrangedSubview(myListButton)
        buttonsStackView.addArrangedSubview(rateButton)
        buttonsStackView.addArrangedSubview(shareButton)

        // Constraints setup
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Main ImageView Constraints
            mainImageView.topAnchor.constraint(equalTo: topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 250),

            // Top Button StackView Constraints
            topButtonStackView.topAnchor.constraint(equalTo: mainImageView.topAnchor, constant: 20),
            topButtonStackView.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 20),

            // Title StackView Constraints
            titleStackView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 8),
            titleStackView.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 20),

            // Play Button Constraints
            playButton.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 8),
            playButton.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 20),
            
            // Download Button Constraints
            downloadButton.topAnchor.constraint(equalTo: playButton.topAnchor),
            downloadButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 8),

            // Description Title Constraints
            descriptionTitleLabel.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 12),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 20),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: -20),

            // Description Label Constraints
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: -20),

            // Buttons StackView Constraints
            buttonsStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            buttonsStackView.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: -20),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 40),
            
            // Back Button Constraints
            customBackButton.widthAnchor.constraint(equalToConstant: 30),
            customBackButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    @objc private func backButtonTapped() {
        delegate?.didTapBackButton()
    }
}
