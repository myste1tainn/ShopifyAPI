//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation

public struct LineItem: Decodable {
  public var id: Int?
  public var variantId: Int?
  public var title: String?
  public var quantity: Int?
  public var price: String?
  public var sku: String?
  public var variantTitle: String?
  public var vendor: String?
  public var fulfillmentService: String?
  public var productId: Int?
  public var requiresShipping: Bool?
  public var taxable: Bool?
  public var giftCard: Bool?
  public var name: String?
  public var variantInventoryManagement: String?
  public var properties: [String]?
  public var productExists: Bool?
  public var fulfillableQuantity: Int?
  public var grams: Int?
  public var totalDiscount: String?
  public var fulfillmentStatus: String?
  public var discountAllocations: [DiscountAllocation]?
  public var adminGraphqlApiId: String?
  public var taxLines: [TaxLine]?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case variantId = "variant_id"
    case title = "title"
    case quantity = "quantity"
    case price = "price"
    case sku = "sku"
    case variantTitle = "variant_title"
    case vendor = "vendor"
    case fulfillmentService = "fulfillment_service"
    case productId = "product_id"
    case requiresShipping = "requires_shipping"
    case taxable = "taxable"
    case giftCard = "gift_card"
    case name = "name"
    case variantInventoryManagement = "variant_inventory_management"
    case properties = "properties"
    case productExists = "product_exists"
    case fulfillableQuantity = "fulfillable_quantity"
    case grams = "grams"
    case totalDiscount = "total_discount"
    case fulfillmentStatus = "fulfillment_status"
    case discountAllocations = "discount_allocations"
    case adminGraphqlApiId = "admin_graphql_api_id"
    case taxLines = "tax_lines"
  }
}
