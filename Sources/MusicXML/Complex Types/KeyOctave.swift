//
//  KeyOctave.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

import XMLCoder

/// The key-octave element specifies in which octave an element of a key signature appears.
public struct KeyOctave {

    // MARK: - Value

    /// The content specifies the octave value using the same values as the display-octave element.
    public let value: Int

    // MARK: - Attributes

    /// The number attribute is a positive integer that refers to the key signature element in
    /// left-to-right order.
    public let number: Int
    /// If the cancel attribute is set to yes, then this number refers to an element specified by
    /// the cancel element. It is no by default.
    public let cancel: Bool
}

extension KeyOctave {

    // MARK: - Initializers

    public init(_ value: Int, number: Int, cancel: Bool = false) {
        self.value = value
        self.number = number
        self.cancel = cancel
    }
}

extension KeyOctave: Equatable { }
extension KeyOctave: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(Int.self, forKey: .value)
        self.number = try container.decode(Int.self, forKey: .number)
        self.cancel = try container.decodeIfPresent(Bool.self, forKey: .cancel) ?? false
    }
}
