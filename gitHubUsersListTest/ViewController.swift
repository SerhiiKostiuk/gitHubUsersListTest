//
//  ViewController.swift
//  gitHubUsersListTest
//
//  Created by Serhii Kostiuk on 8/8/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getGitHubUsers(urlString: String) {
        let url = URL.init(string: urlString)
        
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            DispatchQueue.main.async(execute: {
                
            })
        }
        task.resume()
    }

    func fillWith(usersData: NSData) {
        let json = JSONSerialization.jsonObject(with: <#T##Data#>, options: <#T##JSONSerialization.ReadingOptions#>)
    }
}




