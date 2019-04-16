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
  
  func tests_getOrdersAtPage_whenUsingCorrectShop_itReturnsOrdersWithDefaultNumItems() {
    let orders = self.apis.orders(shop: self.shop, in: 0).toBlocking().firstCatchError()
    XCTAssert(orders != nil && orders?.count ?? 0 > 0, "it returns orders")
  }

  // TODO: still have to tests get all orders scenario where it ended up with unknown errors
//  func tests_getOrders_whenUsingCorrectShop_itReturnsOrders() {
//    let orderCount = self.apis.orderCount(shop: self.shop).toBlocking().firstCatchError()
//    let orders = self.apis.orders(shop: self.shop).toBlocking().firstCatchError()
//    XCTAssert(products != nil && products?.count ?? 0 > 0, "it returns products")
//    XCTAssertEqual(orders?.count, orderCount, "it returns orders count that match total count")
//  }
  
  func tests_getProductCount_whenUsingCorrectShop_itReturnsProductCount() {
    let count = self.apis.productCount(shop: self.shop).toBlocking().firstCatchError()
    XCTAssertNotNil(count)
    XCTAssert(count ?? 0 > 0)
  }
  
  func tests_getProducts_whenUsingCorrectShop_itReturnsProducts() {
    let productCount = self.apis.productCount(shop: self.shop).toBlocking().firstCatchError()
    let products = self.apis.products(shop: self.shop).toBlocking().firstCatchError()
    XCTAssert(products != nil && products?.count ?? 0 > 0, "it returns products")
    XCTAssertEqual(products?.count, productCount, "it returns products count that match total count")
  }
}
