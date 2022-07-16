//
//  AppConstant.swift
//  MojadiApp
//
//  Created by yoga arie on 17/05/22.
//

import Foundation


struct AppConstant{
    static let serverURL: String = "https://service.mojadipro.com/api/v1"
    
    enum URL{
        static let LOGIN: String = "/user/login"
        static let Category: String = "/course/category"
        static let MyCourse: String = "/user/course?type=ongoing"
    }
}
