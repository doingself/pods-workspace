//
//  AsyncDisplayKitDemoTableViewCell.swift
//  Demo1
//
//  Created by 623971951 on 2019/1/2.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import AsyncDisplayKit

extension NSAttributedString {
    
    static func attributedString(string: String?, fontSize size: CGFloat, fontColor color: UIColor?) -> NSAttributedString? {
        guard let string = string else { return nil }
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: color ?? UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: size)]
        
        let attributedString = NSMutableAttributedString(string: string, attributes: attributes)
        
        return attributedString
    }
    
}

class AsyncDisplayKitDemoTableViewCell: ASCellNode {
    
    // MARK: - Variables
    
    private let avatarImageNode: ASNetworkImageNode
    private let titleNode: ASTextNode
    private let subtitleNode: ASTextNode
    private let timeNode: ASTextNode
    private let unReadNode: ASTextNode
    private let noticeImageNode: ASImageNode
    private let disclosureIndicatorImageNode: ASImageNode
    
    // MARK: - Object life cycle
    
    init(data: Any?) {
        
        avatarImageNode = ASNetworkImageNode()
        titleNode = ASTextNode()
        subtitleNode = ASTextNode()
        timeNode = ASTextNode()
        unReadNode = ASTextNode()
        noticeImageNode = ASImageNode()
        disclosureIndicatorImageNode = ASImageNode()
        
        super.init()
        
        self.addSubnode(avatarImageNode)
        self.addSubnode(titleNode)
        self.addSubnode(subtitleNode)
        self.addSubnode(timeNode)
        self.addSubnode(unReadNode)
        self.addSubnode(noticeImageNode)
        self.addSubnode(disclosureIndicatorImageNode)
        
        self.setupNodes()
        
    }
    
    // MARK: - Setup nodes
    
    private func setupNodes() {
        
        self.avatarImageNode.url = URL(string: "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjI3Mjk0fQ")
        self.avatarImageNode.style.preferredSize = CGSize(width: 50, height: 50)
        
        self.titleNode.attributedText = NSAttributedString.attributedString(string: "title", fontSize: 14, fontColor: nil)
        self.titleNode.maximumNumberOfLines = 1
        self.titleNode.truncationMode = .byTruncatingMiddle
        
        
        self.subtitleNode.attributedText = NSAttributedString.attributedString(string: "subtitle", fontSize: 14, fontColor: nil)
        self.subtitleNode.maximumNumberOfLines = 2
        self.subtitleNode.truncationMode = .byTruncatingTail
        
        
        self.timeNode.attributedText = NSAttributedString.attributedString(string: "昨天", fontSize: 14, fontColor: nil)
        
        self.unReadNode.attributedText = NSAttributedString.attributedString(string: "123", fontSize: 14, fontColor: nil)
        
        noticeImageNode.image = UIImage(named: "tempimg")
        
        disclosureIndicatorImageNode.image = UIImage(named: "tempimg")
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        // img title time   >
        //     desc  unread
        
        let contentSpec = ASStackLayoutSpec(direction: .vertical, spacing: 4.0, justifyContent: .start, alignItems: .stretch, children: [self.titleNode, self.subtitleNode])
        contentSpec.style.flexGrow = 1
        
        let unreadSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 2.0, justifyContent: .start, alignItems: .center, children: [self.noticeImageNode, self.unReadNode])
        
        let timeSpec = ASStackLayoutSpec(direction: .vertical, spacing: 4.0, justifyContent: .start, alignItems: .stretch, children: [self.timeNode, unreadSpec])
        
        let finalSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 10.0, justifyContent: .start, alignItems: .start, children: [
            self.avatarImageNode,
            contentSpec,
            timeSpec,
            self.disclosureIndicatorImageNode ])
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0), child: finalSpec)
    }
}
