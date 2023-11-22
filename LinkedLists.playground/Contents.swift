import Foundation

// MARK:- Setup
class Node {
    var val: Any
    var next: Node?
    
    init(_ val: Any) {
        self.val = val
    }
}

let a = Node("A")
let b = Node("B")
let c = Node("C")
let d = Node("D")
let e = Node("E")
let f = Node("F")
let minusOne = Node(-1)
let one = Node(1)
let two = Node(2)
let three = Node(3)
let four = Node(4)
let seven = Node(7)
let eight = Node(8)
let fortyTwo = Node("42")
let banana = Node("banana")
let mango = Node("mango")
let p = Node("P")
let s = Node("S")
let t = Node("T")
let w = Node("W")
let x = Node("X")
let y = Node("Y")
let z = Node("Z")

a.next = b
b.next = c
c.next = d
d.next = e
e.next = f
one.next = two
two.next = eight
eight.next = three
//three.next = minusOne
minusOne.next = seven
banana.next = mango
x.next = y

private func printTestStart(_ name: String) {
    print("========== START \(name) TESTS ============")
}

private func printTestEnd(_ name: String) {
    print("========== END \(name) TESTS ============\n")
}
// MARK:- Print items in a linked list
func printList(head: Node?) {
    guard let current = head else { return }
    print(current.val)
    printList(head: current.next)
}

printTestStart("printList")
printList(head: a)
printTestEnd("printList")

// MARK:- Add values in a linked list to an array
func linkedListValues(head: Node?) -> [Any] {
    var values: [Any] = []
    appendValue(head, to: &values)
    return values
}

private func appendValue(_ node: Node?, to list: inout [Any]) {
    guard let head = node else { return }
    list.append(head.val)
    appendValue(head.next, to: &list)
}

printTestStart("linkedListValues")
print(linkedListValues(head: a))
print(linkedListValues(head: nil))
printTestEnd("linkedListValues")

// MARK:- Sum all values in a linked
func sumList(head: Node?) -> Int {
    guard let node = head else { return 0 }
    return node.val as! Int + sumList(head: node.next)
}

printTestStart("sumList")
print(sumList(head: two))
printTestEnd("sumList")

// MARK:- Find if linked list contains value
func linkedListFind(head: Node?, target: String) -> Bool {
    guard let node = head else { return false }
    if node.val as! String == target {
        return true
    }
    
    return linkedListFind(head: node.next, target: target)
}

printTestStart("linkedListFind")
print(linkedListFind(head: a, target: "C"))
print(linkedListFind(head: a, target: "D"))
print(linkedListFind(head: a, target: "Q"))
print(linkedListFind(head: fortyTwo, target: "42"))
print(linkedListFind(head: fortyTwo, target: "100"))
printTestEnd("linkedListFind")

// MARK:- Get node value at index
func getNodeValue(head: Node?, index: Int) -> String? {
    guard let node = head else { return nil }
    if index == 0 {
        return node.val as? String
    }
    return getNodeValue(head: node.next, index: index - 1)
}

printTestStart("getNodeValue")
print(getNodeValue(head: a, index: 2) as Any)
print(getNodeValue(head: a, index: 3) as Any)
print(getNodeValue(head: a, index: 7) as Any)
print(getNodeValue(head: banana, index: 0) as Any)
print(getNodeValue(head: banana, index: 1) as Any)
printTestEnd("getNodeValue")

// MARK:- Reverse linked list in place
func reverseList(head: Node?, prev: Node? = nil) -> Node? {
    guard let node = head else { return prev }
    let next = node.next
    node.next = prev
    
    return reverseList(head: next, prev: node)
}

printTestStart("reverseList")
//printList(head: reverseList(head: a))
//printList(head: reverseList(head: p))
//printList(head: reverseList(head: x))
printTestEnd("reverseList")


// MARK:- Zip two link lists together by alternating nodes
//func zipperLists(_ headOne: Node?, _ headTwo: Node?) -> Node {
//    var currentOne = headOne
//    var currentTwo = headTwo
//
//    while let nextNodeOne = currentOne?.next, let nextNodeTwo = currentTwo?.next {
//        print("Current One: \(String(describing: currentOne))")
//        print("Current Two: \(String(describing: currentTwo))")
//        currentOne?.next = currentTwo
//        currentTwo?.next = nextNodeOne
//
//        currentOne = nextNodeOne
//        currentTwo = nextNodeTwo
//    }
//    let finalNext = currentOne?.next
//    currentOne?.next = currentTwo
//    if let tail = finalNext {
//        currentTwo?.next = tail
//    }
//
//    return headOne!
//}

func zipperLists(_ headOne: Node?, _ headTwo: Node?) -> Node? {
    guard let nodeOne = headOne else { return headTwo }
    guard let nodeTwo = headTwo else { return headOne }
    
    let nextOne = nodeOne.next
    let nextTwo = nodeTwo.next
    
    nodeOne.next = nodeTwo
    nodeTwo.next = zipperLists(nextOne, nextTwo)
    
    return nodeOne
}

printTestStart("zipperLists")
a.next = b
b.next = c
c.next = d
d.next = e
e.next = f
x.next = y
y.next = z
s.next = t
two.next = three
//three.next = four
printList(head: zipperLists(a, x))
//printList(head: zipperLists(s, one))
//printList(head: zipperLists(w, one))
//printList(head: zipperLists(one, w))
printTestEnd("zipperLists")
