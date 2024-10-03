//
//  CollectionViewTableViewCell.swift
//  3st_hw_KimSaRang
//
//  Created by 김사랑 on 9/25/24.
//

import UIKit
///가로 스크롤
class CollectionViewTableViewCell: UITableViewCell {
    
    var numberInSection : Int?
    
    
    static let identifier = "CollectionViewTableViewCell"
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func getSectionNumber(num : Int) {
        numberInSection = num
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // 이미지를 넣는 부분
        let imageView = UIImageView(frame: cell.contentView.bounds)
        
        //추가
        let target = MockData.modeling[numberInSection ?? 0][indexPath.item]
        print(numberInSection)
        print(indexPath.item)
//       let image = UIImage(named: "\(target.image)")
//       cell.imageView.image = image
        
        imageView.image = UIImage(named: "\(target.image)")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
//        imageView.tag =  100
        
        // 이미지 뷰를 셀의 content view에 추가
        cell.contentView.addSubview(imageView)
//        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockData.modeling[section].count
    }
}



