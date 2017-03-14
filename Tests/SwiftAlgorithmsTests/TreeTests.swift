import XCTest
@testable import SwiftAlgorithms

class TreeTests: XCTestCase {
    
    func testInit() {
        let value = 1
        let tree = Tree<Int>(value: value)
        
        XCTAssertEqual(tree.value, value)
        XCTAssertEqual(tree.children.count, 0)
    }
    
    func testInsert() {
        let value = 1
        let root = Tree<Int>(value: value)
        
        let value2 = 2
        let child = Tree<Int>(value: value2)
        root.insert(child)
        
        let rootChildCount = root.children.count
        XCTAssertEqual(rootChildCount, 1)

        let rootChild1 = root.children[0]
        XCTAssert(rootChild1 === child)
    }
    
    func testRemove() {
        let value = 1
        let root = Tree<Int>(value: value)
        
        let value2 = 2
        let child = Tree<Int>(value: value2)
        root.insert(child)
        
        let value3 = 0
        let grandchild = Tree<Int>(value: value3)
        child.insert(grandchild)
        
        XCTAssert(root.widthFirstSearch(value: 0))
        root.remove(descendant: grandchild)
        XCTAssertFalse(root.widthFirstSearch(value: 0))
        
        XCTAssert(root.widthFirstSearch(value: 2))
        root.remove(descendant: child)
        XCTAssertFalse(root.widthFirstSearch(value: 2))
    }
    
    func testDepthFirstForEachUntil() {
        let tree = TreeTestData.tree
        
        var iteratedValues = [Int]()
        func appendValues(value:Int, depth: UInt) {
            iteratedValues.append(value)
        }
        tree.depthFirstForEach(appendValues)
        XCTAssert(iteratedValues == [TreeTestData.value1, TreeTestData.value2, TreeTestData.value3, TreeTestData.value4, TreeTestData.value5])
        
        iteratedValues = [Int]()
        tree.depthFirstForEach(appendValues, until: { value, depth in
            return true
        })
        XCTAssert(iteratedValues == [])
        
        iteratedValues = [Int]()
        tree.depthFirstForEach(appendValues, until: { value, depth in
            return value == TreeTestData.value3
        })
        XCTAssert(iteratedValues == [TreeTestData.value1, TreeTestData.value2])
    }
    
    func testWidthFirstForEachUntil() {
        let tree = TreeTestData.tree
        
        var iteratedValues = [Int]()
        func appendValues(value:Int, depth: UInt) {
            iteratedValues.append(value)
        }
        tree.widthFirstForEach(appendValues)
        XCTAssert(iteratedValues == [TreeTestData.value1, TreeTestData.value2, TreeTestData.value4, TreeTestData.value5, TreeTestData.value3])
        
        iteratedValues = [Int]()
        tree.widthFirstForEach(appendValues, until: { value in
            return true
        })
        XCTAssert(iteratedValues == [])
        
        iteratedValues = [Int]()
        tree.widthFirstForEach(appendValues, until: { value, depth in
            return value == TreeTestData.value3
        })
        XCTAssert(iteratedValues == [TreeTestData.value1, TreeTestData.value2, TreeTestData.value4, TreeTestData.value5])
    }
    
    func testDepthFirstSearch() {
        let tree = TreeTestData.tree
        
        let foundRootValue = tree.depthFirstSearch(value:TreeTestData.value1)
        XCTAssertEqual(foundRootValue, true)
        
        let foundChildValue = tree.depthFirstSearch(value:TreeTestData.value1)
        XCTAssertEqual(foundChildValue, true)
        
        let notFoundChildValue = tree.depthFirstSearch(value:0)
        XCTAssertEqual(notFoundChildValue, false)
    }
    
    func testWidthFirstSearch() {
        let tree = TreeTestData.tree
        
        let foundRootValue = tree.widthFirstSearch(value:TreeTestData.value1)
        XCTAssertEqual(foundRootValue, true)
        
        let foundChildValue = tree.widthFirstSearch(value:TreeTestData.value2)
        XCTAssertEqual(foundChildValue, true)
        
        let notFoundChildValue = tree.widthFirstSearch(value:0)
        XCTAssertEqual(notFoundChildValue, false)
    }
    
    func testOrderedComparison() {
        let tree = TreeTestData.tree
        
        XCTAssertTrue(tree.orderedComparison(to:tree))
        
        XCTAssertFalse(tree.orderedComparison(to:tree.children.first!))
    }
    
    func testMap() {
        let tree = TreeTestData.tree
        let copy = tree.map()
        
        XCTAssert(tree !== copy)
        XCTAssert(tree.orderedComparison(to:copy))
        
        func transform(value: Int) -> Int {
            return value * 2
        }
        let transformedRoot = tree.map(transform)
        XCTAssert(transformedRoot.value == TreeTestData.value1 * 2)
        XCTAssert(transformedRoot.children[0].value == TreeTestData.value2 * 2)
    }
    
    class TreeTestData {
        static let tree: Tree<Int> = testTree()
        static let value1 = 1
        static let value2 = 2
        static let value3 = 3
        static let value4 = 4
        static let value5 = 5
        
        class func testTree() -> Tree<Int> {
            let root = Tree<Int>(value: value1)
            
            let child = Tree<Int>(value: value2)
            root.insert(child)
            
            let child2 = Tree<Int>(value: value3)
            child.insert(child2)
            
            let child3 = Tree<Int>(value: value4)
            root.insert(child3)
            
            let child4 = Tree<Int>(value: value5)
            root.insert(child4)

            return root
        }
    }
    
    static var allTests : [(String, (TreeTests) -> () throws -> Void)] {
        return [
            ("testInit", testInit),
            ("testAdd", testInsert),
            ("testRemove", testInsert),
            ("testDepthFirstForEachUntil", testDepthFirstForEachUntil),
            ("testWidthFirstForEachUntil", testWidthFirstForEachUntil),
            ("testDepthFirstSearch", testDepthFirstSearch),
            ("testWidthFirstSearch", testWidthFirstSearch),
            ("testOrderedComparison", testOrderedComparison),
            ("testMap", testMap),

        ]
    }
}
