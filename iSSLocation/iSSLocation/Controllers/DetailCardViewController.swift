//
//  DetailCardViewController.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 6/21/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import WebKit
import SnapKit

class DetailCardViewController: UIViewController, WKNavigationDelegate {

    private var topView : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(named: "crew-card-bg")
        
        return v
    }()
    
    private var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Wikipedia"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        return label
    }()
    
    private lazy var acitivityIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.center = self.view.center
        indicator.hidesWhenStopped = true
        indicator.activityIndicatorViewStyle = .medium
        return indicator
    }()
    
    
    
    private var containerView = UIView()
    
    private var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: CGRect.zero)
        webView.navigationDelegate = self
        containerView.backgroundColor = .red
        containerView = webView
        
        setupView()
        
        //load
        let myURL = URL(string:"https://en.wikipedia.org/wiki/Doug_Hurley")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    private func setupView(){
        
        //subviews
        view.addSubview(topView)
        view.addSubview(containerView)
        view.addSubview(acitivityIndicator)
        topView.addSubview(titleLabel)
        
        //start load
        acitivityIndicator.startAnimating()
        
        //constrains
        topView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(60)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        acitivityIndicator.stopAnimating()
    }
    
}



