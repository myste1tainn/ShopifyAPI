//
// Created by Arnon Keereena on 2019-04-09.
//

import Foundation

public struct AccessToken: Decodable {
  var accessToken: String?
  var scope: String?
  
  enum CodingKeys: String, CodingKey {
    case accessToken = "access_token"
    case scope = "scope"
  }
}
