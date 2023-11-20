import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct PairsABTestMacro: MemberMacro {

  enum Error: Swift.Error {
    case shouldBeAppliedToStruct
    case couldNotIdentifyBody
  }


  public static func expansion(of node: SwiftSyntax.AttributeSyntax, providingMembersOf declaration: some SwiftSyntax.DeclGroupSyntax, in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.DeclSyntax] {
    guard let structDeclaration = declaration.as(StructDeclSyntax.self) else {
      throw Error.shouldBeAppliedToStruct
    }
    let innerDeclarations = structDeclaration
      .memberBlock
      .members
      .compactMap { $0.as(MemberBlockItemListSyntax.Element.self) }
      .compactMap { $0.as(MemberBlockItemSyntax.self)?.decl }
    guard innerDeclarations.isEmpty == false else {
      throw Error.couldNotIdentifyBody
    }
    let abTests = innerDeclarations.compactMap {
      return $0.as(EnumDeclSyntax.self) // All enums
    }
      .filter { $0.inheritanceClause?.inheritedTypes.contains(where: {
        "\($0)"
          .trimmingCharacters(in: .whitespaces.union(.init(charactersIn: ","))) == "ABTestType"
      }) == true
      }



    let abTestTypesString: String = abTests.map { "\($0.name).self" }.joined(separator: ",")
    return [
      SwiftSyntax.DeclSyntax(stringLiteral:
 """
   public static var allABTests: [any Entities.ABTestType.Type] {
[
 \(abTestTypesString)
]
   }
"""
                            )
    ]
  }
}

@main
struct PairsABTestPlugin: CompilerPlugin {
  let providingMacros: [Macro.Type] = [
    PairsABTestMacro.self,
  ]
}
