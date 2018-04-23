//
//  HelpVC.swift
//  BibleCoreDataTest03242018
//
//  Created by Steven Robertson on 4/17/18.
//  Copyright © 2018 Steven Robertson. All rights reserved.
//

import UIKit
import WebKit

class HelpVC: UIViewController, WKUIDelegate {

    
    @IBOutlet weak var webKitView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webKitView = WKWebView(frame: .zero, configuration: webConfiguration)
        webKitView.uiDelegate = self
        view = webKitView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let myURL = Bundle.main.url(forResource: "help", withExtension: "html") {
        let myRequest = URLRequest(url: myURL)
        webKitView.load(myRequest)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
