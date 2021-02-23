//
//  RepoUsecase.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/22.
//

import Foundation

/// リポジトリ検索　Usecase Input
protocol SearchRepoUsecaseProtocol{
    /// リポジトリ検索を開始する
    /// - parameter keyword:検索キーワード
    func startSearch(keyword:String)
}

/// リポジトリ検索　Usecase Output
protocol SearchRepoUsecaseOutputProtocol{
    /// 検索結果を表示する
    /// - parameter results:検索結果のリポジトリ
    func presentSearchResult(results:[SearchRepoResult])
    
    /// エラーを表示する
    /// - parameter error:検索の際に発生したエラー
    func presentSearchError(error:SearchError)
}

/// リポジトリ検索　Usecase
final class SearchRepoUsecase:SearchRepoUsecaseProtocol{
    var output:SearchRepoUsecaseOutputProtocol!
    var gateway:SearchRepoGatewayProtocol!
    func startSearch(keyword: String) {
        gateway.search(keyword: keyword) { [weak self] repoResult in
            guard let self = self else { return }
    
            switch repoResult{
            case .success(let repos):
                self.output.presentSearchResult(results: repos)
            case .failure(let error):
            self.output.presentSearchError(error: error)
            }
        }
    }
}

