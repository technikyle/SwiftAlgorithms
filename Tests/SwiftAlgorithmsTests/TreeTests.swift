import XCTest
@testable import SwiftAlgorithms

class TreeTests: XCTestCase {
    
    func testInit() {
        let value = 1
        let tree = Tree<Int>(value: value)
        
        XCTAssertEqual(tree.value, value)
        XCTAssertEqual(tree.children.count, 0)
    }
    
    func testAdd() {
        let value = 1
        let root = Tree<Int>(value: value)
        
        let value2 = 2
        let child = Tree<Int>(value: value2)
        root.add(child: child)
        
        let rootChildCount = root.children.count
        XCTAssertEqual(rootChildCount, 1)

        let rootChild1 = root.children[0]
        XCTAssert(rootChild1 === child)
    }
    
    func testDepthFirstForEachUntil() {
        let value = 1
        let root = Tree<Int>(value: value)
        
        let value2 = 2
        let child = Tree<Int>(value: value2)
        root.add(child: child)
        
        let value3 = 3
        let child2 = Tree<Int>(value: value3)
        child.add(child: child2)
        
        let value4 = 4
        let child3 = Tree<Int>(value: value4)
        root.add(child: child3)
        
        let value5 = 5
        let child4 = Tree<Int>(value: value5)
        root.add(child: child4)
        
        var iteratedValues = [Int]()
        func appendValues(value:Int, depth: UInt) {
            iteratedValues.append(value)
        }
        root.depthFirstForEach(appendValues)
        XCTAssert(iteratedValues == [value, value2, value3, value4, value5])
        
        iteratedValues = [Int]()
        root.depthFirstForEach(appendValues, until: { value, depth in
            return true
        })
        XCTAssert(iteratedValues == [])
        
        iteratedValues = [Int]()
        root.depthFirstForEach(appendValues, until: { value, depth in
            return value == value3
        })
        XCTAssert(iteratedValues == [value, value2])
    }
    
    func testWidthFirstForEachUntil() {
        let value = 1
        let root = Tree<Int>(value: value)
        
        let value2 = 2
        let child = Tree<Int>(value: value2)
        root.add(child: child)
        
        let value3 = 3
        let child2 = Tree<Int>(value: value3)
        child.add(child: child2)
        
        let value4 = 4
        let child3 = Tree<Int>(value: value4)
        root.add(child: child3)
        
        let value5 = 5
        let child4 = Tree<Int>(value: value5)
        root.add(child: child4)
        
        var iteratedValues = [Int]()
        func appendValues(value:Int, depth: UInt) {
            iteratedValues.append(value)
        }
        root.widthFirstForEach(appendValues)
        XCTAssert(iteratedValues == [value, value2, value4, value5, value3])
        
        iteratedValues = [Int]()
        root.widthFirstForEach(appendValues, until: { value in
            return true
        })
        XCTAssert(iteratedValues == [])
        
        iteratedValues = [Int]()
        root.widthFirstForEach(appendValues, until: { value, depth in
            return value == value3
        })
        XCTAssert(iteratedValues == [value, value2, value4, value5])
    }
    
    func testDepthFirstMap() {
        let value = 1
        let root = Tree<Int>(value: value)
        
        let value2 = 2
        let child = Tree<Int>(value: value2)
        root.add(child: child)
        
        let value3 = 3
        let child2 = Tree<Int>(value: value3)
        child.add(child: child2)
        
        let value4 = 4
        let child3 = Tree<Int>(value: value4)
        root.add(child: child3)
        
        let value5 = 5
        let child4 = Tree<Int>(value: value5)
        root.add(child: child4)
        
        var mappedValues = root.depthFirstMap({ value in
            return value
        })
        XCTAssert(mappedValues == [value, value2, value3, value4, value5])
        
        func transform(value: Int) -> Int {
            return value * value
        }
        let mappedValues2 = root.depthFirstMap(transform)
        let mappedValuesCheck = mappedValues.map(transform)
        XCTAssert(mappedValues2 == mappedValuesCheck)
    }
    
