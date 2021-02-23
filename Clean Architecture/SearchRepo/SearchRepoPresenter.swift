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
        output.displayError(error: error)
    }
    
    
}



