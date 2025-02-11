//
//  BassAlter.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The bass-alter type represents the chromatic alteration of the bass of the current chord within
/// the harmony element.
public struct BassAlter {
    public let value: Double
    public let printObject: Bool?
    public let printStyle: PrintStyle?
    public let location: LeftRight?

    public init(_ value: Double, printObject: Bool? = nil, printStyle: PrintStyle = PrintStyle(), location: LeftRight? = nil) {
        self.value = value
        self.printObject = printObject
        self.printStyle = printStyle
        self.location = location
    }
}

extension BassAlter: Equatable { }
extension BassAlter: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
        case printObject = "print-object"
        case location
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(Double.self, forKey: .value)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        self.printStyle = try PrintStyle(from: decoder)
        self.location = try container.decodeIfPresent(LeftRight.self, forKey: .location)
    }
}

extension BassAlter: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.init(value)
    }
}
