//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation

public struct TaxLine: Decodable {
  public var price: String?
  public var rate: Int?
  public var title: String?
  
  enum CodingKeys: CodingKey {
    case price
    case rate
    case title
  }
}
