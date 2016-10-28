//
//  ViewController.swift
//  Uber
//
//  Created by 黄启明 on 2016/10/27.
//  Copyright © 2016年 huatengIOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FxLog(message: "start up")
        _ = currentSystemVersion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

