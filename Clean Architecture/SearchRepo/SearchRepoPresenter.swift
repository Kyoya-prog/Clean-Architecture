//
//  RepoPresenter.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/23.
//

import Foundation


/// リポジトリ検索　Presenter
class SearchRepoPresenter:SearchRepoPresenterProtocol,SearchRepoUsecaseOutput{
    
    var usecase:SearchRepoUsecaseProtocol!
    var output:SearchRepoPresenterOutput!
    
    // MARK: RepoPresenterProtocol
    func startSearch(keyword: String) {
        usecase.startSearch(keyword: keyword)
    }
    
    // MARK: RepoUsecaseOutputPRotocol
    func presentSearchResult(results: [SearchRepoResult]) {
        output.updateRepoData(repos: results)
    }
    
    func presentSearchError(error: SearchError) {
        let message:String
        switch error {
        case .decodeError:
            message = "データの変換に失敗しました。もう一度検索してください"
        case .invalidSearchResultError:
            message = "検索結果が不正です。もう一度検索してください"
        case .occurErrorDuringSearch:
            message = "検索中にエラーが発生しました。もう一度検索してください"
        }
        output.displayError(message: message)
    }
    
    
}



