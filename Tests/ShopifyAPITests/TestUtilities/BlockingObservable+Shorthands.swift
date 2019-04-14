//
// Created by Arnon Keereena on 2019-04-14.
//

import Foundation
import RxSwift
import RxBlocking

public extension BlockingObservable {
  public func firstCatchError(_ message: String? = nil) -> E? {
    do {
      return try first()
    } catch {
      assert(false, "\(message ?? "Fail to blocked-get observable element") ::: \(error)")
    }
  }
  
  public func lastCatchError(_ message: String? = nil) -> E? {
    do {
      return try last()
    } catch {
      assert(false, "\(message ?? "Fail to blocked-get observable element") ::: \(error)")
    }
  }
  
  public func toArrayCatchError(_ message: String? = nil) -> [E] {
    do {
      return try toArray()
    } catch {
      assert(false, "\(message ?? "Fail to blocked-get observable element") ::: \(error)")
    }
  }
}
