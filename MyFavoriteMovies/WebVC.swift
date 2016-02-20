//
//  WebVC.swift
//  MyFavoriteMovies
//
//  Created by macuser on 2/20/16.
//  Copyright © 2016 ResponseApps. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {
    
    @IBOutlet weak var container:UIView!
    var webView:WKWebView!
    
    var link:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        
        container.addSubview(webView)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //ensure webView matches constraints of container view
        
        let frame = CGRectMake(0,0,container.bounds.width, container.bounds.height)
        
        webView.frame = frame
        
        loadRequest(self.link)
        
    }
    
    func loadRequest(urlStr:String) {
        
        let url = NSURL(string: urlStr)!
        
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
        
    }

    
}

