import UIKit

class FirstViewController: UIViewController {
    ///글자 나오는 곳
    let sectionTitles: [String] = ["Popular on Netflix","Trending Now", "Top 10 in Negeria Today", "My List", "African Movies", "Nollywood Movies & TV" ]
    
    private let FirstViewTable: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    ///메인 사진
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(FirstViewTable)
        
        FirstViewTable.delegate = self
        FirstViewTable.dataSource = self
                     
        navigationController?.setNavigationBarHidden(true, animated: false)

        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 550))
        FirstViewTable.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        FirstViewTable.frame = view.bounds
       
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
      ///이미지 셀을 만들기 위해
        switch indexPath.section {
        case 0:
            cell.getSectionNumber(num: 0)
        case 1:
            cell.getSectionNumber(num: 1)
        case 2:
            cell.getSectionNumber(num: 2)
        case 3:
            cell.getSectionNumber(num: 3)
        case 4:
            cell.getSectionNumber(num: 4)
        case 5:
            cell.getSectionNumber(num: 5)
        default:
            cell.getSectionNumber(num: 0)
        }
        
        return cell
    }
    
    func tableView(_ tabelView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{ return 200}
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight:.semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return sectionTitles[section]
    }
}
