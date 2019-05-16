//
// Created by Arnon Keereena on 2019-04-14.
//

import Foundation

public struct Refund: Decodable {
  public var id: Int?
  public var orderId: Int?
  public var createdAt: String?
  public var note: String?
  public var userId: Int?
  public var processedAt: String?
  public var restock: Bool?
  public var adminGraphqlApiId: String?
  public var refundLineItems: [LineItem]?
  public var transactions: [Transaction]?
  public var orderAdjustments: [OrderAdjustment]?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case orderId = "order_id"
    case createdAt = "created_at"
    case note = "note"
    case userId = "user_id"
    case processedAt = "processed_at"
    case restock = "restock"
    case adminGraphqlApiId = "admin_graphql_api_id"
    case refundLineItems = "refund_line_items"
    case transactions = "transactions"
    case orderAdjustments = "order_adjustments"
  }
}
