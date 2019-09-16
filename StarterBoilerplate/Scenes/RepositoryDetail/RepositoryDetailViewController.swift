//
//  RepositoryDetailViewController.swift
//  StarterBoilerplate
//
//  Created by Seyhun Akyürek on 16/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import UIKit

final class RepositoryDetailViewController: UIViewController, StoryboardInstantiatable {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    static var instantiateType: StoryboardInstantiateType {
         return .initial
     }
    
    var item: Item

    init(item: Item) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlRequest = URLRequest(url: URL(string: item.htmlURL!)!)
        webView.loadRequest(urlRequest)
        webView.delegate = self
    }

    private func hideLoadingIndicator() {
        loadingIndicator.stopAnimating()
        loadingIndicator.alpha = 0
    }
}

extension RepositoryDetailViewController: UIWebViewDelegate {

    func webViewDidStartLoad(_ webView: UIWebView) {
        loadingIndicator.startAnimating()
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        hideLoadingIndicator()
    }

    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        hideLoadingIndicator()
    }
}
