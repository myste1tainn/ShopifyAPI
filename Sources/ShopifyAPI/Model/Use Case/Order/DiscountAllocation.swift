//
// Created by Arnon Keereena on 2019-05-07.
//

import Foundation

public struct DiscountAllocation: Decodable {
  public var amount: String?
  public var discountApplicationIndex: Int?
  
  enum CodingKeys: String, CodingKey {
    case amount = "amount"
    case discountApplicationIndex = "discount_application_index"
  }
}
