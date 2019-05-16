//
// Created by Arnon Keereena on 2019-04-09.
//

import Foundation

/// To supports partially defined API call specification and is used internally
/// to form a full APISpecification later on, this is needed since the full specification
/// requires resource name but the usages (TargetType's case) already contains the resource name
/// which will be redundant on the usage as such: .orders(.get(from: shop, resourceName: .orders))
///
/// This class's static functions provide possibility to do .orders(.get(from: shop)) which is much
/// shorter and clearer to consumer
public struct PartialAPISpec {
  public let shop: String
  let specMethod: Method
  let page:       Int?
  
  public static func getCount(from shop: String) -> PartialAPISpec {
    return .init(shop: shop, method: .getCount)
  }
  
  public static func get(from shop: String) -> PartialAPISpec {
    return .init(shop: shop, method: .get)
  }
  
  public static func get(from shop: String, at page: Int) -> PartialAPISpec {
    return .init(shop: shop, at: page, method: .get)
  }
  
  public static func post(to shop: String) -> PartialAPISpec {
    return .init(shop: shop, method: .post)
  }
  
  public static func put(to shop: String, id: String) -> PartialAPISpec {
    return .init(shop: shop, method: .put(id: id))
  }
  
  public static func patch(to shop: String, id: String) -> PartialAPISpec {
    return .init(shop: shop, method: .patch(id: id))
  }
  
  public static func delete(from shop: String, id: String) -> PartialAPISpec {
    return .init(shop: shop, method: .delete(id: id))
  }
  
  private init(shop: String, at page: Int? = nil, method: Method) {
    self.shop = shop
    self.page = page
    self.specMethod = method
  }
}
