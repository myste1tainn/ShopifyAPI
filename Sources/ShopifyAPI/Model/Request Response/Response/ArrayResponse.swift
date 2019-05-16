//
// Created by Arnon Keereena on 2019-04-14.
//

import Foundation

public struct ArrayResponse<T>: Decodable where T: Decodable & ArrayResponseKeyable {
  public internal(set) var items: [T]?
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.items = try container.decode([T].self, forKey: .root(value: T.key))
  }
  
  enum CodingKeys: CodingKey {
    case root(value: String)
    
    init?(stringValue: String) {
      self = .root(value: stringValue)
    }
    
    var intValue: Int? {
      switch self {
      case .root(let string): return Int(string)
      }
    }
    
    init?(intValue: Int) {
      self = .root(value: "\(intValue)")
    }
    
    var stringValue: String {
      switch self {
      case .root(let string): return string
      }
    }
    
  }
}
