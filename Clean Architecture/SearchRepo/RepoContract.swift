//
//  RepoContract.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/23.
//

import Foundation

/// リポジトリ検索　PresenterOutput
protocol  SearchRepoPresenterOutput {
    /// 検索結果を反映する
    /// - parameter repos:検索されたリポジトリ
    func updateRepoData(repos:[SearchRepoResult])
    
    /// エラーを表示する
    /// - parameter error:発生したエラーオブジェクト
    func displayError(error:SearchError)
}

/// リポジトリ検索　PresenterProtocol
protocol SearchRepoPresenterProtocol{
    /// リポジトリの検索を開始する
    /// - parameter keyword:検索キーワード
    func startSearch(keyword:String)
}

/// リポジトリ検索　Usecase Input
protocol SearchRepoUsecaseProtocol{
    /// リポジトリ検索を開始する
    /// - parameter keyword:検索キーワード
    func startSearch(keyword:String)
}

/// リポジトリ検索　Usecase Output
protocol SearchRepoUsecaseOutput{
    /// 検索結果を表示する
    /// - parameter results:検索結果のリポジトリ
    func presentSearchResult(results:[SearchRepoResult])
    
    /// エラーを表示する
    /// - parameter error:検索の際に発生したエラー
    func presentSearchError(error:SearchError)
}

/// リポジトリ検索　GatewayProtocol
protocol SearchRepoGatewayProtocol{
    /// リポジトリを検索する
    /// - parameter keyword:検索キーワード
    /// - parameter completion:完了ハンドラ
    func search(keyword:String,completion: @escaping (Result<[SearchRepoResult],SearchError>)->Void)
}

/// リポジトリ検索時エラー
enum SearchError:Error {
    case invalidSearchResultError
    case occurErrorDuringSearch
    case decodeError
}
