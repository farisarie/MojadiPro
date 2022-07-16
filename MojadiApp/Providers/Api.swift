//
//  Api.swift
//  MojadiApp
//
//  Created by yoga arie on 18/05/22.
//

import Foundation
import Moya
import RxSwift

let api: MoyaProvider<Api> = MoyaProvider<Api>(
    plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))]
)

enum Api{
    case loadCategory
    case loadPopular
    case loadComingSoon
    case loadInsight
    case loadDetailCourse(course_id: Int)
    case loadAllPopular
    case searchComingsoon(keyword: String)
}

extension Api: TargetType{
  
    var baseURL: URL {
        return URL(string: "https://service.mojadipro.com/api/v1")!
    }
    
    var path: String {
        switch self{
        case .loadCategory:
            return "/course/category"
            
        case .loadPopular:
            return "/course/popular"
            
        case .loadComingSoon:
            return "/course/coming-soon"
            
        case .loadInsight:
            return "/industry-insight"
            
        case .loadDetailCourse(let course_id):
            return "/course/\(course_id)"
     
        case .loadAllPopular:
            return "/course/popular/all"
            
        case .searchComingsoon:
            return "/course/coming-soon"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .loadCategory, .loadPopular, .loadComingSoon, .loadInsight, .loadDetailCourse, .loadAllPopular, .searchComingsoon:
            return .get
        
        }
    }
    
    var task: Task {
        switch self{
        case .loadCategory, .loadPopular, .loadComingSoon, .loadInsight, .loadAllPopular:
            return .requestPlain
        
        case .loadDetailCourse(let course_id):
            let parameters: [String: Any] = ["course_id" : course_id]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        case .searchComingsoon(let keyword):
            let parameter: [String: Any] = ["keyword" : keyword]
            return .requestParameters(parameters: parameter, encoding: URLEncoding.default)
            
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
