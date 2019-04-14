import XCTest
import RxSwift
import RxBlocking
import TestUtilities
@testable import ShopifyAPI

final class APIsTests: XCTestCase {
  
  var apis: APIs!
  let shop = "girlsnationofficial"
  
  override func setUp() {
    apis = APIs()
  }
  
  func tests_getOrders_whenUsingCorrectShop_itReturnsOrders() {
    let orders = self.apis.orders(shop: self.shop).toBlocking().firstCatchError()
    XCTAssertNotNil(orders)
    XCTAssert(orders?.count ?? 0 > 0)
  }
  
}


