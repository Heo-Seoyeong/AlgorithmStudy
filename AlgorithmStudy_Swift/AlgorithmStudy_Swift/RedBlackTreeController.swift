            //
//  RedBlackTreeController.swift
//  AlgorithmStudy_Swift
//
//  Created by Seoyeong Heo on 2017. 3. 21..
//  Copyright © 2017년 Seoyeong Heo. All rights reserved.
//

import Foundation

class RedBlackTreeController {
    
    static let rbtInstance = RedBlackTreeController()
    
//MARK: - RBT_Insert
    func RBT_Insert (treeHead: RedBlackTreeHead,newdata: Int) {
    
        let newNode = RedBlackTreeNode.setTreeNode(newdata: newdata)
//        print("test \(tree.data)")
//        print("test \(newNode.data)")
//        print(" ")
        RBT_InsertNodeHelper(tree: treeHead.tree!, newNode: newNode)
        
        newNode.color = "RED"
        newNode.left = nil
        newNode.right = nil
        
//        print("test \(newNode)")
//        print(" ")
        
        RBT_RebuildAfterInsert(Root: treeHead, X: newNode)
        
    }
    
    func RBT_InsertNodeHelper (tree: RedBlackTreeNode,newNode:RedBlackTreeNode) {
        if(tree.data == -1){
            tree.color = newNode.color
            tree.data = newNode.data
            tree.right = newNode.right
            tree.left = newNode.left
            tree.parent = newNode.parent
        }
        
//        print("tree.data \(tree.data)")
//        print("newNode.data \(newNode.data)")
        if(tree.data! < newNode.data!){
//            print("tree.right \(tree.right)")
            if(tree.right == nil){
                tree.right = newNode
                newNode.parent = tree
            }
            else{
                RBT_InsertNodeHelper(tree: tree.right!, newNode: newNode)
            }
        } else if(tree.data! > newNode.data!) {
            if(tree.left == nil){
                tree.left = newNode
                newNode.parent = tree
            } else{
                RBT_InsertNodeHelper(tree: tree.left!, newNode: newNode)
            }
            
        }
        
        
    }
    
    func RBT_RebuildAfterInsert (Root: RedBlackTreeHead, X:RedBlackTreeNode) {
        var X = X
        while (X.data != Root.tree?.data && X.parent?.color == "RED") {
            if (X.parent?.data == X.parent?.parent?.left?.data){
                let Uncle = X.parent?.parent?.right
                if (Uncle?.color == "RED"){
                    X.parent?.color = "BLACK"
                    Uncle?.color = "BLACK"
                    X.parent?.parent?.color = "RED"
                    X = (X.parent?.parent)!
                } else {
                    if (X.data == X.parent?.right?.data){
                        X = X.parent!
                        RBT_Rotateleft(Root: Root, parent: X)
                    }
                    X.parent?.color = "BLACK"
                    X.parent?.parent?.color = "RED"
                    
                    RBT_Rotateright(Root: Root, parent: (X.parent?.parent)!)
                }
            } else {
                let Uncle = X.parent?.parent?.left
                if ( Uncle?.color == "RED" ) {
                    X.parent?.color = "BLACK"
                    Uncle?.color = "BLACK"
                    X.parent?.parent?.color = "RED"
                    
                    X = (X.parent?.parent!)!
                } else {
                    if ( X.data == X.parent?.left?.data )
                    {
                        X = X.parent!
                        RBT_Rotateright( Root: Root, parent: X )
                    }
                    
                    X.parent?.color         = "BLACK"
                    X.parent?.parent?.color = "RED"
                    RBT_Rotateleft( Root: Root, parent: (X.parent?.parent!)! )
                }
            }
            
//            print("displayNode : \(X.data)")
        }
        
        Root.tree?.color = "BLACK"
        
        
    }
    
