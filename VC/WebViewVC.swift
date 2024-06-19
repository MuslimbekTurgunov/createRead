//
//  WebViewVC.swift
//  createRead
//
//  Created by Macbook on 02/03/22.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {

    
    @IBOutlet weak var webTable: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    let url = URL(string: "https://kun.uz")
    webTable.load(URLRequest(url: url!))
    }

    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
