//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation
import RxNetworking

public protocol PartialTargetType {
  /// The path to be appended to `baseURL` to form the full `URL`.
  var path: String { get }
  
  var method: HTTPMethod { get }
}

