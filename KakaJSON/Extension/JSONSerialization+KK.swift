//
//  JSONSerialization+KK.swift
//  KakaJSON
//
//  Created by MJ Lee on 2019/8/2.
//  Copyright © 2019 MJ Lee. All rights reserved.
//

import Foundation

extension JSONSerialization {
    static func kk_JSON<T>(_ string: String?, _ type: T.Type) -> T? {
        return kk_JSON(string?.data(using: .utf8), type)
    }
    
    static func kk_JSON<T>(_ data: Data?, _ type: T.Type) -> T? {
        guard let value = data else { return nil }
        return try? jsonObject(with: value,
                               options: .allowFragments) as? T
    }
    
    static func kk_string(_ json: Any?,
                          prettyPrinted: Bool = false) -> String? {
        guard let value = json,
            let data = try? data(withJSONObject: value,
                                 options: prettyPrinted ? [.prettyPrinted] : [])
            else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
