//
// Created by Arnon Keereena on 2019-04-11.
//

import Foundation
import RxNetworking

public enum ShopifyAPIError: Swift.Error, CustomStringConvertible, CustomDebugStringConvertible {
  case responseDecoding(response: HTTPResponse, baseError: Error?)
  case unauthorized(error: ErrorResponse?)
  case forbidden(error: ErrorResponse?)
  case error(_ errorResponse: ErrorResponse?)
  
  public var description: String {
    return debugDescription
  }
  
  private var code: Int {
    switch self {
    case .responseDecoding: return -1
    case .unauthorized: return 401
    case .forbidden: return 403
    case .error: return 999
    }
  }
  
  private var name: String {
    switch self {
    case .responseDecoding: return "Internal"
    case .unauthorized: return "Unauthorized"
    case .forbidden: return "Forbidden"
    case .error: return "Uncategorized"
    }
  }
  
  public var debugDescription: String {
    let base = "[\(self.code)] \(self.name)"
    switch self {
    case .responseDecoding(let response, let baseError):
      return "\(base)" +
             "\nFail to decode response body into Data Model" +
             "\ngot: \"\(String(data: response.data, encoding: .utf8) ?? "nil")\"" +
             "\nUnderlying error: \(baseError)"
    case .unauthorized(let response), .forbidden(let response), .error(let response):
      return "\(base)" +
             "\n\(response?.errors ?? "")"
    }
  }
}
