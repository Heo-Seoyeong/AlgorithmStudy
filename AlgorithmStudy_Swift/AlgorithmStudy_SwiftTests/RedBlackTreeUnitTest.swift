//
//  RedBlackTreeUnitTest.swift
//  AlgorithmStudy_Swift
//
//  Created by Seoyeong Heo on 2017. 3. 21..
//  Copyright © 2017년 Seoyeong Heo. All rights reserved.
//

import XCTest

@testable import AlgorithmStudy_Swift

class RedBlackTreeUnitTest: XCTestCase {
    var rbtcontroller: RedBlackTreeController?
    
    var tree: RedBlackTreeNode?
    var treeHead: RedBlackTreeHead?
    
    override func setUp() {
        super.setUp()
        
        tree = RedBlackTreeNode.setTreeNode(newdata: 4)
        treeHead = RedBlackTreeHead.setTreeHead(tree: tree!)
        
        rbtcontroller = RedBlackTreeController.rbtInstance
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        // insert Node
//        rbtcontroller?.RBT_Insert(treeHead:treeHead!, newdata:4)
        rbtcontroller?.RBT_Insert(treeHead:treeHead!, newdata:6)
        rbtcontroller?.RBT_Insert(treeHead:treeHead!, newdata:7)
        rbtcontroller?.RBT_Insert(treeHead:treeHead!, newdata:3)
        rbtcontroller?.RBT_Insert(treeHead:treeHead!, newdata:9)
        rbtcontroller?.RBT_Insert(treeHead:treeHead!, newdata:1)
        rbtcontroller?.RBT_Insert(treeHead:treeHead!, newdata:5)
        rbtcontroller?.RBT_Insert(treeHead:treeHead!, newdata:2)
        rbtcontroller?.RBT_Insert(treeHead:treeHead!, newdata:8)
        
//        rbtcontroller?.RBT_Display(root:tree!)
        
        // display Node
        rbtcontroller?.RBT_PrintTree(Node: (treeHead?.tree!)!, Depth: 0, BlackCount: 0)
        
        
        // search Node
        let minNode = rbtcontroller?.RBT_SearchMinNode(tree: (treeHead?.tree)!)
        let threeNode = rbtcontroller?.RBT_SearchNode(tree: (treeHead?.tree)!, tarket: 3)
        
        print("minNode : \(minNode!.data!)")
        print("threeNode : \(threeNode!.data)")

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
