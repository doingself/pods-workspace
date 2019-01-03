//
//  TabIndexCollectionReusableView.swift
//  Demo1
//
//  Created by 623971951 on 2019/1/2.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class TabIndexCollectionReusableView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        lab.frame = bounds
        self.addSubview(lab)
        self.backgroundColor = UIColor.lightText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let lab = UILabel()

}
