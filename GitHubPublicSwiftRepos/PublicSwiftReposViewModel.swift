//
//  PublicSwiftReposViewModel.swift
//  Bitpanda Task
//
//  Created by Mena Yousif on 10/30/19.
//  Copyright © 2019 Bitpanda Task. All rights reserved.
//

import Networking
import Entities

final class PublicSwiftReposViewModel {
    private let sessionProvider = URLSessionProvider()

    func getRepository(id: Int,
                       success: @escaping ((Repository) -> Void),
                       failure: @escaping ((NetworkError) -> Void)) {
        sessionProvider.request(type: Repository.self, service: GitHubService.repository(id: id)) { response in
            switch response {
            case let .success(repository):
                success(repository)
            case let .failure(error):
                failure(error)
            }
        }
    }
    
    func getRepositories(pageIndex: Int,
                         success: @escaping (([Repository]) -> Void),
                         failure: @escaping ((NetworkError) -> Void)) {
        let service = GitHubService.repositories(pageIndex: pageIndex)
        sessionProvider.request(type: Repositories.self, service: service) { response in
            switch response {
            case let .success(repositories):
                success(repositories.items)
            case let .failure(error):
                failure(error)
            }
        }
    }

    func getContributors(fullName: String,
                         success: @escaping (([Owner]) -> Void),
                         failure: @escaping ((NetworkError) -> Void)) {
        let service = GitHubService.contributors(fullname: fullName)
        sessionProvider.request(type: [Owner].self, service: service) { response in
            switch response {
            case let .success(contributors):
                success(contributors)
            case let .failure(error):
                failure(error)
            }
        }
    }

}
