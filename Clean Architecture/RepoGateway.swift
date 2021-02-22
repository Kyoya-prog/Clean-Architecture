//
//  RepoGateway.swift
//  Clean Architecture
//
//  Created by 松山響也 on 2021/02/22.
//

import Foundation

protocol RepoGatewayProtocol{
    func search(keyword:String,completion: @escaping (Result<[RepoEntity],Error>)->Void)
}
