//
//  PrintStyleAlign.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-print-style-align type represents an empty element with print-style-align attribute
/// group.
public struct PrintStyleAlign {
    public let printStyle: PrintStyle
    public let hAlign: LeftCenterRight?
    public let vAlign: VAlign?

    public init(printStyle: PrintStyle = PrintStyle(), hAlign: LeftCenterRight? = nil, vAlign: VAlign? = nil) {
        self.printStyle = printStyle
        self.hAlign = hAlign
        self.vAlign = vAlign
    }
}

extension PrintStyleAlign: Equatable { }
extension PrintStyleAlign: Codable {
    private enum CodingKeys: String, CodingKey {
        case hAlign = "halign"
        case vAlign = "valign"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try self.printStyle.encode(to: encoder)
        try container.encodeIfPresent(hAlign, forKey: .hAlign)
        try container.encodeIfPresent(vAlign, forKey: .vAlign)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
        self.vAlign = try container.decodeIfPresent(VAlign.self, forKey: .vAlign)
        self.printStyle = try PrintStyle(from: decoder)
    }
}
