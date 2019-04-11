//
// Created by Arnon Keereena on 2019-04-11.
//

import Foundation
import Moya

public enum ShopifyAPIError: Swift.Error, CustomStringConvertible, CustomDebugStringConvertible {
  case responseDecoding(response: Moya.Response, baseError: Error)
  case unauthorized(error: ErrorResponse, baseError: Error)
  
  public var description: String {
    return debugDescription
  }
  
  public var debugDescription: String {
    switch self {
    case .responseDecoding(let response, let baseError):
      return "Fail to decode response body into Data Model" +
             "\ngot: \"\(String(data: response.data, encoding: .utf8) ?? "nil")\"" +
             "\nUnderlying error: \(baseError)"
    case .unauthorized(let response, let baseError):
      return response.errors ?? baseError.localizedDescription
    }
  }
}
