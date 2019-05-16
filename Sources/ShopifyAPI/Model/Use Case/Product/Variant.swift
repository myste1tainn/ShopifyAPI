//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation

public struct Variant: Decodable {
  public var id: Int?
  public var productId: Int?
  public var title: String?
  public var price: String?
  public var sku: String?
  public var position: Int?
  public var inventoryPolicy: String?
  public var compareAtPrice: Int?
  public var fulfillmentService: String?
  public var inventoryManagement: String?
  public var option1: String?
  public var option2: Int?
  public var option3: Int?
  public var createdAt: String?
  public var updatedAt: String?
  public var taxable: Int?
  public var barcode: String?
  public var grams: Int?
  public var imageId: Int?
  public var inventoryQuantity: Int?
  public var weight: Int?
  public var weightUnit: String?
  public var inventoryItemId: Int?
  public var oldInventoryQuantity: Int?
  public var requiresShipping: Int?
  public var adminGraphqlApiId: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case productId = "product_id"
    case title = "title"
    case price = "price"
    case sku = "sku"
    case position = "position"
    case inventoryPolicy = "inventory_policy"
    case compareAtPrice = "compare_at_price"
    case fulfillmentService = "fulfillment_service"
    case inventoryManagement = "inventory_management"
    case option1 = "option1"
    case option2 = "option2"
    case option3 = "option3"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case taxable = "taxable"
    case barcode = "barcode"
    case grams = "grams"
    case imageId = "image_id"
    case inventoryQuantity = "inventory_quantity"
    case weight = "weight"
    case weightUnit = "weight_unit"
    case inventoryItemId = "inventory_item_id"
    case oldInventoryQuantity = "old_inventory_quantity"
    case requiresShipping = "requires_shipping"
    case adminGraphqlApiId = "admin_graphql_api_id"
  }
}
