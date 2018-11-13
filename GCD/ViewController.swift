//
//  ViewController.swift
//  GCD
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let main = DispatchQueue.main

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        serrialQueue()
//        concurrentQueue()
        racingData()
//        disPatchQueueAsyncAfter()
//        disPatchWorkItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func serrialQueue() {
        let serrialQueue = DispatchQueue(label: "com.bigZero.SerrialQeue")
        for i in 0...5 {
            serrialQueue.async {
                print("\(i): - \(Thread.current)")
                sleep(1)
            }
        }
        print("Completed: - \(Thread.current)")
    }
    
    func concurrentQueue() {
        let concurrentQueue = DispatchQueue(label: "com.bigZero.concurrentQueue", attributes: .concurrent)
        for i in 0...5 {
            concurrentQueue.async {
                print("\(i): - \(Thread.current)")
                sleep(1)
            }
        }
        print("Complete: - \(Thread.current)")
    }
    
    func racingData() {
        var count = 0
        for _ in 0...10 {
            DispatchQueue.global().async {
                count += 1
            }
        }
        print(count)
    }
    
    func demo() {
        
        DispatchQueue.global().async {
            
            DispatchQueue.main.async {
                
            }
        }
    }
    
    func disPatchQueueAsyncAfter() {
        for i in 0...5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                print("\(i): - \(Thread.current)")
            }
        }
        print("Completed: - \(Thread.current)")
    }
    
    func disPatchWorkItem() {
        var count = 0
        let disPatchWorkItem = DispatchWorkItem {
            count += 1
            print("\(count): - \(Thread.current)")
        }
        for _ in 0...1000 {
            if count == 900 {
                disPatchWorkItem.cancel()
                print("Dispatch Work Item is cancel")
                
            } else {
                disPatchWorkItem.perform()
            }
        }
    }
    
}

