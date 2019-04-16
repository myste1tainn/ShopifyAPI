//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation

public struct ShippingLine: Decodable {
  public var id: Int?
  public var title: String?
  public var price: String?
  public var code: String?
  public var source: String?
  public var phone: String?
  public var requestedFulfillmentServiceId: Int?
  public var deliveryCategory: String?
  public var carrierIdentifier: String?
  public var discountedPrice: String?
  public var discountAllocations: [String?]?
  public var taxLines: [TaxLine]?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case title = "title"
    case price = "price"
    case code = "code"
    case source = "source"
    case phone = "phone"
    case requestedFulfillmentServiceId = "requested_fulfillment_service_id"
    case deliveryCategory = "delivery_category"
    case carrierIdentifier = "carrier_identifier"
    case discountedPrice = "discounted_price"
    case discountAllocations = "discount_allocations"
    case taxLines = "tax_lines"
  }
}
