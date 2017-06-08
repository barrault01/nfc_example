//
//  ViewController.swift
//  nfc
//
//  Created by Antoine Barrault on 08/06/2017.
//  Copyright © 2017 Antoine Barrault. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scanner: NFCScanner!

    override func viewDidLoad() {
        super.viewDidLoad()
        scanner = NFCScanner()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didClickOnScan(_ sender: Any) {
        scanner.startSession()
    }

}

