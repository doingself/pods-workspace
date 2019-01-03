//
//  HomeStrSectionController
//  TextureChat
//
//  Created by CityFruit on 2019/1/2.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import IGListKit


class HomeStrSectionController: ListSectionController, ASSectionController{
    
    
    var object: HomeString?

    
    // MARK: ASSectionController
    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        let text = object?.data ?? ""
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
        self.object = object as? HomeString
    }
    
    override func didSelectItem(at index: Int) {
        print("\(index) -- \(object?.data ?? "")")
    }
}
