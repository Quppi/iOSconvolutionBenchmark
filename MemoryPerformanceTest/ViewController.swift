//
//  ViewController.swift
//  MemoryPerformanceTest
//
//  Created by Philipp Meyer on 17.05.17.
//  Copyright © 2017 Philipp Meyer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultCpp: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goButtonCppPressed(sender: AnyObject) {
        let bm = benchmark()

 //       bm.testBench()
       bm.backgroundBench()
//        let duration = bm.bench()
//        resultCpp.text = "C++: \(duration) ms"
    }

}

