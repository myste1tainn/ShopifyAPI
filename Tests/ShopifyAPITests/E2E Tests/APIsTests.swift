import XCTest
import RxSwift
import RxBlocking
import Moya
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
  
  func tests_getProductCount_whenUsingCorrectShop_itReturnsProductCount() {
    let count = self.apis.productCount(shop: self.shop).toBlocking().firstCatchError()
    XCTAssertNotNil(count)
    XCTAssert(count ?? 0 > 0)
  }
  
  func tests_getProducts_whenUsingCorrectShop_itReturnsProducts() {
    let productCount =
    let products = self.apis.products(shop: self.shop).toBlocking().firstCatchError()
    XCTAssertNotNil(products)
    XCTAssert(products?.count ?? 0 > 0)
    XCTAsesrt(products?.count == productCount)
  }
}

