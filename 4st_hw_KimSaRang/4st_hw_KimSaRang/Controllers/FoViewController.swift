import UIKit

class FoViewController: UIViewController {
    
    // 이미지 뷰
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Download Page Icon")
        return imageView
    }()
    
    // 텍스트 라벨
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Movies and TV shows that you download appear here."
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    // 버튼
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Find Something to Download", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // 뷰에 서브뷰 추가
        view.addSubview(imageView)
        view.addSubview(textLabel)
        view.addSubview(actionButton)
        
        // Auto Layout 설정
        setUpConstraints()
    }
    
    // 버튼 액션 함수
    @objc func buttonTapped() {
        print("Button was tapped!")
    }
    
    // Auto Layout 설정 함수
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            // 이미지 뷰를 화면 중앙에 배치
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            imageView.widthAnchor.constraint(equalToConstant: 200),  // 이미지 너비
            imageView.heightAnchor.constraint(equalToConstant: 200),  // 이미지 높이
            
            // 텍스트 라벨을 이미지 아래에 배치
            textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // 버튼을 텍스트 아래에 배치
            actionButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 180),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.widthAnchor.constraint(equalToConstant: 300),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
