//
//  UserModel.swift
//  gitHubUsersListTest
//
//  Created by Сергій Костюк on 8/9/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import Foundation

class UserModel: NSObject {
    let login: String!
    let profileLink: String!
    let avatarUrl: String!
    let folowersUrl: String!
    let userId: NSInteger!
    
    init(withDictionary dictionary: [String : Any]) {
        login = dictionary["login"] as! String
        profileLink = dictionary["html_url"] as! String
        avatarUrl = dictionary["avatar_url"] as! String
        folowersUrl = dictionary["followers_url"] as! String
        userId = dictionary["id"] as! NSInteger
        
        super.init()
    }
}


