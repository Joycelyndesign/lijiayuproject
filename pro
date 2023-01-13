42153040 李佳豫 Final project
1.
class CompleteBinaryTree:
    def __init__(self):
        self.root = None
        self.size = 0

    class Node:
        def __init__(self, data):
            self.data = data
            self.next = None

    def add(self, data):
        new_node = self.Node(data)
        if self.root is None:
            self.root = new_node
        else:
            current = self.root
            while current.next is not None:
                current = current.next
            current.next = new_node
        self.size += 1

    def left_child(self, index):
        if (index * 2) + 1 < self.size:
            current = self.root
            for i in range((index * 2) + 1):
                current = current.next
            return current.data
        else:
            return None

    def right_child(self, index):
        if (index * 2) + 2 < self.size:
            current = self.root
            for i in range((index * 2) + 2):
                current = current.next
            return current.data
        else:
            return None

    def parent(self, index):
        if index > 0:
            current = self.root
            for i in range((index - 1) // 2):
                current = current.next
            return current.data
        else:
            return None


class CompleteBinaryTree:
    def __init__(self):
        self.data = []

    def parent(self, i):
        if i == 0:
            return None
        return (i-1) // 2

    def left_child(self, i):
        left = 2 * i + 1
        if left >= len(self.data):
            return None
        return left
    
    def right_child(self, i):
        right = 2 * i + 2
        if right >= len(self.data):
            return None
        return right
parent = (i-1) // 2, left child = 2 * i + 1, right child = 2 * i + 2
The function will return None if the index is out of bounds of the array.


2、
class MinPriorityQueue:
    def __init__(self):
        self.data = []

    def parent(self, i):
        if i == 0:
            return None
        return (i-1) // 2

    def left_child(self, i):
        left = 2 * i + 1
        if left >= len(self.data):
            return None
        return left

    def right_child(self, i):
        right = 2 * i + 2
        if right >= len(self.data):
            return None
        return right

    def insert(self, key):
        self.data.append(key)
        i = len(self.data) - 1
        while i > 0:
            parent = self.parent(i)
            if self.data[parent] > self.data[i]:
                self.data[parent], self.data[i] = self.data[i], self.data[parent]
                i = parent
            else:
                break

    def delMin(self):
        if len(self.data) == 0:
            return None
        if len(self.data) == 1:
            return self.data.pop()
        min_val = self.data[0]
        self.data[0] = self.data.pop()
        i = 0
        while True:
            left = self.left_child(i)
            right = self.right_child(i)
            if left is not None and right is not None:
                if self.data[left] < self.data[right]:
                    if self.data[left] < self.data[i]:
                        self.data[left], self.data[i] = self.data[i], self.data[left]
                        i = left
                    else:
                        break
                else:
                    if self.data[right] < self.data[i]:
                        self.data[right], self.data[i] = self.data[i], self.data[right]
                        i = right
                    else:
                        break
            elif left is not None:
                if self.data[left] < self.data[i]:
                    self.data[left], self.data[i] = self.data[i], self.data[left]
                    i = left
                else:
                    break
            elif right is not None:
                if self.data[right] < self.data[i]:
                    self.data[right], self.data[i] = self.data[i], self.data[right]
                    i = right
                else:
                    break
            else:
                break
        return min_val

Explain: 
The insert(key) method takes a key as an argument and adds it to the end of the data array, then it compares the key with its parent node, if the parent node is greater than the new key, it swaps the two elements and continues the process until it reaches the root or the parent is less than the new key. This process ensures that the new key is placed in the correct position in the tree to maintain the min-heap property.

The delMin() method removes the minimum element from the priority queue, which is the root of the tree. It replaces the root with the last element in the data array and then compares the new root with its left and right children. If the left or right child is smaller than the new root, it swaps the new root with the smaller child, and continues the process until the new root is in the correct position to maintain the min-heap property. This method returns the minimum value removed from the priority queue.

3.
The time complexity of the insert() method is O(log n) because, in the worst case, the new node may have to be compared with its parent all the way to the root node. The time complexity of the delMin() method is also O(log n), because in the worst case, the root node may have to be compared with its children all the way to the bottom of the tree.

4.
Conduct:
import time

heap = MinPriorityQueue()

# Insert benchmark
start_time = time.time()
for i in range(10000):
    heap.insert(i)
end_time = time.time()
insert_time = end_time - start_time
print("Insert time:", insert_time)

# Delete benchmark
start_time = time.time()
for i in range(10000):
    heap.delMin()
end_time = time.time()
delete_time = end_time - start_time
print("Delete time:", delete_time)

visualize the results：
import matplotlib.pyplot as plt

x = [i for i in range(10000)]
y = [insert_time, delete_time]
plt.plot(x, y)
plt.xlabel('Number of operations')
plt.ylabel('Time (seconds)')
plt.title('Performance of linked list based heap')
plt.show()

5.
from graphviz import Digraph

def visualize_heap(heap):
    dot = Digraph()
    for i, value in enumerate(heap.heap):
        dot.node(str(i), str(value))
        parent = heap.get_parent(i)
        if parent is not None:
            dot.edge(str(parent), str(i))
    return dot

heap = MinPriorityQueue()

# Insert elements into heap
for i in range(10):
    heap.insert(i)

# Visualize heap
visualize_heap(heap)
