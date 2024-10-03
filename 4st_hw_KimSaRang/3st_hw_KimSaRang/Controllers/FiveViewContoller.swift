import UIKit

class FiveViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이미지 생성 및 설정
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "movie36") // 이미지 이름을 실제 이미지 이름으로 변경하세요
        imageView.contentMode = .scaleAspectFit
        
        // 텍스트 라벨 생성 및 설정
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "그냥 만들어봤어요...."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        
        // StackView 생성
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        // StackView를 View에 추가
        view.addSubview(stackView)
        
        // 제약 조건 추가
        NSLayoutConstraint.activate([
            // StackView 중앙 정렬
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // 이미지 크기 설정
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
