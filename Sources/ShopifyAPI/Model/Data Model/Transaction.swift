//
// Created by Arnon Keereena on 2019-04-14.
//

import Foundation

public struct Transaction: Decodable {
  public var id: Int?
  public var orderId: Int?
  public var kind: String?
  public var gateway: String?
  public var status: String?
  public var message: String?
  public var createdAt: String?
  public var test: Bool?
  public var authorization: String?
  public var locationId: String?
  public var userId: String?
  public var parentId: Int?
  public var processedAt: String?
  public var deviceId: String?
  public var receipt: Receipt?
  public var errorCode: String?
  public var sourceName: String?
  public var amount: String?
  public var currency: String?
  public var adminGraphqlApiId: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case orderId = "order_id"
    case kind = "kind"
    case gateway = "gateway"
    case status = "status"
    case message = "message"
    case createdAt = "created_at"
    case test = "test"
    case authorization = "authorization"
    case locationId = "location_id"
    case userId = "user_id"
    case parentId = "parent_id"
    case processedAt = "processed_at"
    case deviceId = "device_id"
    case receipt = "receipt"
    case errorCode = "error_code"
    case sourceName = "source_name"
    case amount = "amount"
    case currency = "currency"
    case adminGraphqlApiId = "admin_graphql_api_id"
  }
}
