//
// Created by Arnon Keereena on 2019-04-14.
//

import Foundation

public struct OrderAdjustment: Decodable {
  public var id: Int?
  public var orderId: Int?
  public var refundId: Int?
  public var amount: String?
  public var taxAmount: String?
  public var kind: String?
  public var reason: String?
  public var amountSet: AmountSet?
  public var taxAmountSet: AmountSet?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case orderId = "order_id"
    case refundId = "refund_id"
    case amount = "amount"
    case taxAmount = "tax_amount"
    case kind = "kind"
    case reason = "reason"
    case amountSet = "amount_set"
    case taxAmountSet = "tax_amount_set"
  }
}
