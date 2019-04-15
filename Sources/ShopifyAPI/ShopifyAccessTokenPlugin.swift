//
// Created by Arnon Keereena on 2019-04-15.
//

import Foundation
import Moya

// Custom authentication plugin to provide HTTP Header per shopify authentication requirement
public struct ShopifyAccessTokenPlugin: PluginType {
  let tokenClosure: () -> String
  
  public init(tokenClosure: @escaping () -> String) {
    self.tokenClosure = tokenClosure
  }
  
  public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    guard let authorizable = target as? AccessTokenAuthorizable else { return request }
    var request = request
    
    switch authorizable.authorizationType {
    case .basic, .bearer, .custom: request.addValue(tokenClosure(), forHTTPHeaderField: "X-Shopify-Access-Token")
    case .none: return request
    }
    
    return request
  }
}
