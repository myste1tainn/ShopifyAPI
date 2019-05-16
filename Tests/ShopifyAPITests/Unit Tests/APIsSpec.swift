import Foundation
import RxSwift
import RxQuickNimble
import Quick
import Nimble
@testable import RxNetworking
@testable import ShopifyAPI

class APIsSpec: QuickSpec {
  override func spec() {
    let apis: APIs!
    let shop                 = "girlsnationofficial"
    let disposeBag           = DisposeBag()
    let authenticationPlugin = AccessTokenPlugin(tokenSingle: .just("81f56cb2d6357ba9de79646be4b44a99"))
    let loggerPlugin         = SpyLoggerPlugin()
    apis = APIs(plugins: [authenticationPlugin, loggerPlugin])
    
    describe("APIs") {
      describe("#inventorySet") {
        it("create request to expected structure") {
          let request = InventorySetRequest(locationID: "L111", variantID: "V111", inventoryLevels: "1")
          let json    = try! String(data: JSONEncoder().encode(request), encoding: .utf8) ?? ""
          apis.request(.inventorySet(shop: shop, request: request))
              .expectation(bag: disposeBag,
                           { _ in
                             fail("expect error to be called")
                           }, { _ in
                             expect(loggerPlugin.lastRequest).notTo(beNil())
                             let string = loggerPlugin.lastRequestString
                             expect(string).to(contain(json))
                             expect(string).to(contain("girlsnationofficial.myshopify.com/admin/inventory_levels/set.json"))
                             expect(string).to(contain("X-Shopify-Access-Token"))
                           })
        }
      }
    }
  }
  
}

public struct MockError: Error {

}

public final class SpyLoggerPlugin: PluginType {
  var lastRequest:       URLRequest?
  var lastRequestString: String? {
    return lastRequest?.curlString
  }
  
  public func willSend(httpRequest: HTTPRequest, request: URLRequest) throws -> Single<URLRequest> {
    lastRequest = request
    return .error(MockError())
  }
  
  public func didSend(request: URLRequest, received response: HTTPResponse) throws -> Single<HTTPResponse> {
    return .just(response)
  }
}
