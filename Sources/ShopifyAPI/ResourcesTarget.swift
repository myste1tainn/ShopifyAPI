//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation
import RxNetworking

public enum ResourcesTarget: TargetType, AccessTokenAuthorizable {
  case authenticate (shop: String, clientId: String, clientSecret: String, code: String)
  case orders(_ spec: PartialAPISpec)
  case products(_ spec: PartialAPISpec)
  case inventorySet(_ request: InventorySetRequest)
  
  // MARK: - Target type
  
  public var baseURL: URL {
    switch self {
    case .authenticate(let shop, _, _, _):
      return URL(string: "https://\(figureOutShopDomain(shop: shop))")!
    case .orders(let spec), .products(let spec):
      return URL(string: "https://\(figureOutShopDomain(shop: spec.shop))")!
    }
  }
  
  public var path: String {
    return "admin/\(_path)"
  }
  
  public var method: HTTPMethod {
    switch self {
    case .authenticate: return .get
    case .orders, .products:
      guard let wholeSpec = self.wholeSpec else { return .get }
      return wholeSpec.method
    }
  }
  
  public var task: Task {
    switch self {
    case .authenticate: return .plain
    case .products(let spec), .orders(let spec):
      if let page = spec.page {
        return .parametered(with: ["limit": 50, "page": page], encoding: .query)
      } else {
        return .plain
      }
    }
  }
  
  public var headers: [String: String] {
    return [:]
  }
  
  // MARK: - Access Token authorizable
  
  public var authorizationHeader: String {
    return "X-Shopify-Access-Token"
  }
  
  public var authorizationType: AuthorizationType {
    switch self {
    case .orders, .products: return .custom("")
    default: return .none
    }
  }

// MARK: - Helper functions
  
  private func figureOutShopDomain(shop: String) -> String {
    if shop.hasSuffix("myshopify.com") {
      return shop
    } else {
      return "\(shop).myshopify.com"
    }
  }
  
  private var wholeSpec: APISpec? {
    switch self {
    case .orders(let spec):
      return .init(shop: spec.shop, resourceName: .orders, method: spec.specMethod)
    case .products(let spec):
      return .init(shop: spec.shop, resourceName: .products, method: spec.specMethod)
    default:
      return nil
    }
  }
  
  private var _path: String {
    switch self {
    case .authenticate: return "oauth/access_token"
    case .orders, .products: return wholeSpec.flatMap { $0.path } ?? ""
    }
  }
}
  

