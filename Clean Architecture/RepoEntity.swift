//
//  RepoEntity.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/21.
//

import Foundation

/// RepoEntity
struct RepoEntity:Codable{
    var items:[Repo]
    public struct Repo:Codable{
        var name:String
        var fullName:String
        var description:String?
        var htmlURL:String

        private enum CodingKeys:String, CodingKey{
            case fullName = "full_name"
            case name
            case description
            case htmlURL = "html_url"
        }
    }
}
