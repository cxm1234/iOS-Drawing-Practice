//
//  ViewController.swift
//  Practice _1_1
//
//  Created by  generic on 2021/2/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        test1()
    }
}

extension ViewController {
    private func test1() {
        let size = CGSize(width: view.bounds.width, height: 200)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
}
