//
//  ViewController.swift
//  FakeMessanger
//
//  Created by Raman Kozar on 04/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showWebView(_ sender: Any) {
        
        guard let showVC = storyboard?.instantiateViewController(identifier: "ShowWebView") else { return }
        present(showVC, animated: true, completion: nil)
                
    }

}

