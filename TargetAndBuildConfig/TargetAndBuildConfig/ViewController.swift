//
//  ViewController.swift
//  TargetAndBuildConfig
//
//  Created by Samiksha on 22/06/17.
//  Copyright © 2017 Samiksha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        var launchUrlString: String = ""
        #if (TBC_QA)
            launchUrlString = QA_SERVER_URL
        #elseif (TBC_STAGING)
            launchUrlString = STAGING_SERVER_URL
        #elseif (TBC_PRODUCTION)
            launchUrlString = PRODUCTION_SERVER_URL
        #elseif (TBC_DEV)
            launchUrlString = DEV_SERVER_URL
        #endif
        let launchUrl = URL.init(string: launchUrlString)
        let launchRequest = URLRequest.init(url: launchUrl!)
        webView.loadRequest(launchRequest)
    }
}

