import XCTest
import RxSwift
import RxBlocking
import Moya
import TestUtilities
@testable import ShopifyAPI

final class APIsTests: XCTestCase {
  
  var apis: APIs!
  let shop = "girlsnationofficial"
  
  override func setUp() {
    let authenticationPlugin = ShopifyAccessTokenPlugin { "81f56cb2d6357ba9de79646be4b44a99" }
    let loggerPlugin = NetworkLoggerPlugin()
    apis = APIs(plugins: [authenticationPlugin, loggerPlugin])
  }
  
  func tests_getOrders_whenUsingCorrectShop_itReturnsOrders() {
    let orders = self.apis.orders(shop: self.shop).toBlocking().firstCatchError()
    XCTAssertNotNil(orders)
    XCTAssert(orders?.count ?? 0 > 0)
  }
  
}


import Foundation

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
