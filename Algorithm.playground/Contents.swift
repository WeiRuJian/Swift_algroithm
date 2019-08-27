import UIKit

var str = "Hello, playground"


//给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
//你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
//示例:
//给定 nums = [2, 7, 11, 15], target = 9
//因为 nums[0] + nums[1] = 2 + 7 = 9
//所以返回 [0, 1]

let nums = [2, 7, 11, 15]

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

    var dict: [Int: Int] = [:]
    for (index, value) in nums.enumerated() {
        dict[value] = index
    }

    for (index, value) in nums.enumerated() {
        let num = target - value
        if let index1 = dict[num], index1 != index {
            return [index1, index]
        }
    }
    return []
}

twoSum(nums,  18)



//给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
//如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
//您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
//
//示例：
//输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
//输出：7 -> 0 -> 8
//原因：342 + 465 = 807

//链表
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//链表逆序
func reverseList(_ node: ListNode?) -> ListNode? {
    var pre: ListNode?
    var next: ListNode?
    var temp: ListNode? = node
    while temp != nil {
        next = temp?.next
        temp?.next = pre
        pre = temp
        temp = next
    }
    return pre
}



//func addToNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//    guard let p = l1, let q = l2 else { return nil }
//    var p1 = reverseList(p)
//    var q1 = reverseList(q)
//    let node: ListNode? = ListNode(0)
//    var temp = node
//    var carry = 0
//    while p1 != nil || q1 != nil {
//        let x = (p1 != nil ) ? p1!.val : 0
//        let y = (q1 != nil) ? q1!.val : 0
//        let sum = carry + x + y
//        print(sum)
//        carry = sum / 10
//        temp?.next = ListNode(sum % 10)
//        temp = temp?.next
//        if p1 != nil { p1 = p1?.next }
//        if q1 != nil { q1 = q1?.next }
//    }
//    if carry > 0 {
//        temp?.next = ListNode(carry)
//    }
//
//    return node?.next
//}

func addToNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var p = l1, q = l2
    let node: ListNode? = ListNode(0)
    var temp = node
    var carry = 0
    while p != nil || q != nil {
        let x = (p != nil ) ? p!.val : 0
        let y = (q != nil) ? q!.val : 0
        let sum = carry + x + y
   
        carry = sum / 10
        temp?.next = ListNode(sum % 10)
        temp = temp?.next
        if p != nil { p = p?.next }
        if q != nil { q = q?.next }
    }
    if carry > 0 {
        temp?.next = ListNode(carry)
    }
    
    return node?.next
}




let l1 = ListNode(5)
//l1.next = ListNode(4)
//l1.next?.next = ListNode(3)

let l2 = ListNode(5)
//l2.next = ListNode(6)
//l2.next?.next = ListNode(4)


dump(addToNumbers(l1, l2))


