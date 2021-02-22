//
//  RepoGateway.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/22.
//

import Foundation

typealias RepoResult = RepoEntity.Repo
/// RepoGatewayProtocol
protocol RepoGatewayProtocol{
    /// リポジトリを検索する
    /// - parameter keyword:検索キーワード
    /// - parameter completion:完了ハンドラ
    func search(keyword:String,completion: @escaping (Result<[RepoResult],SearchError>)->Void)
}

enum SearchError:Error {
    case invalidSearchResultError
    case occurErrorDuringSearch
    case decodeError
}



