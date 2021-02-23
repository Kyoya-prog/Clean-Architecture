//
//  RepoGateway.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/22.
//

import Foundation

typealias SearchRepoResult = SearchRepoEntity.Repo
/// リポジトリ検索　GatewayProtocol
protocol SearchRepoGatewayProtocol{
    /// リポジトリを検索する
    /// - parameter keyword:検索キーワード
    /// - parameter completion:完了ハンドラ
    func search(keyword:String,completion: @escaping (Result<[SearchRepoResult],SearchError>)->Void)
}

enum SearchError:Error {
    case invalidSearchResultError
    case occurErrorDuringSearch
    case decodeError
}

/// リポジトリ検索 Gateway
final class SearchRepoGateWay:SearchRepoGatewayProtocol{
    func search(keyword: String, completion: @escaping (Result<[SearchRepoResult], SearchError>) -> Void) {
        let urlstring = "https://api.github.com/search/repositories?q=\(keyword)"
        let url = URL(string: urlstring)!

        let task = URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let data = data else {
                completion(.failure(.invalidSearchResultError))
                return
            }
            if error != nil {
                completion(.failure(.occurErrorDuringSearch))
            }
            let jsonDecoder = JSONDecoder()
            do {
                let jsondata = try jsonDecoder.decode(SearchRepoEntity.self, from: data)
                completion(.success(jsondata.items))
            }
            catch{
                completion(.failure(.decodeError))
            }
        }
        task.resume()
    }
}



