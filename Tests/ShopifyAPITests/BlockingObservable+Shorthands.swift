//
// Created by Arnon Keereena on 2019-04-14.
//

import Foundation
import RxSwift
import RxBlocking
import XCTest

public extension BlockingObservable {
  public func firstCatchError(_ message: String? = nil) -> E? {
    do {
      return try first()
    } catch {
//      assert(false, "\(message ?? "Fail to blocked-get observable element") ::: \(error)")
      XCTAssert(false, "\(message ?? "Fail to blocked-get observable element") ::: \(error)")
      return nil
    }
  }
  
  public func lastCatchError(_ message: String? = nil) -> E? {
    do {
      return try last()
    } catch {
//      assert(false, "\(message ?? "Fail to blocked-get observable element") ::: \(error)")
      XCTAssert(false, "\(message ?? "Fail to blocked-get observable element") ::: \(error)")
      return nil
    }
  }
  
  public func toArrayCatchError(_ message: String? = nil) -> [E] {
    do {
      return try toArray()
    } catch {
//      assert(false, "\(message ?? "Fail to blocked-get observable element") ::: \(error)")
      XCTAssert(false, "\(message ?? "Fail to blocked-get observable element") ::: \(error)")
      return []
    }
  }
}
