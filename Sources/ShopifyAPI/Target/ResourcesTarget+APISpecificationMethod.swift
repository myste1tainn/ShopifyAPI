//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation
import Moya

extension ResourcesTarget {
  public enum APISpecificationMethod {
    case getCount
    case get
    case post
    case put(id: String)
    case patch(id: String)
    case delete(id: String)
    
    public var method: Moya.Method {
      switch self {
      case .get, .getCount: return .get
      case .post: return .post
      case .put: return .put
      case .patch: return .patch
      case .delete: return .delete
      }
    }
  }
}
