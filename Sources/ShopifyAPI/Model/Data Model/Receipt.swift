//
// Created by Arnon Keereena on 2019-04-14.
//

import Foundation

public struct Receipt: Decodable {
  public var xAccountId: String?
  public var xReference: Int?
  public var xCurrency: String?
  public var xAmount: String?
  public var xTransactionType: String?
  public var xResult: String?
  public var xGatewayReference: String?
  public var xTimestamp: String?
  public var xSignature: String?
  
  enum CodingKeys: String, CodingKey {
    case xAccountId = "x_account_id"
    case xReference = "x_reference"
    case xCurrency = "x_currency"
    case xAmount = "x_amount"
    case xTransactionType = "x_transaction_type"
    case xResult = "x_result"
    case xGatewayReference = "x_gateway_reference"
    case xTimestamp = "x_timestamp"
    case xSignature = "x_signature"
  }
}
