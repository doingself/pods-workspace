//
//  TabIndexViewController.swift
//  Demo1
//
//  Created by 623971951 on 2019/1/2.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import MYTableViewIndex

class TabIndexViewController: UIViewController {

    private var collectView: UICollectionView!
    private var tableViewIndexController: TableViewIndexController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "MYTableViewIndex"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 200, height: 100)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collectView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectView.delegate = self
        collectView.dataSource = self
        collectView.register(TabIndexCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectView.register(TabIndexCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "head")
        collectView.register(TabIndexCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "foot")
        
        self.view.addSubview(collectView)
        collectView.backgroundColor = UIColor.white
        
        tableViewIndexController = TableViewIndexController(scrollView: collectView)
        tableViewIndexController.tableViewIndex.delegate = self
        tableViewIndexController.tableViewIndex.dataSource = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableViewIndexController.tableViewIndex.reloadData()
        self.tableViewIndexController.setHidden(false, animated: true)
    }
}

extension TabIndexViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TabIndexCollectionViewCell
        cell.lab.text = "cell \(indexPath.section) \(indexPath.item)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        var id = "head"
        if kind == UICollectionView.elementKindSectionFooter{
            id = "foot"
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: id, for: indexPath) as! TabIndexCollectionReusableView
        header.lab.text = "\(kind) \(indexPath.section)"
        return header
    }
}
extension TabIndexViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 10, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 10, height: 50)
    }
}

extension TabIndexViewController: TableViewIndexDelegate{
    func tableViewIndex(_ tableViewIndex: TableViewIndex, didSelect item: UIView, at index: Int) -> Bool {
        
        let indexPath = IndexPath(item: 0, section: index)
        collectView.scrollToItem(at: indexPath, at: .top, animated: true)
        
        return true
    }
}
extension TabIndexViewController: TableViewIndexDataSource{
    func indexItems(for tableViewIndex: TableViewIndex) -> [UIView] {
        let result = ["1","2","3","4","5"]
        return result.map{ StringItem(text: $0) }
    }
}

