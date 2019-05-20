//
// Created by Arnon Keereena on 2019-04-07.
//

import Foundation
import RxNetworking
import RxSwift

/// Represent APIs on Shopify
public class APIs: HTTPClient<ResourcesTarget> {
  
  public func authenticate(shop: String,
                           clientId: String,
                           clientSecret: String,
                           code: String) -> Single<AccessToken> {
    return request(.authenticate(shop: shop,
                                 clientId: clientId,
                                 clientSecret: clientSecret,
                                 code: code))
      .map { try $0.toModel(ofType: AccessToken.self) }
  }
  
  public func orders(shop: String) -> Single<[Order]> {
    return orderCount(shop: shop)
      .map(self.pages(from:))
      .flatMap(self.gettingOrderInPages(shop: shop))
  }
  
  public func orders(shop: String, in page: Int) -> Single<[Order]> {
    return request(.orders(.get(from: shop, at: page)))
      .map { try $0.toModel(ofType: ArrayResponse<Order>.self) }
      .map { $0.items ?? [] }
  }
  
  public func orderCount(shop: String) -> Single<Int> {
    return request(.orders(.getCount(from: shop)))
      .map { try $0.toModel(ofType: CountResponse.self) }
      .map { $0.count ?? 0 }
  }
  
  public func products(shop: String) -> Single<[Product]> {
    return productCount(shop: shop)
      .map(self.pages(from:))
      .flatMap(self.gettingProductInPages(shop: shop))
  }
  
  public func products(shop: String, in page: Int) -> Single<[Product]> {
    return request(.products(.get(from: shop, at: page)))
      .map { try $0.toModel(ofType: ArrayResponse<Product>.self) }
      .map { $0.items ?? [] }
  }
  
  public func productCount(shop: String) -> Single<Int> {
    return request(.products(.getCount(from: shop)))
      .map { try $0.toModel(ofType: CountResponse.self) }
      .map { $0.count ?? 0 }
  }
  
  public func inventorySet(shop: String, request inventorySetRequest: InventorySetRequest) -> Single<Void> {
    return request(.inventorySet(shop: shop, request: inventorySetRequest))
      .map { _ in }
  }
  
  // MARK: - Helper functions
  
  private func pages(from count: Int) -> [Int] {
    let itemsPerPage = 50
    let numPage      = count / itemsPerPage
    let pages        = Array(1...numPage + 1)
    return pages
  }
  
  private func gettingProductInPages(shop: String) -> ([Int]) -> Single<[Product]> {
    return { pages in
      let obs = pages.map(self.gettingProductInPage(shop: shop))
                     .map { $0.asObservable() }
      return Observable.merge(obs)
                       .reduce([Product]()) { $0 + $1 }
                       .asSingle()
    }
  }
  
  private func gettingProductInPage(shop: String) -> (Int) -> Single<[Product]> {
    return { page in
      self.products(shop: shop, in: page)
    }
  }
  
  private func gettingOrderInPages(shop: String) -> ([Int]) -> Single<[Order]> {
    return { pages in
      let obs = pages.map(self.gettingOrderInPage(shop: shop))
                     .map { $0.asObservable() }
      return Observable.merge(obs)
                       .reduce([Order]()) { $0 + $1 }
                       .asSingle()
    }
  }
  
  private func gettingOrderInPage(shop: String) -> (Int) -> Single<[Order]> {
    return { page in
      self.orders(shop: shop, in: page)
    }
  }
}
