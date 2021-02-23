//
//  RepoCell.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/23.
//

import Foundation
import UIKit
/// リポジトリ検索　cell
class RepoCell:UITableViewCell{
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
    
    /// リポジトリ名
    var repoName:String{
        get{
            nameLabel.text ?? ""
        }
        set{
            nameLabel.text = newValue
        }
    }
    
    /// リポジトリの説明
    var repoDescription:String{
        get{
            descriptionLabel.text ?? ""
        }
        set{
            descriptionLabel.text = newValue
        }
    }
    
    /// 名前入りリポジトリ名
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
