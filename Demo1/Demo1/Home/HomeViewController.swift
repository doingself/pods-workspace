//
//  HomeViewController.swift
//  TextureChat
//
//  Created by CityFruit on 2018/12/25.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import IGListKit
import AsyncDisplayKit
import MYTableViewIndex

public extension ListCollectionContext {
    func nodeForItem(at index: Int, sectionController: ListSectionController) -> ASCellNode? {
        return (cellForItem(at: index, sectionController: sectionController) as? _ASCollectionViewCell)?.node
    }
}


class HomeViewController: ASViewController<ASCollectionNode> {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        let node = ASCollectionNode(frame: CGRect.zero, collectionViewLayout: layout)
        super.init(node: node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private var tableViewIndexController: TableViewIndexController!
    
    private lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    let words: [ListDiffable] = [
        HomeInt(data: 11),
        HomeInt(data: 12),
        HomeString(data: "string 11"),
        HomeString(data: "string 12"),
        HomeString(data: "string 13"),
        HomeInt(data: 13),
        HomeInt(data: 14),
        HomeInt(data: 15),
        HomeInt(data: 20),
        HomeString(data: "string 21"),
        HomeString(data: "string 22"),
        HomeString(data: "string 23"),
        HomeInt(data: 21),
        HomeInt(data: 22),
        HomeInt(data: 25),
        HomeString(data: "string 14"),
        HomeString(data: "string 15"),
        HomeString(data: "string 16"),
        HomeInt(data: 16),
        HomeInt(data: 17),
        HomeString(data: "string 20"),
        HomeString(data: "string 24"),
        HomeInt(data: 18),
        HomeInt(data: 19),
        HomeString(data: "string 17"),
        HomeString(data: "string 18"),
        HomeInt(data: 23),
        HomeInt(data: 24),
        HomeString(data: "string 19"),
        HomeString(data: "string 25")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "IGList+Texture"
        
        adapter.setASDKCollectionNode(node)
        adapter.dataSource = self
        
        // 配置自定义索引
        tableViewIndexController = TableViewIndexController(scrollView: adapter.collectionView!)
        tableViewIndexController.tableViewIndex.delegate = self
        tableViewIndexController.tableViewIndex.dataSource = self
        tableViewIndexController.tableViewIndex.indexOffset = UIOffset(horizontal: -4, vertical: 0)
        
        tableViewIndexController.tableViewIndex.removeFromSuperview()
        self.node.view.addSubview(tableViewIndexController.tableViewIndex)
        self.node.view.bringSubviewToFront(tableViewIndexController.tableViewIndex)
        tableViewIndexController.tableViewIndex.setNeedsLayout()
        tableViewIndexController.tableViewIndex.layoutIfNeeded()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableViewIndexController.tableViewIndex.reloadData()
        self.tableViewIndexController.setHidden(false, animated: true)
    }
}

extension HomeViewController: ListAdapterDataSource{
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return words
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is HomeString {
            return HomeStrSectionController()
        }else{
            return HomeIntSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

extension HomeViewController: TableViewIndexDelegate{
    func tableViewIndex(_ tableViewIndex: TableViewIndex, didSelect item: UIView, at index: Int) -> Bool {
        let selectObject = words[index]
        adapter.scroll(to: selectObject, supplementaryKinds: [UICollectionView.elementKindSectionHeader], scrollDirection: UICollectionView.ScrollDirection.vertical, scrollPosition: UICollectionView.ScrollPosition.top, animated: true)
        return true
    }
}
extension HomeViewController: TableViewIndexDataSource{
    func indexItems(for tableViewIndex: TableViewIndex) -> [UIView] {
        let result = ["a","c","e","h","k"]
        return result.map{ StringItem(text: $0) }
    }
}
