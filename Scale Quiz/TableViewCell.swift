//
//  TableViewCell.swift
//  Scale Quiz
//
//  Created by Bobby Bearcat on 11/9/15.
//  Copyright © 2015 Darion Higgins. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var scaleName = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.scaleName.frame = CGRectMake(10, 0, self.frame.width*0.8, 40);
        contentView.addSubview(self.scaleName)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Configure the view for the selected state

    
    
    
    
}
