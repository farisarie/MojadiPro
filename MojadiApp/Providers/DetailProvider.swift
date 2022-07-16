//
//  DetailProvider.swift
//  MojadiApp
//
//  Created by yoga arie on 24/05/22.
//

import Foundation
import RxSwift
import Moya

class DetailProvider{
    static var shared: DetailProvider = DetailProvider()
    private init(){}
    
    private let disposeBag = DisposeBag()
    
    func loadDetailCourse(_ course_id: Int, completion: @escaping (Result<DataClass, Error>) -> Void){
        api.rx.request(.loadDetailCourse(course_id: course_id)).map(ResponseDetail.self).subscribe { (response) in 
            switch response {
            case .success(let responseDetail):
                completion(.success(responseDetail.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
