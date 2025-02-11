//
//  PlacementText.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The placement-text type represents a text element with print-style and placement attribute
/// groups.
public struct PlacementText {

    // MARK: - Instance Properties

    // MARK: Value

    public let value: String

    // MARK: One-off Attributes

    public let placement: AboveBelow?

    // MARK: Attribute Groups

    public let position: Position
    public let printStyle: PrintStyle

    // MARK: - Initializers

    public init(
        _ value: String = "",
        placement: AboveBelow? = nil,
        position: Position = Position(),
        printStyle: PrintStyle = PrintStyle()
    ) {
        self.value = value
        self.placement = placement
        self.position = position
        self.printStyle = printStyle
    }
}

extension PlacementText: Equatable { }
extension PlacementText: Codable {

    public init(from decoder: Decoder) throws {
        // Decode attribute groups
        self.position = try Position(from: decoder)
        self.printStyle = try PrintStyle(from: decoder)
        // Decode one-off attributes
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        // Decode value
        self.value = try container.decode(String.self, forKey: .value)
    }
}
