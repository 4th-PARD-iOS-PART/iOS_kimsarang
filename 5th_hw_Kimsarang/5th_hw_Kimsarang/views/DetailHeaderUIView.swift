import UIKit

// HeaderViewDelegate 프로토콜 정의
protocol HeaderViewDelegate: AnyObject {
    func didTapBackButton()
}

class DetailHeaderUIView: UIView {
    weak var delegate: HeaderViewDelegate? // delegate 프로퍼티 추가
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray // 기본 배경색 설정
        setupViews() // UI 설정 메서드 호출
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        let imageView = UIImageView(image: UIImage(named: "Jangu"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView1 = UIImageView(image: UIImage(named: "logos_netflix-icon"))
        imageView.contentMode = .scaleAspectFit
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView2 = UIImageView(image: UIImage(named: "SERIES"))
        imageView2.contentMode = .scaleAspectFit
        imageView2.translatesAutoresizingMaskIntoConstraints = false

        // 이미지 뷰의 크기 제약 조건 설정 (예: 50x50)
        NSLayoutConstraint.activate([
            imageView2.widthAnchor.constraint(equalToConstant: 30),
            imageView2.heightAnchor.constraint(equalToConstant: 50)
        ])

        
        
        let textLabel = UILabel()
        textLabel.text = "Selling Sunset"
        textLabel.font = .systemFont(ofSize:20 , weight: .bold)
        textLabel.textColor = .white
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel1 = UILabel()
        textLabel1.text = "2022"
        textLabel1.font = .systemFont(ofSize: 12, weight: .light)
        textLabel1.textColor = .white
        textLabel1.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView3 = UIImageView(image: UIImage(named: "tvma"))
        imageView.contentMode = .scaleAspectFit
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel2 = UILabel()
        textLabel2.text = "5 Seasons"
        textLabel2.font = .systemFont(ofSize: 12, weight: .light)
        textLabel2.textColor = .white
        textLabel2.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView4 = UIImageView(image: UIImage(named: "Vision"))
        imageView.contentMode = .scaleAspectFit
        imageView4.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView5 = UIImageView(image: UIImage(named: "HD"))
        imageView.contentMode = .scaleAspectFit
        imageView5.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView6 = UIImageView(image: UIImage(named: "AD"))
        imageView.contentMode = .scaleAspectFit
        imageView6.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        let button4: UIButton = {
            var configuration = UIButton.Configuration.filled()
            configuration.background.backgroundColor = .white
            configuration.title = "Play"
            configuration.baseForegroundColor = .black
            configuration.image = UIImage(named: "play")
            configuration.imagePadding = 1
            configuration.titlePadding = 1
            
            configuration.imagePlacement = .leading
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            

            let button4 = UIButton(configuration: configuration)
            button4.titleLabel?.font = UIFont.systemFont(ofSize: 20.46, weight: .bold)
            button4.translatesAutoresizingMaskIntoConstraints = false
            return button4
            
            
        }()
        
        
//        let textButton = UIButton()
//        textButton.setTitle("Play", for: .normal)
//        textButton.setTitleColor(.black, for: .normal)
//        textButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
//        textButton.backgroundColor = .white
//        textButton.layer.cornerRadius = 5
//        textButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        let imageView7 = UIImageView(image: UIImage(named: "play"))
//        imageView.contentMode = .scaleAspectFit
//        imageView7.translatesAutoresizingMaskIntoConstraints = false
        
        let button5: UIButton = {
            var configuration = UIButton.Configuration.filled()
            configuration.background.backgroundColor = .darkGray
            configuration.title = "Download"
            configuration.baseForegroundColor = .black

            // 이미지 리사이즈 코드
            if let image = UIImage(named: "Download Page Icon") {
                let size = CGSize(width: 20, height: 20)  // 원하는 크기 설정
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                configuration.image = scaledImage  // 리사이즈된 이미지 설정
            }

            configuration.imagePlacement = .leading  // 이미지 왼쪽 배치
            configuration.imagePadding = 8  // 이미지와 텍스트 간 간격
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

            let button5 = UIButton(configuration: configuration)
            button5.titleLabel?.font = UIFont.systemFont(ofSize: 20.46, weight: .bold)
            button5.translatesAutoresizingMaskIntoConstraints = false
            return button5


            
            
        }()
        
//
//        let textButton1 = UIButton()
//        textButton1.setTitle("Download", for: .normal)
//        textButton1.setTitleColor(.gray, for: .normal)
//        textButton1.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
//        textButton1.backgroundColor = .darkGray
//        textButton1.layer.cornerRadius = 5
//        textButton1.translatesAutoresizingMaskIntoConstraints = false /// 종료 안 하면 안 보여줌
//        
//        let imageView8 = UIImageView(image: UIImage(named: "Download Page Icon"))
//        imageView8.contentMode = .scaleAspectFit
//        imageView8.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel3 = UILabel()
        textLabel3.text = "SE:E10 Nothing Remains The Same"
        textLabel3.font = .systemFont(ofSize: 14, weight: .bold)
        textLabel3.textColor = .white
        textLabel3.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel4 = UILabel()
        textLabel4.text = "Hearts flip as Heather weds Tarek. Jason and Mart grapple with being ghosted. Go solo or take the next step: The agents face life-changing decisions"
        textLabel4.font = .systemFont(ofSize: 14, weight: .medium)
        textLabel4.textColor = .white
        textLabel4.numberOfLines = 0 // 줄 수 제한 없이 사용
        textLabel4.lineBreakMode = .byWordWrapping
        textLabel4.translatesAutoresizingMaskIntoConstraints = false
        
        let button1: UIButton = {
            var configuration = UIButton.Configuration.filled()
            configuration.background.backgroundColor = .clear
            configuration.title = "Rate"
            configuration.image = UIImage(named: "global icon")
            configuration.imagePadding = 1
            configuration.titlePadding = 1
            
            configuration.imagePlacement = .top
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            

            let button1 = UIButton(configuration: configuration)
            button1.titleLabel?.font = UIFont.systemFont(ofSize: 20.46, weight: .bold)
            button1.translatesAutoresizingMaskIntoConstraints = false
            return button1
            
            
        }()
        
        let button2: UIButton = {
            var configuration = UIButton.Configuration.filled()
            configuration.background.backgroundColor = .clear
            configuration.title = "My List"
            configuration.image = UIImage(named: "plus")
            configuration.imagePadding = 1
            configuration.titlePadding = 1
            
            configuration.imagePlacement = .top
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            

            let button2 = UIButton(configuration: configuration)
            button2.titleLabel?.font = UIFont.systemFont(ofSize: 20.46, weight: .bold)
            button2.translatesAutoresizingMaskIntoConstraints = false
            return button2
            
            
        }()
        let button3: UIButton = {
            var configuration = UIButton.Configuration.filled()
            configuration.background.backgroundColor = .clear
            configuration.title = "share"
            configuration.image = UIImage(named: "send")
            configuration.imagePadding = 1
            configuration.titlePadding = 1
            
            configuration.imagePlacement = .top
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            

            let button3 = UIButton(configuration: configuration)
            button3.titleLabel?.font = UIFont.systemFont(ofSize: 20.46, weight: .bold)
            button3.translatesAutoresizingMaskIntoConstraints = false
            return button3
            
            
        }()
        
        let textLabel5 = UILabel()
        textLabel5.text = "Episodes"
        textLabel5.font = UIFont.systemFont(ofSize: .init(12), weight: .bold)
        textLabel5.textColor = .white
        textLabel5.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel6 = UILabel()
        textLabel6.text = "collection"
        textLabel6.font = UIFont.systemFont(ofSize: .init(12), weight: .bold)
        textLabel6.textColor = .white
        textLabel6.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel7 = UILabel()
        textLabel7.text = "More Like This"
        textLabel7.font = UIFont.systemFont(ofSize: .init(12), weight: .bold)
        textLabel7.textColor = .gray
        textLabel7.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel8 = UILabel()
        textLabel8.text = "Treilers & More"
        textLabel8.font = UIFont.systemFont(ofSize: .init(12), weight: .bold)
        textLabel8.textColor = .gray
        textLabel8.translatesAutoresizingMaskIntoConstraints = false
        
        
        let textLabel9 = UILabel()
        textLabel9.text = "Season 5"
        textLabel9.font = UIFont.systemFont(ofSize: .init(12), weight: .light)
        textLabel9.textColor = .white
        textLabel9.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView9 = UIImageView(image: UIImage(named: "chevron.down"))
        imageView.contentMode = .scaleAspectFit
        imageView9.tintColor = .white
        imageView9.translatesAutoresizingMaskIntoConstraints = false
        

        
        
        addSubview(imageView)
        addSubview(imageView1)
        addSubview(imageView2)
        
        addSubview(textLabel)
        addSubview(textLabel1)
        
        addSubview(imageView3)
        
        addSubview(textLabel2)
        
        addSubview(imageView4)
        addSubview(imageView5)
        addSubview(imageView6)
        
        addSubview(button4)
        addSubview(button5)
        
        //addSubview(textButton)
        //addSubview(imageView7)
        
//        addSubview(textButton1)
//        addSubview(imageView8)
        
        addSubview(textLabel3)
        addSubview(textLabel4)
        
        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
        
        addSubview(textLabel5)
        addSubview(textLabel6)
        addSubview(textLabel7)
        addSubview(textLabel8)
        addSubview(textLabel9)
        addSubview(imageView9)
        
      
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0), // BackButton 아래 배치
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 230),
            
