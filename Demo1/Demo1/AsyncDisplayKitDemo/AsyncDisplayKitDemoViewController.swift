//
//  AsyncDisplayKitDemoViewController.swift
//  Demo1
//
//  Created by 623971951 on 2019/1/2.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class AsyncDisplayKitDemoViewController: ASViewController<ASTableNode> {
    
    init() {
        super.init(node: ASTableNode())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Texture(AsyncDisplayKit)"
        
        node.allowsSelection = false
        node.dataSource = self
        node.delegate = self
        node.leadingScreensForBatching = 2.5
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
}

extension AsyncDisplayKitDemoViewController: ASTableDataSource{
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 3
    }
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        return AsyncDisplayKitDemoTableViewCell(data: indexPath)
    }
}
extension AsyncDisplayKitDemoViewController: ASTableDelegate{
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        tableNode.deselectRow(at: indexPath, animated: true)
        print("haha \(indexPath.row)")
    }
}
