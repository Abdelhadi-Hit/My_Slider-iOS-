//
//  AproposViewController.swift
//  MonCurseur
//
//  Created by ABDELHADI BAKHTY on 6/1/2023.
//

import UIKit
import WebKit
class AproposViewController: UIViewController {
    @IBOutlet weak var web: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        guard let filePath = Bundle.main.path(forResource: "MonCurseur", ofType: "html") else { return }

        guard let htmlString = try? String(contentsOfFile: filePath) else { return }
        
        web.loadHTMLString(htmlString, baseURL: nil)
        
    }
    

    @IBAction func closeButtonTapped(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }

}