            imageView1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            imageView1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageView1.heightAnchor.constraint(equalToConstant: 30),
            imageView1.widthAnchor.constraint(equalToConstant: 30),
            
            imageView2.topAnchor.constraint(equalTo: imageView1.topAnchor),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: 10),
            imageView2.heightAnchor.constraint(equalToConstant: 30),
            
            
            textLabel.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            textLabel1.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
            textLabel1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textLabel1.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            imageView3.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
            imageView3.leadingAnchor.constraint(equalTo: textLabel1.leadingAnchor, constant: 35),
            imageView3.heightAnchor.constraint(equalToConstant: 20),
            
            textLabel2.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
            textLabel2.leadingAnchor.constraint(equalTo: textLabel1.leadingAnchor, constant: 100),
            textLabel2.heightAnchor.constraint(equalToConstant: 20),
            
            imageView4.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
            imageView4.leadingAnchor.constraint(equalTo: textLabel2.leadingAnchor, constant: 65),
            imageView4.heightAnchor.constraint(equalToConstant: 20),
            
            imageView5.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
            imageView5.leadingAnchor.constraint(equalTo: textLabel2.leadingAnchor, constant: 170),
            imageView5.heightAnchor.constraint(equalToConstant: 20),
            
            imageView6.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
            imageView6.leadingAnchor.constraint(equalTo: textLabel2.leadingAnchor, constant: 213),
            imageView6.heightAnchor.constraint(equalToConstant: 30),
            
            button4.topAnchor.constraint(equalTo: imageView4.bottomAnchor, constant: 20),
            button4.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button4.heightAnchor.constraint(equalToConstant: 30),
            button4.widthAnchor.constraint(equalToConstant: 400),
            
            button5.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 20),
            button5.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button5.heightAnchor.constraint(equalToConstant: 30),
            button5.widthAnchor.constraint(equalToConstant: 400),
            
