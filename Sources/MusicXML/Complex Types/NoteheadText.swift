//
//  NoteheadText.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

import XMLCoder

public struct NoteheadText {
    public enum Kind {
        case displayText(FormattedText)
        case accidentalText(AccidentalText)
    }
    public let values: [Kind] // NonEmpty

    public init(_ values: [Kind]) {
        self.values = values
    }
}

extension NoteheadText.Kind: Equatable { }
extension NoteheadText.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case displayText
        case accidentalText
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .displayText(value):
            try container.encode(value, forKey: .displayText)
        case let .accidentalText(value):
            try container.encode(value, forKey: .accidentalText)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.displayText) {
            self = .displayText(try decode(.displayText))
        } else if container.contains(.accidentalText) {
            self = .accidentalText(try decode(.accidentalText))
        } else {
            throw DecodingError.typeMismatch(
                NoteheadText.Kind.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension NoteheadText.Kind.CodingKeys: XMLChoiceCodingKey { }

extension NoteheadText: Equatable { }
extension NoteheadText: Codable { }
