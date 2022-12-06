//
//  ShowWebView.swift
//  FakeMessanger
//
//  Created by Raman Kozar on 04/12/2022.
//

import UIKit
import WebKit

class ShowWebView: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var forwardBtn: UIBarButtonItem!
    @IBOutlet weak var refreshBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        indicator.isHidden = true
        webView.navigationDelegate = self
        
        let urlString = "https://apple.com/ru/macbook-air/"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)

    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        workIndicator(isAnimated: false)
        enableBtnIfCanGoBack()
        enableBtnIfCanGoForward()
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        workIndicator(isAnimated: true)
        
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        if webView.canGoBack {
            webView.goBack()
        }
        
    }
    
    @IBAction func forwardBtnPressed(_ sender: Any) {
        
        if webView.canGoForward {
            webView.goForward()
        }
        
    }
    
    @IBAction func refreshBtnPressed(_ sender: Any) {
        webView.reload()
    }
    
    private func enableBtnIfCanGoBack() {
        
        if webView.canGoBack {
            backBtn.isEnabled = true
        } else {
            backBtn.isEnabled = false
        }
        
    }
    
    private func enableBtnIfCanGoForward() {
        
        if webView.canGoForward {
            forwardBtn.isEnabled = true
        } else {
            forwardBtn.isEnabled = false
        }
        
    }
    
    private func workIndicator(isAnimated: Bool) {
       
        if isAnimated {
        
            self.indicator.isHidden = false
            self.indicator.startAnimating()
            textLabel.text = "Loading..."
            
        } else {
        
            self.indicator.isHidden = true
            self.indicator.stopAnimating()
            textLabel.text = ""
            
        }
        
    }
    
}
