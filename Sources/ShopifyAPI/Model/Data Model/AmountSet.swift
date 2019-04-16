//
// Created by Arnon Keereena on 2019-04-14.
//

import Foundation

public struct AmountSet: Decodable {
  public var shopMoney: Amount?
  public var presentmentMoney: Amount?
  
  enum CodingKeys: String, CodingKey {
    case shopMoney = "shop_money"
    case presentmentMoney = "presentment_money"
  }
}
