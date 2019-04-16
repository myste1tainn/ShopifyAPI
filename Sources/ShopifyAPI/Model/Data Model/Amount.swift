//
// Created by Arnon Keereena on 2019-04-14.
//

import Foundation

public struct Amount: Decodable {
  public var amount: String?
  public var currencyCode: String?
  
  enum CodingKeys: String, CodingKey {
    case amount = "amount"
    case currencyCode = "currency_code"
  }
}
