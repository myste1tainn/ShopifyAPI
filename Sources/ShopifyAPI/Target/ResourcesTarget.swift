//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation
import Moya

public enum ResourcesTarget: TargetType, AccessTokenAuthorizable {
  case authenticate (shop: String, clientId: String, clientSecret: String, code: String)
  case orders(_ spec: APIPartialSpecification)
  case products(_ spec: APIPartialSpecification)
  
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
  
  public var method: Moya.Method {
    switch self {
    case .authenticate: return .get
    case .orders, .products:
      guard let wholeSpec = self.wholeSpec else { return .get }
      return wholeSpec.method
    }
  }
  
  public var task: Task {
    switch self {
    case .authenticate: return .requestPlain
    case .products(let spec), .orders(let spec):
      if let page = spec.page {
        return .requestParameters(parameters: [
          "limit": 50,
          "page": page
        ], encoding: URLEncoding.default)
      } else {
        return .requestPlain
      }
    }
  }
  
  public var headers: [String: String]? {
    return [:]
  }
  
  public var sampleData: Data { fatalError("sampleData has not been implemented") }

// MARK: - Access Token authorizable
  
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
  
  private var wholeSpec: APISpecification? {
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
  

