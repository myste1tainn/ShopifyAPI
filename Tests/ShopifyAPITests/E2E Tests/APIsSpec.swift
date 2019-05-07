import RxSwift
import RxQuickNimble
import Quick
import Nimble
import Moya
@testable import ShopifyAPI

class APIsSpec: QuickSpec {
  
  
  override func spec() {
    var apis: APIs!
    let shop       = "girlsnationofficial"
    let disposeBag = DisposeBag()
    let authenticationPlugin = ShopifyAccessTokenPlugin { "81f56cb2d6357ba9de79646be4b44a99" }
    let loggerPlugin = NetworkLoggerPlugin()
    apis = APIs(plugins: [authenticationPlugin, loggerPlugin])
    
    describe("APIs") {
      describe("#orders") {
        it("returns orders") {
          apis.orders(shop: shop, in: 0).expectation(bag: disposeBag) {
            expect($0.count) > 0
          }
        }
      }
      
      describe("#products") {
        it("returns products num matches total count") {
          apis.productCount(shop: shop).flatMap { count in
            apis.products(shop: shop).map { (products: $0, count: count) }
          }.expectation(bag: disposeBag) {
            expect($0.count) == $0.products.count
          }
        }
      }
      
      describe("#productCount") {
        it("returns product count") {
          apis.productCount(shop: shop).expectation(bag: disposeBag) {
            expect($0) > 0
          }
        }
      }
    }
  }
  
  // TODO: still have to tests get all orders scenario where it ended up with unknown errors
//  func tests_getOrders_whenUsingCorrectShop_itReturnsOrders() {
//    let orderCount = self.apis.orderCount(shop: self.shop).toBlocking().firstCatchError()
//    let orders = self.apis.orders(shop: self.shop).toBlocking().firstCatchError()
//    XCTAssert(products != nil && products?.count ?? 0 > 0, "it returns products")
//    XCTAssertEqual(orders?.count, orderCount, "it returns orders count that match total count")
//  }
  
}

