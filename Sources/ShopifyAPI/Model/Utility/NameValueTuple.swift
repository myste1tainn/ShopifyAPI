//
// Created by Arnon Keereena on 2019-05-07.
//

import Foundation

public struct NameValueTuple: Decodable {
  public var name:  String?
  public var value: String?
  
  enum CodingKeys: String, CodingKey {
    case name  = "name"
    case value = "value"
  }
}
