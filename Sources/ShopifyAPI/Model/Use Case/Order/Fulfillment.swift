//
// Created by Arnon Keereena on 2019-04-14.
//

import Foundation

public struct Fulfillment: Decodable {
  public var id: Int?
  public var orderId: Int?
  public var status: String?
  public var createdAt: String?
  public var service: String?
  public var updatedAt: String?
  public var trackingCompany: String?
  public var shipmentStatus: String?
  public var locationId: Int?
  public var trackingNumber: String?
  public var trackingNumbers: [String]?
  public var trackingUrl: String?
  public var trackingUrls: [String]?
  public var receipt: [String: String]?
  public var name: String?
  public var adminGraphqlApiId: String?
  public var lineItems: [LineItem]?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case orderId = "order_id"
    case status = "status"
    case createdAt = "created_at"
    case service = "service"
    case updatedAt = "updated_at"
    case trackingCompany = "tracking_company"
    case shipmentStatus = "shipment_status"
    case locationId = "location_id"
    case trackingNumber = "tracking_number"
    case trackingNumbers = "tracking_numbers"
    case trackingUrl = "tracking_url"
    case trackingUrls = "tracking_urls"
    case receipt = "receipt"
    case name = "name"
    case adminGraphqlApiId = "admin_graphql_api_id"
    case lineItems = "line_items"
  }
}
