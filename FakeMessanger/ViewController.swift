//
//  ViewController.swift
//  FakeMessanger
//
//  Created by Raman Kozar on 04/12/2022.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showWebView(_ sender: Any) {
        
        guard let showVC = storyboard?.instantiateViewController(identifier: "ShowWebView") else { return }
        present(showVC, animated: true, completion: nil)
                
    }
    
    @IBAction func myAnswerBtnPressed(_ sender: Any) {
        
        let urlNew = "https://www.apple.com/macbook-air/"
        guard let url = URL(string: urlNew) else { return }
        
        let SafariVC = SFSafariViewController(url: url)
        
        SafariVC.preferredBarTintColor = .red
        SafariVC.preferredControlTintColor = .green
        
        present(SafariVC, animated: true)
        
    }
    
}

