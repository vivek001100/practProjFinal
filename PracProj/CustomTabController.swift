//
//  CustomTabController.swift
//  PracProj
//
//  Created by VM on 17/03/23.
//

import UIKit

class TabViewController : UITabBarController{
    var user : User? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeTab = (viewControllers?[0] as! UINavigationController).viewControllers[0] as! HomeViewController
        
        let profileTab = viewControllers?[1] as! ProfileViewController
//        print(viewControllers?[0])
            homeTab.name = user?.name ?? nil
            profileTab.email = user?.email ?? nil
        
        
//        navigationItem.setHidesBackButton(true, animated: true)
//        navigationItem.backBarButtonItem = UIBarButtonItem(image: backBtn, style: <#T##UIBarButtonItem.Style#>, target: <#T##Any?#>, action: <#T##Selector?#>)
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(back))
//           backBtn.isUserInteractionEnabled = true
//           backBtn.addGestureRecognizer(tapGestureRecognizer)
//        let tabBarCnt = UITabBarController()
//
//        let homeStoryBoard = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//
//        homeStoryBoard.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
//
//        let profileStoryBoard = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
//
//        profileStoryBoard.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
//
//        let cntArr = [homeStoryBoard,profileStoryBoard]
//        tabBarCnt.viewControllers = cntArr.map{ UINavigationController.init(rootViewController: $0)}
//            self.view.addSubview(tabBarCnt.view)
        
        
//        tabBarCnt.
    }
    

    
}
