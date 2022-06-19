//
//  LRUCache.swift
//  Algorithms
//
//  Created by 박성원 on 2022/06/19.
//

import Foundation

class LRUCache {
    class Node {
        var prev, next: Node?
        var key, value: Int
        
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    private let capacity: Int
    private var currentSize: Int
    private var hashMap: [Int: Node] = [:]
    private let head, tail : Node?
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.currentSize = 0
        self.head = Node(key: -1, value: -1)
        self.tail = Node(key: -1, value: -1)
        head?.next = tail
        tail?.prev = head
    }
    
    func get(_ key: Int) -> Int {
        printCache()
        
        if hashMap[key] == nil {
            return -1
        }
        
        //update queue
        remove(node: hashMap[key])
        add(node: hashMap[key])
        
        return hashMap[key]!.value
    }
    
    func put(_ key: Int, _ value: Int) {
        printCache()
        let newNode = Node(key: key, value: value)
        
        if hashMap[key] == nil {
            hashMap[key] = newNode
            add(node: newNode)
            currentSize += 1
        } else {
            remove(node: hashMap[key])
            hashMap[key] = newNode
            add(node: newNode)
        }
        
        if capacity < currentSize {
            hashMap.removeValue(forKey: tail!.prev!.key)
            remove(node: tail?.prev)
            currentSize -= 1
        }
    }
    
    private func add(node: Node?) {
        // head node head.next
        let next = head?.next
        head?.next = node
        node?.prev = head
        node?.next = next
        next?.prev = node
    }
    
    private func remove(node: Node?) {
        // node.prev node node.next
        node?.prev?.next = node?.next
        node?.next?.prev = node?.prev
    }
    
    private func printCache() {
        var curr = head
        while curr != nil {
            print(curr!.value, terminator: " ")
            curr = curr?.next
        }
        print("\n-----")
    }
}
