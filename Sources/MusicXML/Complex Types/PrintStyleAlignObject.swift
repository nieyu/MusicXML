//
//  PrintStyleAlignObject.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The empty-print-style-align-object type represents an empty element with print-object and
/// print-style-align attribute groups.
public struct PrintStyleAlignObject {
    public let printObject: Bool?
    public let printStyleAlign: PrintStyleAlign?

    public init(printObject: Bool? = nil, printStyleAlign: PrintStyleAlign? = nil) {
        self.printObject = printObject
        self.printStyleAlign = printStyleAlign
    }
}

extension PrintStyleAlignObject: Equatable { }
extension PrintStyleAlignObject: Codable { }
