//
//  MemberAddViewController.swift
//  6th_hw_Kimsarang
//
//  Created by 김사랑 on 10/31/24.
//

import UIKit
//이름 나이 파트 입력해 멤버 추가
class MemberAddViewController : UIViewController {
    
    weak var viewController: ViewController?
    
    var viewcontroller: UIViewController?
    
    var nameField: UITextField = {
        let nameField = UITextField()
        nameField.textColor = .black
        nameField.placeholder = "이름을 입력해주세요"
        nameField.font = .systemFont(ofSize: 15)
        nameField.backgroundColor = .white
        nameField.translatesAutoresizingMaskIntoConstraints = false
        return nameField
    }()
    var partField: UITextField = {
        let partField = UITextField()
        partField.textColor = .black
        partField.placeholder = "부서를 입력해주세요"
        partField.font = .systemFont(ofSize: 15)
        partField.backgroundColor = .white
        partField.translatesAutoresizingMaskIntoConstraints = false
        return partField
    }()
    
    var ageField: UITextField = {
        let ageField = UITextField()
        ageField.textColor = .black
        ageField.placeholder = "나이를 입력해주세요"
        ageField.font = .systemFont(ofSize: 15)
        ageField.backgroundColor = .white
        ageField.translatesAutoresizingMaskIntoConstraints = false
        return ageField
        
    }()
    var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.layer.cornerRadius = 10
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //액션 버튼
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        setupUI()
        
    }
    //액션 버튼 데이터 생성MemberData 생성!
    //post 요청 post(mem : user, vc:)
    
    @objc func addButtonTapped() {
        
        guard let name = nameField.text,
              let part = partField.text,
              let ageStr = ageField.text,
              let age = Int(ageStr)
                
        else { return }
        
        let user = MemberData(name: name, part: part, age: age)
        guard let viewController = viewController else {return}
        postData(mem : user , vc: viewController)
        dismiss(animated: true)
        
    }
    
    func setupUI() {
        view.addSubview(nameField)
        view.addSubview(partField)
        view.addSubview(ageField)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameField.widthAnchor.constraint(equalToConstant: 200),
            
            ageField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            ageField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageField.widthAnchor.constraint(equalToConstant: 200),
            
            partField.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 20),
            partField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            partField.widthAnchor.constraint(equalToConstant: 200),
            
            addButton.topAnchor.constraint(equalTo: partField.bottomAnchor, constant: 400),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}
        
        
        //데이터 전송 메서드  서버로 전송항 URL을 만듬
        //HTTP -> POST
extension MemberAddViewController {
    func postData(mem : MemberData ,vc : ViewController){
        guard let url = URL(string:"http://ec2-13-209-3-68.ap-northeast-2.compute.amazonaws.com:8080/user")
        else {
            print("🚨Not Invailed URL")
            return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //Content-Type 헤더를 application/json로 바꿈
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(mem)
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("🚨 Error: \(error.localizedDescription)")
                    return
                }
                
                if let data = data {
                    print("✅ Response: \(String(decoding: data, as: Unicode.UTF8.self))")
                    DispatchQueue.main.async {
                        vc.getData()
                        vc.tableView.reloadData()
                    }
                }
            }
            task.resume()
        } catch {
            print("🚨 JSON Encoding Error: \(error.localizedDescription)")
        }
    }
}
