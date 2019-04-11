//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation
import Moya

extension Response {
  public func toModel<T: Decodable>(ofType type: T.Type) throws -> T {
    do {
      return try map(type)
    } catch {
      do {
        throw try map(ErrorResponse.self)
      } catch {
        throw ShopifyAPIError.responseDecoding(response: self, baseError: error)
      }
    }
  }
}
