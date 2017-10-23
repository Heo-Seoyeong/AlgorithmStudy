 //
//  HeapUnitTest.swift
//  Alforithm_IOS
//
//  Created by Seoyeong Heo on 2017. 4. 5..
//  Copyright © 2017년 Seoyeong Heo. All rights reserved.
//

import XCTest
@testable import Alforithm_IOS

class HeapUnitTest: XCTestCase {
    var heapcontroller: HeapController?
    
    var verifier:Array<Int>?
    var root:HeapHead?
    var data = 0
    
    
    override func setUp() {
        super.setUp()
        
        root = HeapHead.init()
        verifier = [3, 7, 4, 9, 5, 2, 10, 6, 1, 8]
        
        heapcontroller = HeapController.heapInstance
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        for index in 0...9{
            print("verifier \((verifier?[index])!)")
            heapcontroller?.heap_insert(root: root!, x: (verifier?[index])!)
        }
        
        
        heapcontroller?.heap_print(root: root!)
        
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
