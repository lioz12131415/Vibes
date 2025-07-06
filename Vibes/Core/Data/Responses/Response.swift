//
//  Response.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

struct Response<Data: Decodable>: Decodable {
    internal let data: Data
}
