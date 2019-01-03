//
//  HomeDiffable.swift
//  TextureChat
//
//  Created by CityFruit on 2019/1/2.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import IGListKit

class HomeString: NSObject, ListDiffable {
    var data: String?
    init(data: String?) {
        super.init()
        self.data = data
    }
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self.isEqual(object)
    }
}

class HomeInt: NSObject, ListDiffable {
    var data: Int?
    init(data: Int?) {
        super.init()
        self.data = data
    }
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self.isEqual(object)
    }
}
