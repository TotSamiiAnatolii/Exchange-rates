//
//  MainTabBarController.swift
//  exchange rates
//
//  Created by APPLE on 07.03.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    let mainVC = MainViewController()
    let converterVC = ConverterViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    
        let mainVCIcon = UITabBarItem()
        mainVCIcon.image = UIImage(named: "exchange-rate")
        mainVC.tabBarItem = mainVCIcon
    
        let converterVCIcon = UITabBarItem()
        converterVCIcon.image = UIImage(named: "exchange-rate1")
        converterVC.tabBarItem = converterVCIcon
        
        let controller = [mainVC, converterVC]
        self.viewControllers = controller
    }
    
}
