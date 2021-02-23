//
//  ViewController.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/21.
//

import UIKit

/// リポジトリ検索　ViewController
class ViewController: UIViewController,SearchRepoPresenterOutput {
    func updateRepoData(repos: [SearchRepoResult]) {
        <#code#>
    }
    
    func displayError(error: SearchError) {
        <#code#>
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

