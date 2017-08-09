//
//  UserTableViewCell.swift
//  gitHubUsersListTest
//
//  Created by Serhii Kostiuk on 8/9/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import UIKit

import SDWebImage

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var profileLinkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func fillCellWith(model:UserModel) {
        let url = URL.init(string: model.avatarUrl)
        avatarImageView.sd_setImage(with: url)
        avatarImageView.sd_setShowActivityIndicatorView(true)
        avatarImageView.sd_setIndicatorStyle(.gray)
        
        loginLabel.text = model.login
        
        profileLinkLabel.text = model.profileLink
    }
    
}
