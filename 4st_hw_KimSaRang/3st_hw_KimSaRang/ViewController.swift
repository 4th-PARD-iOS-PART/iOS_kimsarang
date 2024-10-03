//
//  ViewController.swift
//  3st_hw_KimSaRang
//
//  Created by 김사랑 on 9/24/24.
//



import UIKit


///테이블 바

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setTabBar()
    }
    
    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: FoViewController())
        let vc5 = UINavigationController(rootViewController: FiveViewController())
        
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]

        
        guard let tabBarItems = self.tabBar.items else {return}
        
        tabBarItems[0].image = UIImage(systemName: "house.fill")
        tabBarItems[1].image = UIImage(systemName: "magnifyingglass")
        tabBarItems[2].image = UIImage(systemName: "play.rectangle.on.rectangle")
        tabBarItems[3].image = UIImage(systemName: "arrow.down.to.line")
        tabBarItems[4].image = UIImage(systemName: "line.3.horizontal")
        
        tabBarItems[0].title = "Home"
        tabBarItems[1].title = "Search"
        tabBarItems[2].title = "Coming Soon"
        tabBarItems[3].title = "Downloads"
        tabBarItems[4].title = "More"
        
    }


}
