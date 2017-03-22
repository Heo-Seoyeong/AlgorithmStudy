//
//  RedBlackTreeModel.swift
//  AlgorithmStudy_Swift
//
//  Created by Seoyeong Heo on 2017. 3. 21..
//  Copyright © 2017년 Seoyeong Heo. All rights reserved.
//

import Foundation

class RedBlackTreeNode {
    
    var parent: RedBlackTreeNode?
    var right: RedBlackTreeNode?
    var left: RedBlackTreeNode?
    var data: Int?
    var color: String?
    
    static func setTreeNode(newdata: Int) -> RedBlackTreeNode{
        let treeNode = RedBlackTreeNode()
        treeNode.parent = nil
        treeNode.left = nil
        treeNode.right = nil
        treeNode.color = "BLACK"
        treeNode.data = newdata
        
        return treeNode
    }

    
}

class RedBlackTreeHead {
    var tree: RedBlackTreeNode?

    static func setTreeHead(tree : RedBlackTreeNode) -> RedBlackTreeHead{
        let treeHead = RedBlackTreeHead()
        treeHead.tree = tree
        
        return treeHead
    }

    
}
