//
// Created by Arnon Keereena on 2019-04-09.
//

import Foundation

public struct ProductCount: Decodable {
  public var count: Int?
  
  enum CodingKeys: String, CodingKey {
    case count = "count"
  }
}
