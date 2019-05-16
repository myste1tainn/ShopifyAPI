//
// Created by Arnon Keereena on 2019-04-11.
//

import Foundation
import RxNetworking

public struct ErrorResponse: Swift.Error, Decodable, CustomStringConvertible, CustomDebugStringConvertible {
  var errors: String?
  
  enum CodingKeys: String, CodingKey {
    case errors = "errors"
  }
  
  public var description: String  {
    return errors ?? "nil"
  }
  
  public var debugDescription: String  {
    return errors ?? "nil"
  }
}
