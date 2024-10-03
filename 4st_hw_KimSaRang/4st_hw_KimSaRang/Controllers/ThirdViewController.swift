import UIKit

class ThirdViewController: UIViewController {
    
    // 스크롤 뷰 및 컨텐츠 스택 뷰
    let scrollView = UIScrollView()
    let contentStackView = UIStackView()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // 뷰 설정
        view.backgroundColor = .black
        setupHeaderView()  // 타이틀과 이미지가 있는 헤더 설정
        setupScrollView()
        setupContent()
    }
    
    
    // 상단 헤더 뷰 설정
    func setupHeaderView() {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        
        // 타이틀 라벨
        let titleLabel = UILabel()
        titleLabel.text = "Notifications"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 이미지 뷰
        let iconImageView = UIImageView(image: UIImage(named: "Group 49"))
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // 스택 뷰 생성 (이미지와 타이틀)
        let titleStackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        titleStackView.axis = .horizontal
        titleStackView.spacing = 8
        titleStackView.alignment = .center
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        headerView.addSubview(titleStackView)
        
        // 헤더 뷰와 제약 설정
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            titleStackView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            titleStackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor)
        ])
    }
    
    // 스크롤 뷰 설정
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // 스크롤 뷰 제약 설정
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80), // 헤더 아래로 스크롤 뷰 위치
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // 스크롤 뷰 안의 컨텐츠 스택 뷰 설정
        contentStackView.axis = .vertical
        contentStackView.spacing = 20
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
  
        
        
        // 콘텐츠 추가
        func setupContent() {
            // 여러 섹션을 추가
            for _ in 0..<3 {
                addSection(
                    imageName: "movie10",   // 이미지 이름
                    title: "Castle & Castle",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui...",
                    tags: ["Steamy", "Soapy", "Slow Burn", "Suspenseful", "Teen", "Mystery"]
                )
            }
        }
        
        // 섹션 추가 함수
        func addSection(imageName: String, title: String, description: String, tags: [String]) {
            // 이미지 뷰
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFit
            imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            // 타이틀 라벨
            let titleLabel = UILabel()
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.text = title
            titleLabel.textColor = .white
            titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
            
            // 설명 라벨
            let descriptionLabel = UILabel()
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.text = description
            descriptionLabel.textColor = .white
            descriptionLabel.font = UIFont.systemFont(ofSize: 14)
            descriptionLabel.numberOfLines = 0
            
            // 태그 스택 뷰
            let tagStackView = UIStackView()
            tagStackView.axis = .horizontal
            tagStackView.spacing = 8
            tagStackView.distribution = .fillProportionally
            
            for tag in tags {
                let tagLabel = UILabel()
                tagLabel.text = tag
                tagLabel.textColor = .white
                tagLabel.font = UIFont.systemFont(ofSize: 12)
                tagStackView.addArrangedSubview(tagLabel)
            }
            
            // 버튼 뷰 (Remind Me와 Share 버튼)
            let buttonStackView = UIStackView()
            buttonStackView.axis = .horizontal
            buttonStackView.spacing = 20
            buttonStackView.distribution = .fillEqually
            
            let remindButton = UIButton(type: .system)
            remindButton.setTitle("Remind Me", for: .normal)
            remindButton.setTitleColor(.white, for: .normal)
            remindButton.setImage(UIImage(systemName: "bell.fill"), for: .normal)  // 아이콘 설정
            remindButton.tintColor = .white  // 아이콘 색상
            
            // 이미지와 텍스트 위치 조정
            remindButton.contentHorizontalAlignment = .center
            remindButton.contentVerticalAlignment = .center
            
            // 텍스트와 이미지 간격 조정
            remindButton.titleEdgeInsets = UIEdgeInsets(top: 20, left: remindButton.imageView!.frame.size.width, bottom: -remindButton.imageView!.frame.size.height - 10, right: 0)
            remindButton.imageEdgeInsets = UIEdgeInsets(top: remindButton.titleLabel!.intrinsicContentSize.height - 10, left: 0, bottom: 0, right: remindButton.titleLabel!.intrinsicContentSize.width)
            
            let shareButton = UIButton(type: .system)
            shareButton.setTitle("Share", for: .normal)
            shareButton.setTitleColor(.white, for: .normal)
            shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)  // 아이콘 설정
            shareButton.tintColor = .white  // 아이콘 색상
            shareButton.contentHorizontalAlignment = .center
            shareButton.contentVerticalAlignment = .center
            shareButton.titleEdgeInsets = UIEdgeInsets(top: 20, left: shareButton.imageView!.frame.size.width, bottom: -shareButton.imageView!.frame.size.height - 10, right: 0)
            shareButton.imageEdgeInsets = UIEdgeInsets(top: shareButton.titleLabel!.intrinsicContentSize.height - 10, left: 0, bottom: 0, right: shareButton.titleLabel!.intrinsicContentSize.width)
            buttonStackView.addArrangedSubview(remindButton)
            buttonStackView.addArrangedSubview(shareButton)
            
            // 섹션 스택 뷰 (수직 배치)
            let sectionStackView = UIStackView(arrangedSubviews: [
                buttonStackView, imageView, titleLabel, descriptionLabel, tagStackView
            ]) // buttonStackView를 타이틀 위로 배치
            sectionStackView.axis = .vertical
            sectionStackView.spacing = 10
            sectionStackView.translatesAutoresizingMaskIntoConstraints = false
            
            // 메인 스택 뷰에 섹션 추가
            contentStackView.addArrangedSubview(sectionStackView)
        }
    }

