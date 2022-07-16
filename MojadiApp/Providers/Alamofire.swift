//
//  Alamofire.swift
//  MojadiApp
//
//  Created by yoga arie on 25/05/22.
//

import Foundation
import Alamofire

class DetailService{
    
    static var shared: DetailService = DetailService()
    
    func loadDetail(_ course_id: Int,  success: @escaping (ResponseDetail) -> Void, _ error: @escaping (AFError) -> Void) {
        AF.request("https://service.mojadipro.com/api/v1/course/\(course_id)", method: .get, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result{
        case .success:
                do{
                    
                    print(response.data)
                    let data = try JSONDecoder().decode(ResponseDetail.self, from: response.data!)
                success(data)
                } catch let error{
                    print(String(describing: error))
                }
            case .failure(let failure):
                error(failure)
            
            }
        }
    }
    
    func loadWebinar(_ course_id: Int,  success: @escaping (ResponseWebinar) -> Void, _ error: @escaping (AFError) -> Void) {
        AF.request("https://service.mojadipro.com/api/v1/course/\(course_id)/overview/webinar-session", method: .get, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result{
        case .success:
                do{
                    
                    print(response.data)
                    let data = try JSONDecoder().decode(ResponseWebinar.self, from: response.data!)
                success(data)
                } catch let error{
                    print(String(describing: error))
                }
            case .failure(let failure):
                error(failure)
            
            }
        }
    }
    
    func loadElearning(_ course_id: Int, success: @escaping (ResponseElearning) -> Void, _ error: @escaping(AFError) -> Void) {
        AF.request("https://service.mojadipro.com/api/v1/course/\(course_id)/overview/module", method: .get, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let data = try JSONDecoder().decode(ResponseElearning.self, from: response.data!)
                    success(data)
                } catch let error{
                    print(String(describing: error))
                }
            case .failure(let failure):
                error(failure)
            }
            
        }
    }
    
}
