//
//  MeasureNumbering.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The measure-numbering type describes how frequently measure numbers are displayed on this part.
/// The number attribute from the measure element is used for printing.
public struct MeasureNumbering {

    public let value: MeasureNumberingValue
    public let printStyleAlign: PrintStyleAlign

    public init(
        _ value: MeasureNumberingValue,
        printStyleAlign: PrintStyleAlign = PrintStyleAlign()
    ) {
        self.value = value
        self.printStyleAlign = printStyleAlign
    }
}

extension MeasureNumbering: Equatable { }
extension MeasureNumbering: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
    }
    public init(from decoder: Decoder) throws {
        self.printStyleAlign = try PrintStyleAlign(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(MeasureNumberingValue.self, forKey: .value)
    }
    public func encode(to encoder: Encoder) throws {
        fatalError()
    }
}
