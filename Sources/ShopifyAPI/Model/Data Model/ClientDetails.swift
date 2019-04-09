//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation

public struct ClientDetails: Decodable {
  public var browserIp: String?
  public var acceptLanguage: String?
  public var userAgent: String?
  public var sessionHash: String?
  public var browserWidth: Int?
  public var browserHeight: Int?
  
  enum CodingKeys: String, CodingKey {
    case browserIp = "browser_ip"
    case acceptLanguage = "accept_language"
    case userAgent = "user_agent"
    case sessionHash = "session_hash"
    case browserWidth = "browser_width"
    case browserHeight = "browser_height"
  }
}
