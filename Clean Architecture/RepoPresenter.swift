//
//  RepoPresenter.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/23.
//

import Foundation

/// リポジトリ検索　PresenterProtocol
protocol RepoPresenterProtocol{
    /// リポジトリの検索を開始する
    /// - parameter keyword:検索キーワード
    func startSearch(keyword:String)
}

protocol  RepoPresenterProtocolOutput {
    /// 検索結果を反映する
    /// - parameter repos:検索されたリポジトリ
    func updateRepoData(repos:[RepoResult])
    
    /// エラーを表示する
    /// - parameter error:発生したエラーオブジェクト
    func displayError(error:SearchError)
}

/// リポジトリ検索　Presenter
class RepoPresenter:RepoPresenterProtocol,RepoUsecaseOutputProtocol{
    
    var usecase:RepoUsecaseProtocol!
    var output:RepoPresenterProtocolOutput!
    
    // MARK: RepoPresenterProtocol
    func startSearch(keyword: String) {
        usecase.startSearch(keyword: keyword)
    }
    
    // MARK: RepoUsecaseOutputPRotocol
    func presentSearchResult(results: [RepoResult]) {
        output.updateRepoData(repos: results)
    }
    
    func presentSearchError(error: SearchError) {
        output.displayError(error: error)
    }
    
    
}



