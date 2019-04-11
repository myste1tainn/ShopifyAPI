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
  
  func tests_getOrders_whenUsingCorrectShop_itReturnsOrders() {
    let orders = try self.apis.orders(shop: self.shop).toBlocking(timeout: 5).firstCatchError()
    XCTAssertNotNil(orders)
    XCTAssert(orders?.count ?? 0 > 0)
  }
  
}

extension BlockingObservable {
  func firstCatchError(_ message: String? = nil) -> E? {
    do {
      return try first()
    } catch {
      assert(false, "\(message ?? "Fail to blocked-get observable element") ::: \(error)")
    }
  }
  
  func lastCatchError(_ message: String? = nil) -> E? {
    do {
      return try last()
    } catch {
      assert(false, "\(message ?? "Fail to blocked-get observable element") ::: \(error)")
    }
  }
  
  func toArrayCatchError(_ message: String? = nil) -> [E] {
    do {
      return try toArray()
    } catch {
      assert(false, "\(message ?? "Fail to blocked-get observable element") ::: \(error)")
    }
  }
}

