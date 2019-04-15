//
// Created by Arnon Keereena on 2019-04-07.
//

import Foundation
import Moya
import RxMoya
import RxSwift

/// Represent APIs on Shopify
public class APIs: MoyaProvider<ResourcesTarget> {
  
  public func authenticate(shop: String,
                           clientId: String,
                           clientSecret: String,
                           code: String) -> Single<AccessToken> {
    return rx.request(.authenticate(shop: shop,
                                    clientId: clientId,
                                    clientSecret: clientSecret,
                                    code: code))
             .map { try $0.toModel(ofType: AccessToken.self) }
  }
  
  public func orders(shop: String) -> Single<[Order]> {
    return rx.request(.orders(.get(from: shop)))
             .map { try $0.toModel(ofType: ArrayResponse<Order>.self) }
             .map { $0.items ?? [] }
  }
  
  public func products(shop: String) -> Single<[Product]> {
    return productCount(shop: shop)
      .map(self.pages(from:))
      .flatMap(self.gettingProductInPages(shop: shop))
  }
  
  private func pages(from count: Int) -> [Int] {
    let itemsPerPage = 50
    let numPage = count / itemsPerPage
    let pages = Array(1...numPage + 1)
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
  
  private func products(shop: String, in page: Int) -> Single<[Product]> {
    return rx.request(.products(.get(from: shop, at: page)))
             .map { try $0.toModel(ofType: ArrayResponse<Product>.self) }
             .map { $0.items ?? [] }
  }
  
  public func productCount(shop: String) -> Single<Int> {
    return rx.request(.products(.getCount(from: shop)))
             .map { try $0.toModel(ofType: ProductCount.self) }
             .map { $0.count ?? 0 }
  }
  
}
