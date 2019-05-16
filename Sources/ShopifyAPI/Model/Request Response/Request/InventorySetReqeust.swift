//
// Created by Arnon Keereena on 2019-05-16.
//

import Foundation

public struct InventorySetRequest: Encodable {
  var locationID:      String?
  var variantID:       String?
  var inventoryLevels: String?
  
  public init(locationID: String?,
              variantID: String?,
              inventoryLevels: String?) {
    self.locationID = locationID
    self.variantID = variantID
    self.inventoryLevels = inventoryLevels
  }
  
  enum CodingKeys: String, CodingKey {
    case locationID      = "location_id"
    case variantID       = "variant_id"
    case inventoryLevels = "inventory_levels"
  }
}