//            textButton.topAnchor.constraint(equalTo: imageView4.bottomAnchor, constant: 20),
//            textButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            textButton.heightAnchor.constraint(equalToConstant: 30),
//            textButton.widthAnchor.constraint(equalToConstant: 400),
            
//            imageView7.topAnchor.constraint(equalTo: imageView4.bottomAnchor, constant: 20),
//            imageView7.leadingAnchor.constraint(equalTo: textButton.leadingAnchor, constant: 150),
//            imageView7.heightAnchor.constraint(equalToConstant: 20),
//            
//            textButton1.topAnchor.constraint(equalTo: textButton.bottomAnchor, constant: 20),
//            textButton1.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            textButton1.heightAnchor.constraint(equalToConstant: 30),
//            textButton1.widthAnchor.constraint(equalToConstant: 400),
//            
//            imageView8.topAnchor.constraint(equalTo: textButton.bottomAnchor, constant: 20),
//            imageView8.leadingAnchor.constraint(equalTo: textButton1.leadingAnchor, constant: 50),
//            imageView8.heightAnchor.constraint(equalToConstant: 35),
            
            textLabel3.topAnchor.constraint(equalTo: button5.bottomAnchor, constant: 20),
            textLabel3.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textLabel3.heightAnchor.constraint(equalToConstant: 30),
            
            textLabel4.topAnchor.constraint(equalTo: textLabel3.bottomAnchor, constant: 5),
            textLabel4.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textLabel4.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            button1.topAnchor.constraint(equalTo: textLabel4.bottomAnchor, constant: 20),
            button1.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -50),
            button1.heightAnchor.constraint(equalToConstant: 30),
            button1.widthAnchor.constraint(equalToConstant: 400),
            
            button2.topAnchor.constraint(equalTo: textLabel4.bottomAnchor, constant:  20),
            button2.centerXAnchor.constraint(equalTo: button1.centerXAnchor, constant: -80),
            button2.heightAnchor.constraint(equalToConstant: 30),
            button2.widthAnchor.constraint(equalToConstant: 400),
            
            button3.topAnchor.constraint(equalTo: textLabel4.bottomAnchor, constant:  20),
            button3.centerXAnchor.constraint(equalTo: button1.centerXAnchor, constant: 80),
            button3.heightAnchor.constraint(equalToConstant: 30),
            button3.widthAnchor.constraint(equalToConstant: 400),
            
            textLabel5.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 30),
            textLabel5.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            textLabel6.topAnchor.constraint(equalTo: textLabel5.topAnchor), // 같은 높이 유지
            textLabel6.leadingAnchor.constraint(equalTo: textLabel5.trailingAnchor, constant: 20), // 오른쪽에 20pt 간격
            textLabel7.topAnchor.constraint(equalTo: textLabel5.topAnchor),
            textLabel7.leadingAnchor.constraint(equalTo: textLabel6.trailingAnchor, constant: 20),
            textLabel8.topAnchor.constraint(equalTo: textLabel5.topAnchor),
            textLabel8.leadingAnchor.constraint(equalTo: textLabel7.trailingAnchor, constant: 20),
            
            textLabel9.topAnchor.constraint(equalTo: textLabel5.bottomAnchor, constant: 20),
            textLabel9.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageView9.topAnchor.constraint(equalTo: textLabel9.topAnchor, constant: 20),
            imageView9.leadingAnchor.constraint(equalTo: textLabel9.trailingAnchor, constant: 20),

            
            
            
            
            
            
            
            
        
            
            

    ])
    }
    
}
