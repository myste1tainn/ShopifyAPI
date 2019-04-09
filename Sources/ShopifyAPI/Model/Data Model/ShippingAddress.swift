//
// Created by Arnon Keereena on 2019-04-08.
//

import Foundation

public struct ShippingAddress: Decodable {
  public var firstName: String?
  public var address1: String?
  public var phone: String?
  public var city: String?
  public var zip: String?
  public var province: String?
  public var country: String?
  public var lastName: String?
  public var address2: String?
  public var company: String?
  public var latitude: Int?
  public var longitude: Int?
  public var name: String?
  public var countryCode: String?
  public var provinceCode: String?
  
  enum CodingKeys: String, CodingKey {
    case firstName = "first_name"
    case address1 = "address1"
    case phone = "phone"
    case city = "city"
    case zip = "zip"
    case province = "province"
    case country = "country"
    case lastName = "last_name"
    case address2 = "address2"
    case company = "company"
    case latitude = "latitude"
    case longitude = "longitude"
    case name = "name"
    case countryCode = "country_code"
    case provinceCode = "province_code"
  }
}
