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
    return Observable.empty().asSingle()
  }
  
  private func products(shop: String, in page: Int) -> Single<[Product]> {
    return rx.request(.products(.get(from: shop, at: page)))
             .map { try $0.toModel(ofType: [Product].self) }
  }
  
  public func productCount(shop: String) -> Single<Int> {
    return rx.request(.products(.getCount(from: shop)))
             .map { try $0.toModel(ofType: ProductCount.self) }
             .map { $0.count ?? 0 }
  }
  
}