    func testWidthFirstMap() {
        let value = 1
        let root = Tree<Int>(value: value)
        
        let value2 = 2
        let child = Tree<Int>(value: value2)
        root.add(child: child)
        
        let value3 = 3
        let child2 = Tree<Int>(value: value3)
        child.add(child: child2)
        
        let value4 = 4
        let child3 = Tree<Int>(value: value4)
        root.add(child: child3)
        
        let value5 = 5
        let child4 = Tree<Int>(value: value5)
        root.add(child: child4)
        
        var mappedValues = root.widthFirstMap({ value in
            return value
        })
        XCTAssert(mappedValues == [value, value2, value4, value5, value3])
        
        func transform(value: Int) -> Int {
            return value * value
        }
        let mappedValues2 = root.widthFirstMap(transform)
        let mappedValuesCheck = mappedValues.map(transform)
        XCTAssert(mappedValues2 == mappedValuesCheck)
    }

    
    func testDepthFirstSearch() {
        let value = 1
        let root = Tree<Int>(value: value)
        
        let value2 = 2
        let child = Tree<Int>(value: value2)
        root.add(child: child)
        
        let value3 = 3
        let child2 = Tree<Int>(value: value3)
        child.add(child: child2)
        
        let value4 = 4
        let child3 = Tree<Int>(value: value4)
        root.add(child: child3)
        
        let foundRootValue = root.depthFirstSearch(value:value)
        XCTAssertEqual(foundRootValue, true)
        
        let foundChildValue = root.depthFirstSearch(value:value2)
        XCTAssertEqual(foundChildValue, true)
        
        let notFoundChildValue = root.depthFirstSearch(value:0)
        XCTAssertEqual(notFoundChildValue, false)
    }
    
    func testWidthFirstSearch() {
        let value = 1
        let root = Tree<Int>(value: value)
        
        let value2 = 2
        let child = Tree<Int>(value: value2)
        root.add(child: child)
        
        let value3 = 3
        let child2 = Tree<Int>(value: value3)
        child.add(child: child2)
        
        let value4 = 4
        let child3 = Tree<Int>(value: value4)
        root.add(child: child3)
        
        let foundRootValue = root.widthFirstSearch(value:value)
        XCTAssertEqual(foundRootValue, true)
        
        let foundChildValue = root.widthFirstSearch(value:value2)
        XCTAssertEqual(foundChildValue, true)
        
        let notFoundChildValue = root.widthFirstSearch(value:0)
        XCTAssertEqual(notFoundChildValue, false)
    }
    
    func testOrderedComparison() {
        let value = 1
        let root = Tree<Int>(value: value)
        
        let value2 = 2
        let child = Tree<Int>(value: value2)
        root.add(child: child)
        
        let value3 = 3
        let child2 = Tree<Int>(value: value3)
        child.add(child: child2)
        
        let value4 = 4
        let child3 = Tree<Int>(value: value4)
        root.add(child: child3)
        
        let value5 = 5
        let child4 = Tree<Int>(value: value5)
        root.add(child: child4)
        
        XCTAssertTrue(root.orderedComparison(to:root))
        
        XCTAssertFalse(root.orderedComparison(to:child))

    }
    
    func testMap() {
        let value = 1
        let root = Tree<Int>(value: value)
        
        let value2 = 2
        let child = Tree<Int>(value: value2)
        root.add(child: child)
        
        let value3 = 3
        let child2 = Tree<Int>(value: value3)
        child.add(child: child2)
        
        let value4 = 4
        let child3 = Tree<Int>(value: value4)
        root.add(child: child3)
        
        let value5 = 5
        let child4 = Tree<Int>(value: value5)
        root.add(child: child4)
        
        let copy = root.map()
        
        XCTAssert(root !== copy)
        XCTAssert(root.orderedComparison(to:copy))
        
        func transform(value: Int) -> Int {
            return value * 2
        }
        let transformedRoot = root.map(transform)
        let mappedTransformedRoot = transformedRoot.depthFirstMap()
        let mappedCopy = copy.depthFirstMap(transform)
        XCTAssert(mappedTransformedRoot == mappedCopy)

    }
    
    static var allTests : [(String, (TreeTests) -> () throws -> Void)] {
        return [
            ("testInit", testInit),
            ("testAdd", testAdd),
            ("testDepthFirstSearch", testDepthFirstSearch),
            ("testWidthFirstSearch", testWidthFirstSearch),

        ]
    }
}
