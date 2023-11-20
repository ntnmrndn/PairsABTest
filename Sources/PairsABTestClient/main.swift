import PairsABTest
import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros

enum Entities {}
public protocol EnclosingRawValueTraitType {}


// MARK: - Entities.ABTestType

protocol _Entities_ABTestType: Sendable, Hashable, CaseIterable, RawRepresentable where RawValue == Int {

  static var code: Entities.ABTest.Code { get }
}

public struct EnclosingRawValue<RawValue: Hashable, Trait: EnclosingRawValueTraitType>: Hashable {

  public let rawValue: RawValue

  public init(_ rawValue: RawValue) {
    self.rawValue = rawValue
  }

}

// MARK: - Entities



extension Entities {

  public typealias ABTestType = _Entities_ABTestType

  // MARK: - ABTest

  @PairsABTestMacro
  public struct ABTest: EnclosingRawValueTraitType {

    public static let shared: Self = .init()

    public typealias Code = EnclosingRawValue<String, ABTest>

    // MARK: -

    public enum GGGG: Int, ABTestType {

      public static let code: Code = .init("GGGG")

      /// meta: change nothing
      case control = 0
      /// meta:
      case vvvv = 1
    }

    public var vvv: GGGG  {
      .vvvv
    }


    // MARK: -

    public enum VVVV: Int, ABTestType {

      public static let code: Code = .init("dddd")

      /// meta: change nothing
      case control = 0
      /// meta:
      case ffff = 1
    }

    public var wwww: VVVV  {
      .ffff
    }


    // MARK: -

    /// NOTE:
    public enum FFF: Int, ABTestType {

      public static let code: Code = .init("ssss")

      /// meta: change nothing
      case control = 0
      /// meta:
      case dddddd = 1
    }

    public var ddd: FFF  {
      .dddddd
    }


    // MARK: - DQWDQWDQW

    public enum DQWDQWDQW: Int, ABTestType {

      public static let code: Code = .init("qweqweqw")

      /// meta:
      case control = 0
      /// meta:
      case awdawdawdawdddd = 1
    }

    public var awdawdawdawdaw: DQWDQWDQW  {
      .awdawdawdawdddd
    }


    // MARK: -

    public enum QGEGQEGQEGFQEGQEF: Int, ABTestType {

      public static let code: Code = .init("dqwdqwdqw")

      /// meta: s
      case control = 0
      /// meta:
      case fgqewfqfqwfqw = 1
    }

    public var dwqdqwdq: QGEGQEGQEGFQEGQEF  {
      .fgqewfqfqwfqw
    }


    // MARK: -

    public enum FQWFQWFQWDFQW: Int, ABTestType {

      public static let code: Code = .init("wqdqwdqwdqw")

      /// meta: change nothing
      case control = 0
      /// meta:
      case dqwdqwdqwdqwd = 1
    }

    public var qwdqwdqwdqw: FQWFQWFQWDFQW  {
      .dqwdqwdqwdqwd
    }


    // MARK: - qwdqwd

    public enum dqwdqwdqwdq: Int, ABTestType, CaseIterable {

      public static let code: Code = .init("dqw")

      /// meta: change nothing
      case control = 0
      /// meta:
      case fff = 1
    }

    public var fff: dqwdqwdqwdq  {
      .fff
    }


    // MARK: -

    public enum XXXX: Int, ABTestType {

      public static let code: Code = .init("ddddd")

      /// meta: change nothing
      case control = 0
      /// meta:
      case dddddd = 1
    }

    public var dddddc: XXXX  {
      .dddddd
    }
  }
}
