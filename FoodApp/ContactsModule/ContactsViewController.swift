//
//  ContactsViewController.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import UIKit

class ContactsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let menu = UITabBarItem(title: "Контакты", image: UIImage(named: "contacts"), selectedImage: nil)
        self.tabBarItem = menu
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
