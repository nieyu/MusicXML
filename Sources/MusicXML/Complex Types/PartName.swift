//
//  PartName.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The part-name type describes the name or abbreviation of a score-part element. Formatting
/// attributes for the part-name element are deprecated in Version 2.0 in favor of the new
/// part-name-display and part-abbreviation-display elements.
public struct PartName {

    // MARK: - Instance Properties

    // MARK: Value

    public var value: String

    // MARK: - Attributes

    public var printObject: Bool?
    public var justify: Justify?

    // MARK: - Attribute Groups

    public var printStyle: PrintStyle

    // MARK: - Initializers

    public init(
        _ value: String,
        printStyle: PrintStyle = PrintStyle(),
        printObject: Bool? = nil,
        justify: Justify? = nil
    ) {
        self.value = value
        self.printStyle = printStyle
        self.printObject = printObject
        self.justify = justify
    }
}

extension PartName: Equatable { }
extension PartName: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
        case printObject = "print-object"
        case justify
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(String.self, forKey: .value)
        self.printStyle = try PrintStyle(from: decoder)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        self.justify = try container.decodeIfPresent(Justify.self, forKey: .justify)
    }
}

extension PartName: ExpressibleByStringLiteral {

    // MARK: - ExpressibleByStringLiteral

    public init(stringLiteral value: String) {
        self.init(value)
    }
}
