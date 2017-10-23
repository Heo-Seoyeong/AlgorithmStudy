//
//  HeapModel.swift
//  AlgorithmStudy_Swift
//
//  Created by Seoyeong Heo on 2017. 3. 29..
//  Copyright © 2017년 Seoyeong Heo. All rights reserved.
//

import Foundation

class HeapNode {
    
    var left: HeapNode?
    var right: HeapNode?
    var parent: HeapNode?
    var data: Int?
    
    static func setHeapNode(data: Int) -> HeapNode{
        let heap = HeapNode()
        heap.left = nil
        heap.right = nil
        heap.parent = nil
        heap.data = data
        
        return heap
    }
    
    static func cleanHeadNode() -> HeapNode{
        let heap = HeapNode()
        heap.left = nil
        heap.right = nil
        heap.parent = nil
        heap.data = nil
        
        return heap
    }

}

class HeapHead {
    var tree: HeapNode?
    
    static func setTreeHead(tree : HeapNode) -> HeapHead{
        let heapHead = HeapHead()
        heapHead.tree = tree
        return heapHead
    }
}


class Queue {
    var next: Queue?
    var element: HeapNode?
    
    static func setQueueNode(element: HeapNode) -> Queue{
        let queue = Queue()
        queue.next = nil
        queue.element = element
        
        return queue
    }
    
    static func cleanQueueNode() -> Queue{
        let queue = Queue()
        queue.next = nil
        queue.element = nil
        
        return queue
    }
}

class QueueHead {
    var tree: Queue?
    
    static func setTreeHead(tree : Queue) -> QueueHead{
        let queueHead = QueueHead()
        queueHead.tree = tree
        return queueHead
    }
}
