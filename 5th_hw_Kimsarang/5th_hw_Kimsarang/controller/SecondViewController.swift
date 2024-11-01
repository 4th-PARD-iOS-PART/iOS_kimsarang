import UIKit

//// DetailHeaderUIView 정의
//class DetailHeaderUIView: UIView {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = .darkGray // 기본 배경색 설정
//        // 추가적인 UI 요소나 설정을 여기에 추가할 수 있습니다.
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    let tableView = UITableView()
    let searchBar = UISearchBar()
    let titleLabel = UILabel()
    
    // 데이터 예시 (이미지, 텍스트, 아이콘)
    let topSearches = [
        ("Citation", "movie26"),
        ("Oloture", "movie25"),
        ("The Setup", "movie22"),
        ("Breaking Bad", "movie21"),
        ("Ozark", "movie29"),
        ("The Governor", "movie23"),
        ("Your Excellency", "movie30"),
        ("내렸어..?", "movie30"),
        ("내려줘서 고마워윱..", "movie30"),
        ("졸려여,,,", "movie30"),
        ("새벽이야..", "movie30"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupSearchBarAndTitle()
        setupTableView()
    }
    
    func setupSearchBarAndTitle() {
        // 서치바 설정
        searchBar.delegate = self
        searchBar.placeholder = "Search for a show, movie, genre, etc."
        searchBar.sizeToFit()
        
        // 타이틀 설정
        titleLabel.text = "Top Searches"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .left
        
        // 서치바와 타이틀을 스택뷰로 묶기
        let headerView = UIStackView(arrangedSubviews: [searchBar, titleLabel])
        headerView.axis = .vertical
        headerView.spacing = 10 // 서치바와 타이틀 사이의 간격
        headerView.alignment = .fill
        headerView.distribution = .fill
        
        // 스택뷰 크기 조정
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 100)
        
        // 테이블 뷰의 헤더로 설정
        tableView.tableHeaderView = headerView
    }
    
    func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchCell")
        view.addSubview(tableView)
    }
    
    // UITableViewDataSource 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topSearches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchTableViewCell
        let searchItem = topSearches[indexPath.row]
        cell.titleLabel.text = searchItem.0
        cell.iconImageView.image = UIImage(named: searchItem.1) // 이미지 설정
        return cell
    }
    
    // UITableViewDelegate 메서드 - 셀 높이 조절
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // 셀의 높이를 100으로 설정
    }

    // UITableViewDelegate 메서드 - 셀 선택 시 모달 표시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modalViewController = DetailHeaderViewController()
        
        // iOS 16 이상에서만 .large 스타일 사용
        if #available(iOS 16.0, *) {
            modalViewController.modalPresentationStyle = .automatic // 또는 .large로 변경
        } else {
            modalViewController.modalPresentationStyle = .fullScreen // iOS 16 미만에서는 전체 화면으로 설정
        }

        modalViewController.modalTransitionStyle = .crossDissolve // 모달 애니메이션 설정
        self.present(modalViewController, animated: true, completion: nil)
    }
    
    // SearchTableViewCell 정의
    class SearchTableViewCell: UITableViewCell {
        
        let iconImageView = UIImageView()
        let titleLabel = UILabel()
        let playButton = UIButton(type: .system)
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            setupViews()
            layoutViews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupViews() {
            // 이미지 설정
            iconImageView.contentMode = .scaleAspectFill
            iconImageView.clipsToBounds = true
            contentView.addSubview(iconImageView)
            
            // 제목 설정
            titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            contentView.addSubview(titleLabel)
            
            // 버튼 설정
            playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            contentView.addSubview(playButton)
        }
        
        func layoutViews() {
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            playButton.translatesAutoresizingMaskIntoConstraints = false
            
            // 오토레이아웃 설정
            NSLayoutConstraint.activate([
                iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                iconImageView.widthAnchor.constraint(equalToConstant: 80),
                iconImageView.heightAnchor.constraint(equalToConstant: 80),
                
                titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
                titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                
                playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                playButton.widthAnchor.constraint(equalToConstant: 30),
                playButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
    }
}

// DetailHeaderViewController 정의
class DetailHeaderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 배경을 검은색으로 설정
        view.backgroundColor = UIColor.black.withAlphaComponent(1.0)
        
        // DetailHeaderUIView를 추가
        let detailHeaderView = DetailHeaderUIView()
        detailHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailHeaderView)
        
        // 레이아웃 설정
        NSLayoutConstraint.activate([
            detailHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            detailHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailHeaderView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
