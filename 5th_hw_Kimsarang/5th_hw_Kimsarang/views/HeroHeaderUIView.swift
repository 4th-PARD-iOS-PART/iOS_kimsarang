//
//  HeroHeaderUIView.swift
//  4th_hw_Kimsarnag
//
//  Created by 김사랑 on 10/4/24.
//

import UIKit
///메인 사진 버튼 3개
class HeroHeaderUIView: UIView {
    
    let button1: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = .clear
        configuration.title = "My List"
        configuration.image = UIImage(named: "ant-design_plus-outlined")
        configuration.imagePadding = 1
        configuration.titlePadding = 1
        
        configuration.imagePlacement = .top
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let button1 = UIButton(configuration: configuration)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 20.46, weight: .bold)
        button1.translatesAutoresizingMaskIntoConstraints = false
        return button1
    }()

   
    private let InfoButton: UIButton = {
        
        var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = .clear
        configuration.title = "Info"
        configuration.image = UIImage(named: "feather_info")
        configuration.imagePadding = 1
        configuration.titlePadding = 1
        configuration.imagePlacement = .top
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let InfoBtton = UIButton(configuration: configuration)
        InfoBtton.setTitleColor(.white, for: .normal)
        InfoBtton.titleLabel?.font = UIFont.systemFont(ofSize: 13.64, weight: .regular)
        InfoBtton.translatesAutoresizingMaskIntoConstraints = false
     
        return InfoBtton
    }()
    
    let playButton: UIButton = {
        
        var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = UIColor.lightGray
        configuration.title = "Play"
        configuration.image = UIImage(named: "Vector")
        configuration.imagePadding = 15
        configuration.titlePadding = 15
        configuration.contentInsets = NSDirectionalEdgeInsets (top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let playButton = UIButton(configuration: configuration)
        playButton.setTitleColor(.black, for: .normal)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 13.64, weight: .regular)
        playButton.translatesAutoresizingMaskIntoConstraints = false

        return playButton
    }()
        ///메인 이미지
    private let heroImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "movie1")
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
        
    }
    ///상단의 로고와 문자열들
    let tvShow: UIButton = {
        let tvButton = UIButton(type: .system)
        tvButton.setTitle("TV Shows", for: .normal)
        tvButton.translatesAutoresizingMaskIntoConstraints = false
        tvButton.setTitleColor(.white, for: .normal)
        tvButton.backgroundColor = .clear
        return tvButton
    }()
    
    let Movies: UIButton = {
        let MoviesButton = UIButton(type: .system)
        MoviesButton.setTitle("Movies", for: .normal)
        MoviesButton.translatesAutoresizingMaskIntoConstraints = false
        MoviesButton.setTitleColor(.white, for: .normal)
        MoviesButton.backgroundColor = .clear
        return MoviesButton
    }()
    
    
    let Mylist: UIButton = {
        let mylistButton = UIButton(type: .system)
        mylistButton.setTitle("Mylist", for: .normal)
        mylistButton.translatesAutoresizingMaskIntoConstraints = false
        mylistButton.setTitleColor(.white, for: .normal)
        mylistButton.backgroundColor = .clear
        return mylistButton
    }()
    
    private let LogosView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logos_netflix-icon")
        imageView.contentMode = .scaleAspectFit // 또는 원하는 콘텐츠 모드
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

        

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addSubview(LogosView)
        addGradient()
        addSubview(playButton)
        addSubview(InfoButton)
        addSubview(button1)
        addSubview(tvShow)
        addSubview(Movies)
        addSubview(Mylist)
        applyConstraints()
    }
    
    ///버튼 위치 조정
    private func applyConstraints() {
        
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 135),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            playButton.widthAnchor.constraint(equalToConstant: 100),
            playButton.heightAnchor.constraint(equalToConstant: 40),
        ]
        
        let InfoButton = [
            InfoButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -140),
            InfoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            InfoButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let button1 = [
            button1.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            button1.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            button1.widthAnchor.constraint(equalToConstant: 134),
            button1.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let tvShow = [
            tvShow.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            tvShow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -160)
        ]
        
        let Movies = [
            Movies.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            Movies.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)
        ]
        
        let Mylist = [
            Mylist.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            Mylist.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ]
        
        let logosViewConstraints = [
               LogosView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
               LogosView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -300),
               LogosView.widthAnchor.constraint(equalToConstant: 100)
               
                          ]

    
        NSLayoutConstraint.activate(button1)
        NSLayoutConstraint.activate(InfoButton)
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(tvShow)
        NSLayoutConstraint.activate(Movies)
        NSLayoutConstraint.activate(Mylist)
        NSLayoutConstraint.activate(logosViewConstraints)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
}
