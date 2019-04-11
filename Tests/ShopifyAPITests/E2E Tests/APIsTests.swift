import XCTest
import RxSwift
import RxBlocking
@testable import ShopifyAPI

final class APIsTests: XCTestCase {
  
  var apis: APIs!
  let shop = "girlsnationofficial"
  
  override func setUp() {
    apis = APIs()
  }
  
  func tests_getOrder() {
    let orders = XCTAssertNoThrow(apis.orders(shop: shop).toBlocking(timeout: 1).first)
    XCTAssertNotNil(orders)
  }
  
}
