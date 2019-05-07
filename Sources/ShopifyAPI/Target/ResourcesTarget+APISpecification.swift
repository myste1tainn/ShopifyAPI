//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation
import RxNetworking

extension ResourcesTarget {
  
  public struct APISpecification: PartialTargetType {
    public let shop: String
    let resourceName: APIResourceName
    let specMethod: APISpecificationMethod
    
    init(shop: String, resourceName: APIResourceName, method: APISpecificationMethod) {
      self.shop = shop
      self.resourceName = resourceName
      self.specMethod = method
    }
    
    public var path: String {
      switch specMethod {
      case .get: return "\(resourceName.rawValue).json"
      case .getCount: return "\(resourceName.rawValue)/count.json"
      case .post: return "\(resourceName.rawValue).json"
      case .put(let id): return "\(resourceName.rawValue)/\(id).json"
      case .patch(let id): return "\(resourceName.rawValue)/\(id).json"
      case .delete(let id): return "\(resourceName.rawValue)/\(id).json"
      }
    }
    
    public var method: HTTPMethod {
      return specMethod.method
    }
  }
}

