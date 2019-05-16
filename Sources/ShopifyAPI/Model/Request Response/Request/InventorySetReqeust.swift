//
// Created by Arnon Keereena on 2019-05-16.
//

import Foundation

public struct InventorySetRequest: Encodable {
  var locationID:     String?
  var variantID:      String?
  var inventoryLevel: String?
  
  public init(locationID: String?,
              variantID: String?,
              inventoryLevel: String?) {
    self.locationID = locationID
    self.variantID = variantID
    self.inventoryLevel = inventoryLevel
  }
}
