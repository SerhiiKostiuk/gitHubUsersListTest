//
//  ViewController.swift
//  gitHubUsersListTest
//
//  Created by Serhii Kostiuk on 8/8/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ApiManagerDelegate {
    fileprivate let apiManager = ApiManager()
    var users = [UserModel]()

    @IBOutlet weak var usersTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiManager.delegate = self
        apiManager.getGitHubUsers(urlString: "https://api.github.com/users?page=1&per_page=120")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func getUserModels(array: [UserModel]!) {
        print(array)
    }
}




