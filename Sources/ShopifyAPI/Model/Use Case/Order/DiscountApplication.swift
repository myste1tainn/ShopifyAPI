//
// Created by Arnon Keereena on 2019-05-07.
//

import Foundation

public struct DiscountApplication: Decodable {
  public var type: String?
  public var value: String?
  public var valueType: String?
  public var allocationMethod: String?
  public var targetSelection: String?
  public var targetType: String?
  public var description: String?
  public var title: String?
  
  enum CodingKeys: String, CodingKey {
    case type = "type"
    case value = "value"
    case valueType = "value_type"
    case allocationMethod = "allocation_method"
    case targetSelection = "target_selection"
    case targetType = "target_type"
    case description = "description"
    case title = "title"
  }
 }
