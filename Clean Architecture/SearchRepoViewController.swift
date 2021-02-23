//
//  ViewController.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/21.
//

import UIKit

/// リポジトリ検索　ViewController
class SearchRepoViewController: UIViewController,SearchRepoPresenterOutput {

    private let tableView = UITableView()
    private let searchTextField = UISearchTextField()
    private var repositories:[SearchRepoResult] = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: SearchRrpoPresenterOutput
    func updateRepoData(repos: [SearchRepoResult]) {
        repositories = repos
    }
    
    func displayError(error: SearchError) {
        
    }
}

extension SearchRepoViewController:UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}

private class RepoCell:UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var repoName:String{
        get{
            nameLabel.text ?? ""
        }
        set{
            nameLabel.text = newValue
        }
    }
    
    var repoDescription:String{
        get{
            descriptionLabel.text ?? ""
        }
        set{
            descriptionLabel.text = newValue
        }
    }
    
    var fullName:String{
        get{
            fullNameLabel.text ?? ""
        }
        set{
            fullNameLabel.text = newValue
        }
    }
    
    private var nameLabel = UILabel()
    
    private var descriptionLabel = UILabel()
    
    private var fullNameLabel = UILabel()
    
    private func construct(){
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        contentView.addSubview(descriptionLabel)
        
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(fullNameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(lessThanOrEqualTo: fullNameLabel.leftAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10),
            
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            fullNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            fullNameLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10),
            
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 5),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            
            
        ])
        
    }
}

