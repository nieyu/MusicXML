//
//  MIDIInstrument.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

import XMLCoder

/// The midi-instrument type defines MIDI 1.0 instrument playback. The midi-instrument element can
/// be a part of either the score-instrument element at the start of a part, or the sound element
/// within a part. The id attribute refers to the score-instrument affected by the change.
public struct MIDIInstrument {

    // MARK: - Instance Properties

    // MARK: Attributes

    public var id: String

    // MARK: Elements

    /// The midi-channel element specifies a MIDI 1.0 channel number ranging from 1 to 16.
    public var channel: Int?
    /// The midi-name element corresponds to a ProgramName meta-event within a Standard MIDI File.
    public var name: String?
    /// The midi-bank element specified a MIDI 1.0 bank number ranging from 1 to 16,384.
    public var bank: Int?
    /// The midi-program element specifies a MIDI 1.0 program number ranging from 1 to 128.
    public var program: Int?
    /// For unpitched instruments, the midi-unpitched element specifies a MIDI 1.0 note number
    /// ranging from 1 to 128. It is usually used with MIDI banks for percussion. Note that MIDI 1.0
    /// note numbers are generally specified from 0 to 127 rather than the 1 to 128 numbering used
    /// in this element.
    public var unpitched: Int?
    /// The volume element value is a percentage of the maximum ranging from 0 to 100, with decimal
    /// values allowed. This corresponds to a scaling value for the MIDI 1.0 channel volume
    /// controller.
    public var volume: Double?
    /// The pan and elevation elements allow placing of sound in a 3-D space relative to the
    /// listener. Both are expressed in degrees ranging from -180 to 180. For pan, 0 is straight
    /// ahead, -90 is hard left, 90 is hard right, and -180 and 180 are directly behind the
    /// listener.
    public var pan: Int?
    /// The elevation and pan elements allow placing of sound in a 3-D space relative to the
    /// listener. Both are expressed in degrees ranging from -180 to 180. For elevation, 0 is level
    /// with the listener, 90 is directly above, and -90 is directly below.
    public var elevation: Int?

    // MARK: - Initializers

    public init(
        id: String,
        channel: Int? = nil,
        name: String? = nil,
        bank: Int? = nil,
        program: Int? = nil,
        unpitched: Int? = nil,
        volume: Double? = nil,
        pan: Int? = nil,
        elevation: Int? = nil
    ) {
        self.id = id
        self.channel = channel
        self.name = name
        self.bank = bank
        self.program = program
        self.unpitched = unpitched
        self.volume = volume
        self.pan = pan
        self.elevation = elevation
    }
}

extension MIDIInstrument: Equatable { }
extension MIDIInstrument: Codable {

    enum CodingKeys: String, CodingKey {
        case id
        case channel = "midi-channel"
        case name = "midi-name"
        case bank = "midi-bank"
        case program = "midi-program"
        case unpitched = "midi-unpitched"
        case volume
        case pan
        case elevation
    }
}

extension MIDIInstrument: DynamicNodeDecoding {
    public static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
        switch key {
        case CodingKeys.id:
            return .attribute
        default:
            return .element
        }
    }
}

extension MIDIInstrument: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.id:
            return .attribute
        default:
            return .element
        }
    }
}
