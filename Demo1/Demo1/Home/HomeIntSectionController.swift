//
//  HomeIntSectionController.swift
//  Demo1
//
//  Created by 623971951 on 2019/1/2.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import IGListKit

class HomeIntSectionController: ListSectionController, ASSectionController{
    
    
    var object: HomeInt?
    
    
    // MARK: ASSectionController
    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        let text = "\(object?.data ?? -1)"
        return {
            let node = ASTextCellNode()
            node.text = text
            return node
        }
    }
    
    // MARK: IGListSectionController
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return ASIGListSectionControllerMethods.sizeForItem(at: index)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        return ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
    }
    override func didUpdate(to object: Any) {
        self.object = object as? HomeInt
    }
    
    override func didSelectItem(at index: Int) {
        print("\(index) -- \(object?.data ?? -1)")
    }
}
