import UIKit

class DetalilViewController: UIViewController {
    
    var members: [MemberData] = []  // 테이블 뷰에 표시할 멤버 정보 리스트
    let baseURL = "http://ec2-13-209-3-68.ap-northeast-2.compute.amazonaws.com:8080"
    
    
    
    // 테이블 뷰: 멤버 리스트를 보여주는 UI 요소
//    let tableView: UITableView = {
//        let view = UITableView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    // 데이터 저장할 옵셔널 변수
    var name: String?
    var age: Int?
    var part: String?
    var id: Int?
    
    // UI 초기화
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize:15 , weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize:15 , weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let partLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize:15 , weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.tintColor = .red
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(name!)
        print(part!)
        print(age!)
        view.backgroundColor = .white
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        setValue()
        setupUI()
        
//        let specificUserID = "12345"  // 예시 ID
//        getData(forID: specificUserID)  // 특정 ID 데이터만 가져오기
    }
    
    @objc func deleteButtonTapped() {
        let alert = UIAlertController(title: "Delete Confirmation",
                                      message: "Are you sure you want to delete this item?",
                                      preferredStyle: .alert)
        //취소 확인 .cancel
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        //삭제 버튼
        alert.addAction(UIAlertAction(title: "Delete ", style: .destructive, handler: { [self] _ in
            print("Item deleted")
            self.deleteData(userID: id!)
            //이 자리에 삭제 하는 함수 실행시키기
            //vc로 id 값을 int 로 받고 이 부분 딜리트 부분을 수정한다.
            
            // 알림 창 닫기
                   self.dismiss(animated: true, completion: nil)
               }))
               
               present(alert, animated: true, completion: nil)
           }
    
    func setValue() {
        
        guard let name = name else { return }
        nameLabel.text = name
        partLabel.text = "part: \(part ?? "")"
        guard let age = age else { return }
        ageLabel.text = "age: \(String(age))"
        guard let id = id else { return }
        
        print(id)
        
    }
    
    func setupUI() {
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
        view.addSubview(partLabel)
        view.addSubview(deleteButton)
        view.addSubview(editButton)
//        view.addSubview(tableView)  // tableView를 추가하여 화면에 표시
        
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            deleteButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                        
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                        
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            partLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 20),
            partLabel.bottomAnchor.constraint(equalTo: ageLabel.topAnchor, constant: -20),
            
            ageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            ageLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
//            tableView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 20),  // tableView 위치 조정
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension DetalilViewController {

    func deleteData(userID: Int) {
        //명세서 확인하기
        guard let url = URL(string: "\(baseURL)/user/\(userID)") else {
            print("🚨 URL error")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("🚨 Error: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                print("✅ Item deleted successfully")
                
                // 삭제 후 전체 데이터 갱신
                DispatchQueue.main.async {
                    self.getData()  // 삭제 후 전체 데이터 다시 불러오기
                }
            } else {
                print("❌ Failed to delete item")
            }
        }.resume()
    }
    
    func getData() {
        guard let url = URL(string: "\(baseURL)/user?part=all") else {
            print("🚨 URL error")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                do {
                    let users = try JSONDecoder().decode([MemberData].self, from: data)
                    self.members = users
                    DispatchQueue.main.async {
                        // self.tableView.reloadData()  // 전체 데이터 새로고침 시 필요
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }.resume()
    }
}
// UITableViewDataSource 및 UITableViewDelegate 구현
extension DetalilViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        let member = members[indexPath.row]
        cell.textLabel?.text = "\(member.name), \(member.age), \(member.part)"
        return cell
    }
}

    
    
//class ModalViewController: UIViewController {
//    var onSave: ((String, Int, String) -> Void)?  // 저장 후 호출될 콜백
//    
//    private let nameTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "이름을 입력하세요"
//        textField.borderStyle = .roundedRect
//        return textField
//    }()
//    
//    private let ageTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "나이를 입력하세요"
//        textField.borderStyle = .roundedRect
//        textField.keyboardType = .numberPad
//        return textField
//    }()
//    
//    private let partTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "파트를 입력하세요"
//        textField.borderStyle = .roundedRect
//        return textField
//    }()
//    
//    private let saveButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("저장", for: .normal)
//        button.addTarget(self, action: #selector(saveMember), for: .touchUpInside)
//        return button
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        
//        // UI 요소 추가 및 레이아웃 설정
//        view.addSubview(nameTextField)
//        view.addSubview(ageTextField)
//        view.addSubview(partTextField)
//        view.addSubview(saveButton)
//        
//        // AutoLayout 설정
//        nameTextField.translatesAutoresizingMaskIntoConstraints = false
//        ageTextField.translatesAutoresizingMaskIntoConstraints = false
//        partTextField.translatesAutoresizingMaskIntoConstraints = false
//        saveButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            nameTextField.widthAnchor.constraint(equalToConstant: 200),
//            
//            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
//            ageTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            ageTextField.widthAnchor.constraint(equalToConstant: 200),
//            
//            partTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20),
//            partTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            partTextField.widthAnchor.constraint(equalToConstant: 200),
//            
//            saveButton.topAnchor.constraint(equalTo: partTextField.bottomAnchor, constant: 40),
//            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//    }
//    
//    // 저장 버튼 클릭 시 호출
//    @objc private func saveMember() {
//        guard let name = nameTextField.text, !name.isEmpty,
//              let ageText = ageTextField.text, let age = Int(ageText),
//              let part = partTextField.text, !part.isEmpty else {
//            print("입력 오류 발생")
//            return
//        }
//        
//        onSave?(name, age, part)  // 콜백 호출하여 데이터 전달
//        dismiss(animated: true)
//    }
//}
