//
//  WebViewController.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import UIKit
import WebKit

final class WebViewController: UIViewController, WKNavigationDelegate {
    private let url: URL
    private let webView = WKWebView()
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
