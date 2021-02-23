//
//  RepoUsecase.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/22.
//

import Foundation

/// リポジトリ検索　Usecase
final class SearchRepoUsecase:SearchRepoUsecaseProtocol{
    var output:SearchRepoUsecaseOutput!
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

