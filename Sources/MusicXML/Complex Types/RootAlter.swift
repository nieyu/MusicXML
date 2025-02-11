//
//  RootAlter.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The root-alter type represents the chromatic alteration of the root of the current chord within
/// the harmony element. In some chord styles, the text for the root-step element may include
/// root-alter information. In that case, the print-object attribute of the root-alter element can
/// be set to no.
public struct RootAlter {

    // MARK: - Instance Propertes

    // MARK: Value

    public let value: Double

    // MARK: Attributes

    public let printObject: Bool?
    public let location: LeftRight?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: - Initializers

    public init(
        _ value: Double,
        printObject: Bool? = nil,
        printStyle: PrintStyle = PrintStyle(),
        location: LeftRight? = nil
    ) {
        self.value = value
        self.printObject = printObject
        self.printStyle = printStyle
        self.location = location
    }
}

extension RootAlter: Equatable { }
extension RootAlter: Codable {
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

extension RootAlter: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.init(value)
    }
}

extension RootAlter: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(Double(value))
    }
}
