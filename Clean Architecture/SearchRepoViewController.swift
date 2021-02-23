//
//  ViewController.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/21.
//

import UIKit

/// リポジトリ検索　ViewController
class SearchRepoViewController: UIViewController,SearchRepoPresenterOutput {
    
    var presenter:SearchRepoPresenter!

    private let tableView = UITableView()
    private let searchBar = UISearchBar()
    private var repositories:[SearchRepoResult] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewContent()
        
    }
    
    private func setUpViewContent(){
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        
        tableView.dataSource = self
        tableView.register(RepoCell.self, forCellReuseIdentifier: RepoCell.identifer)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5),
            searchBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -5),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -5),
            tableView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    // MARK: SearchRrpoPresenterOutput
    func updateRepoData(repos: [SearchRepoResult]) {
        repositories = repos
    }
    
    func displayError(error: SearchError) {
        
    }
}

extension SearchRepoViewController:UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoCell.identifer, for: indexPath) as! RepoCell
        
        cell.repoName = repositories[indexPath.item].name
        cell.fullName = repositories[indexPath.item].fullName
        cell.repoDescription = repositories[indexPath.item].description ?? "this repository has not description"
        
        return cell
    }
}

extension SearchRepoViewController:UISearchBarDelegate{
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else { return }
        presenter.startSearch(keyword: keyword)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else { return }
        presenter.startSearch(keyword: keyword)
    }
}

private class RepoCell:UITableViewCell{
    static let identifer = "RepoCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        construct()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        construct()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        repoName = ""
        repoDescription = ""
        fullName = ""
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
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            
            
        ])
        
    }
}

