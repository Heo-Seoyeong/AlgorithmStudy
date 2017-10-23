//
//  HeapController.swift
//  AlgorithmStudy_Swift
//
//  Created by Seoyeong Heo on 2017. 3. 29..
//  Copyright © 2017년 Seoyeong Heo. All rights reserved.
//

import Foundation

class HeapController {
    
    static let rbtInstance = HeapController()
    
    var num: Int = 0
    var dirxn: Bool?
    var first: HeapNode?
    var tmp: HeapNode?
    var current: HeapNode?
    
    
    //MARK: - Heap_Insert
    func get_a_node (x: Int, parent: HeapNode) -> HeapNode {
        let nd = HeapNode.setHeapNode(data: x)
        nd.parent = parent
        return nd
    }
    
    func get_a_queue (element: HeapNode) -> Queue {
        let q = Queue.setQueueNode(element: element)
        return q
    }
    
    func free_queue(q: QueueHead) {
        var q = q.tree
        var current_q: Queue?
        
        while (current_q != nil) {
            q = (current_q?.next)!
            current_q = Queue.cleanQueueNode()
            current_q = q
        }
    }
    
    func queue_put(n: HeapNode, last: QueueHead) {
        var last = last.tree
        if(n.left != nil){
            last?.next = get_a_queue(element: n.left!)
            last = last?.next!
        }
        
        if (n.right != nil){
            last?.next = get_a_queue(element: n.right!)
            last = last?.next!
        }
    }
    
    func heap_insert (root: HeapHead, x: Int) {
        
        if (root.tree != nil) {
            root.tree = get_a_node(x: x, parent: HeapNode.cleanHeadNode())
        } else {
            let q = get_a_queue(element: root.tree!)
            var current_q = q
            let head_last_q = QueueHead.setTreeHead(tree: q)
            var current_node: HeapNode?
            
            while (current_q.element != nil) {
                current_node = current_q.element
                
                if(current_node?.left == nil){
                    current_node?.left = get_a_node(x: x, parent: current_node!)
                    current_node = current_node?.left
                } else if (current_node?.right == nil){
                    current_node?.right = get_a_node(x: x, parent: current_node!)
                    current_node = current_node?.right
                } else {
                    queue_put(n: current_node!, last: head_last_q)
                    current_q = current_q.next!
                    continue
                }
                
                while (current_node?.parent != nil && (current_node?.parent?.data)! < (current_node?.data)!) {
                    let temp = current_node?.parent?.data
                    current_node?.parent?.data = current_node?.data
                    current_node?.data = temp
                    current_node = current_node?.parent
                }
                break
            }
            free_queue(q: head_last_q)
        }
        return
    }
    
    func heap_print (root: HeapHead) {
        if(root.tree != nil){
            let q = get_a_queue(element: root.tree!)
            var current_q = q
            let last_q = QueueHead.setTreeHead(tree: q)
            var test:HeapNode
            while (current_q.element != nil) {
                test = current_q.element!
                queue_put(n: test, last: last_q)
                print("\(test.data) ")
                current_q = current_q.next!
            }
            free_queue(q: last_q)
            print("")
        }
    }
    
}

