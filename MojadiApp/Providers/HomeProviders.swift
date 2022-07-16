//
//  HomeProviders.swift
//  MojadiApp
//
//  Created by yoga arie on 18/05/22.
//

import Foundation
import RxSwift
import Moya
import UIKit

class HomeProviders{
    static var shared: HomeProviders = HomeProviders()
    
    private init(){}
    
    private let disposeBag = DisposeBag()
    
    func loadCategory(completion: @escaping (Result<[Datum], Error>) -> Void) {
        api.rx.request(.loadCategory).map(ResponseCategory.self)
            .subscribe { (response) in
                switch response {
                case .success(let responseCategory):
                    completion(.success(responseCategory.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            .disposed(by: disposeBag)
    }
    
    func loadPopular(completion: @escaping (Result<[Popular], Error>) -> Void) {
        api.rx.request(.loadPopular).map(ResponsePopular.self)
            .subscribe { (response) in
                switch response {
                case .success(let responsePopular):
                    completion(.success(responsePopular.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            .disposed(by: disposeBag)
    }
    
    func loadComingSoon(completion: @escaping (Result<[ComingSoon], Error>) -> Void) {
        api.rx.request(.loadComingSoon).map(ResponseComingSoon.self)
            .subscribe { (response) in
                switch response {
                case .success(let responseComingSoon):
                    completion(.success(responseComingSoon.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            .disposed(by: disposeBag)
    }
    
    func loadInsight(completion: @escaping (Result<[Insight], Error>) -> Void) {
        api.rx.request(.loadInsight).map(ResponseInsight.self)
            .subscribe { (response) in
                switch response{
                case .success(let responseInsight):
                    completion(.success(responseInsight.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func loadAllPopular(completion: @escaping (Result<[AllPopular], Error>) -> Void) {
        api.rx.request(.loadAllPopular).map(ResponseAllPopular.self)
            .subscribe { (response) in
                switch response {
                case .success(let responsePopular):
                    completion(.success(responsePopular.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            .disposed(by: disposeBag)
    }
    
    func searchComingsoon(_ keyword: String, completion: @escaping (Result<[Search], Error>) -> Void) {
        api.rx.request(.searchComingsoon(keyword: keyword)).map(ResponseSearchSoon.self)
            .subscribe { (response) in
                switch response {
                case .success(let searchResult):
                    completion(.success(searchResult.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            .disposed(by: disposeBag)
    }
    
}
