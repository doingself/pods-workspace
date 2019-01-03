//
//  TabIndexCollectionViewCell.swift
//  Demo1
//
//  Created by 623971951 on 2019/1/2.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class TabIndexCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        lab.frame = bounds
        
        self.contentView.addSubview(lab)
        self.backgroundColor = UIColor.lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let lab = UILabel()
    
}
