//
//  DegreeType.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The degree-type type indicates if this degree is an addition, alteration, or subtraction
/// relative to the kind of the current chord. The value of the degree-type element affects the
/// interpretation of the value of the degree-alter element. The text attribute specifies how the
/// type of the degree should be displayed in a score.
public struct DegreeType {

    // MARK: - Instance Propertie

    // MARK: Value

    let value: DegreeTypeValue

    // MARK: Attributes

    let text: String?

    // MARK: Attribute Groups

    let printStyle: PrintStyle

    // MARK: - Initializers

    public init(
        _ value: DegreeTypeValue,
        text: String? = nil,
        printStyle: PrintStyle = PrintStyle()
    ) {
        self.value = value
        self.text = text
        self.printStyle = printStyle
    }
}

extension DegreeType {

    // MARK: - Type Properties

    public static let add = DegreeType(.add)
    public static let alter = DegreeType(.alter)
    public static let subtract = DegreeType(.subtract)
}

extension DegreeType: Equatable { }
extension DegreeType: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
        case text
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.printStyle = try PrintStyle(from: decoder)
        self.value = try container.decode(DegreeTypeValue.self, forKey: .value)
    }
}
