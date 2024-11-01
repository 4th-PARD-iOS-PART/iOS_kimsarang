import UIKit


class DetalilViewController: UIViewController {
    //데이터를 저장할 옵셔널 변수
    var name: String?
    var age: Int?
    var part: String?
    //UI 초기화
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize:15 , weight: .bold)
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize:15 , weight: .bold)
        return label
    }()
    
    let partLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize:15 , weight: .bold)
        return label
    }()
    
    let deleteButton : UIButton = {
            let button = UIButton()
            button.setTitle("Delete", for: .normal)
            button.tintColor = .red
            button.setTitleColor(.red, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
    let editButton : UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setValue()
        
    }
    
    func setValue(){
        //변수 name 설정 후 이름 표시
        nameLabel.text = name
        guard let name = name else { return }
        partLabel.text = "part: \(part)"
        guard let age = age else { return }
        ageLabel.text = "age: \(String(age))"
        
    }
    //제약 조건
    func setupUI(){
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
        view.addSubview(partLabel)
        view.addSubview(deleteButton)
        view.addSubview(editButton)
        
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
            
        ])
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
