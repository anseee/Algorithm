//
//  LRUCache.swift
//  Algorithms
//
//  Created by 박성원 on 2022/06/19.
//

import Foundation

class Node {
    var value: String
    var prev: Node?
    var next: Node?
    init(value: String, prev: Node? = nil, next: Node? = nil) {
        self.value = value
        self.prev = prev
        self.next = next
    }
}

class DoublyLinkedList {
    var cacheSize: Int
    var head: Node
    var tail: Node
    
    var cacheHit = 0
    var cacheMiss = 0
    
    init(cacheSize: Int) {
        self.cacheSize = cacheSize
        self.head = Node(value: "")
        self.tail = Node(value: "")
        self.head.next = self.tail
        self.tail.prev = self.head
    }
    
    func lru(value: String) {
        var node = head.next
        while node?.value != nil {
            if let node = node, node.value == value {
                cacheHit(node:node, value:value)
                return
            }
            node = node?.next
        }
        cacheMiss(value: value)
    }
    
    func cacheHit(node: Node, value: String) {
        cacheHit += 1
        removeNode(node: node)
        addFront(value: value)
    }
    
    func cacheMiss(value: String) {
        cacheMiss += 5
        addFront(value: value)
        if totalLen() > cacheSize {
            removeTail()
        }
    }
    
    func addFront(value: String) {
        let newNode = Node(value: value)
        head.next?.prev = newNode
        newNode.next = head.next
        head.next = newNode
        newNode.prev = head
    }
    
    func totalLen() -> Int {
        var answer = 0
        var node = head.next
        
        while node?.value != nil {
            answer += 1
            node = node?.next
        }
        return answer
    }
    
    func removeNode(node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    func removeTail() {
        tail.prev?.prev?.next = tail
        tail.prev = tail.prev?.prev
    }
}