    func RBT_Rotateleft(Root: RedBlackTreeHead, parent: RedBlackTreeNode) {
        let rightChild = parent.right
        var Root = Root
        
        parent.right = rightChild?.left
        
        if ( rightChild?.left != nil ){
            rightChild?.left?.parent = parent
        }
        rightChild?.parent = parent.parent
        
        if ( parent.parent == nil ){
            Root.tree = rightChild!
        }else {
            if ( parent.data == parent.parent?.left?.data ){
                parent.parent?.left = rightChild
            }else{
                parent.parent?.right = rightChild
            }
        }
        
        rightChild?.left   = parent
        parent.parent = rightChild
        
        
    }

    func RBT_Rotateright(Root: RedBlackTreeHead, parent: RedBlackTreeNode) {
        let leftChild =  parent.left
        var Root = Root
        
        parent.left = leftChild?.right
        
        if ( leftChild?.right != nil ){
            leftChild?.right?.parent = parent
        }
        leftChild?.parent = parent.parent
        
        if ( parent.parent == nil ){
            Root.tree = leftChild!
        } else {
            if ( parent.data == parent.parent?.left?.data ){
            parent.parent?.left = leftChild
            } else {
            parent.parent?.right = leftChild
            }
        }
        
        leftChild?.right  = parent
        parent.parent = leftChild
    }
    
    func RBT_Display(root: RedBlackTreeNode?) {
        if let n = root {
            RBT_Display(root: n.left)
            print("\(n.data!)")
            RBT_Display(root: n.right)
            print("")
        }
    }
    
    
//MARK: - RBT_Destroy
    func RBT_DestroyNode(removeNode: RedBlackTreeNode) {
        removeNode.parent = nil
        removeNode.data = nil
        removeNode.color = nil
    }
    
    func RBT_DestroyTree(tree: RedBlackTreeNode) {
        if ( tree.right != nil ){
            RBT_DestroyTree(tree: tree.right!)
        }
        
        if ( tree.left != nil ){
            RBT_DestroyTree(tree: tree.left!)
        }
        
        tree.left = nil
        tree.right = nil
        
        RBT_DestroyNode(removeNode: tree)

    }

    
//MARK: - RBT_Search
    func RBT_SearchNode(tree: RedBlackTreeNode, tarket: Int) -> RedBlackTreeNode {
        if ( tree.data == nil ){
            return tree
        }
        
        if ( tree.data! > tarket ){
            return RBT_SearchNode ( tree: tree.left!, tarket: tarket)
        } else if ( tree.data! < tarket ){
            return RBT_SearchNode ( tree: tree.right!,  tarket: tarket)
        } else{
            return tree
        }
    }
    
    func RBT_SearchMinNode(tree: RedBlackTreeNode) -> RedBlackTreeNode {
        if ( tree.data == nil ){
            return tree
        }
        if ( tree.left == nil ){
            return tree
        }else{
            return RBT_SearchMinNode( tree: tree.left! )
        }
    }

    
    
//MARK: - RBT_Print
    func RBT_PrintTree(Node: RedBlackTreeNode, Depth: Int, BlackCount: Int) {
        var BlackCount = BlackCount
        var i = 0
        var c = "X"
        var v = -1
        var cnt: String?
        var br = ""
        
        if ( Node.data == nil){
            return
        }
        
        if ( Node.color == "BLACK" ){
            BlackCount += 1
        }
        
        if ( Node.parent != nil )
        {
            v = (Node.parent?.data)!
            
            if ( Node.parent?.left?.data == Node.data ){
                c = "L"
            } else {
                c = "R"
            }
        }

        
        
        if ( Node.left == nil && Node.right == nil ){
            cnt = "--------- \(BlackCount)"
        } else{
            cnt = ""
        }
        
        while i < Depth {
            br = br + "  "
            i += 1
        }
        
        
        print("\(br) \(Node.data!) \(Node.color!) [\(c),\(v)] \(cnt!)")
        if (Node.right != nil){
            RBT_PrintTree(Node: Node.right!, Depth: Depth+1, BlackCount: BlackCount)
        }
        if (Node.left != nil){
            RBT_PrintTree(Node: Node.left!, Depth: Depth+1, BlackCount: BlackCount)
        }
        
    }
    
}
