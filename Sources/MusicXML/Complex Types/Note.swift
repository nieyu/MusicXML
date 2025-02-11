//
//  Note.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Notes are the most common type of MusicXML data. The MusicXML format keeps the MuseData
/// distinction between elements used for sound information and elements used for notation
/// information (e.g., tie is used for sound, tied for notation). Thus grace notes do not have a
/// duration element. Cue notes have a duration element, as do forward elements, but no tie
/// elements. Having these two types of information available can make interchange considerably
/// easier, as some programs handle one type of information much more readily than the other.
public struct Note {

    // MARK: - Instance Properties

    // MARK: Kind

    public let kind: Kind

    // MARK: Elements

    public let instrument: Instrument?
    public let footnote: FormattedText?
    public let level: Level?
    public let voice: String?
    public let type: NoteType?
    public let dots: [PlacementPrintStyle]?
    public let accidental: Accidental?
    public let timeModification: TimeModification?
    public let stem: Stem?
    public let notehead: Notehead?
    public let noteheadText: NoteheadText?
    public let staff: Int?
    public let beams: [Beam]? // Up to 8
    public let notations: Notations?
    public let lyrics: [Lyric]
    public let play: Play?

    // MARK: Attributes

    public let printObject: Bool?
    public let printDot: Bool?
    public let printSpacing: Bool?
    public let printLyric: Bool?
    public let dynamics: Double?
    public let endDynamics: Double?
    public let attack: Divisions?
    public let release: Divisions?
    public let timeOnly: TimeOnly?
    public let pizzicato: Bool?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    public init(
        kind: Kind,
        printStyle: PrintStyle = PrintStyle(),
        printObject: Bool? = nil,
        printDot: Bool? = nil,
        printSpacing: Bool? = nil,
        printLyric: Bool? = nil,
        dynamics: Double? = nil,
        endDynamics: Double? = nil,
        attack: Divisions? = nil,
        release: Divisions? = nil,
        timeOnly: TimeOnly? = nil,
        pizzicato: Bool? = nil,
        instrument: Instrument? = nil,
        footnote: FormattedText? = nil,
        level: Level? = nil,
        voice: String? = nil,
        type: NoteType? = nil,
        dots: [PlacementPrintStyle]? = nil,
        accidental: Accidental? = nil,
        timeModification: TimeModification? = nil,
        stem: Stem? = nil,
        notehead: Notehead? = nil,
        noteheadText: NoteheadText? = nil,
        staff: Int? = nil,
        beams: [Beam]? = nil,
        notations: Notations? = nil,
        lyrics: [Lyric] = [],
        play: Play? = nil
    ) {
        self.kind = kind
        self.printStyle = printStyle
        self.printObject = printObject
        self.printDot = printDot
        self.printSpacing = printSpacing
        self.printLyric = printLyric
        self.dynamics = dynamics
        self.endDynamics = endDynamics
        self.attack = attack
        self.release = release
        self.timeOnly = timeOnly
        self.pizzicato = pizzicato
        self.instrument = instrument
        self.footnote = footnote
        self.level = level
        self.voice = voice
        self.type = type
        self.dots = dots
        self.accidental = accidental
        self.timeModification = timeModification
        self.stem = stem
        self.notehead = notehead
        self.noteheadText = noteheadText
        self.staff = staff
        self.beams = beams
        self.notations = notations
        self.lyrics = lyrics
        self.play = play
    }
}

extension Note {

    // MARK: - Initializers

    // MARK: Normal

    /// Creates a pitched, normal `Note`.
    public init(
        pitch: Pitch,
        duration: Int,
        ties: Ties = Ties(),
        isChord: Bool = false,
        printStyle: PrintStyle = PrintStyle(),
        printObject: Bool? = nil,
        printDot: Bool? = nil,
        printSpacing: Bool? = nil,
        printLyric: Bool? = nil,
        dynamics: Double? = nil,
        endDynamics: Double? = nil,
        attack: Divisions? = nil,
        release: Divisions? = nil,
        timeOnly: TimeOnly? = nil,
        pizzicato: Bool? = nil,
        instrument: Instrument? = nil,
        footnote: FormattedText? = nil,
        level: Level? = nil,
        voice: String? = nil,
        type: NoteType? = nil,
        dots: [PlacementPrintStyle]? = nil,
        accidental: Accidental? = nil,
        timeModification: TimeModification? = nil,
        stem: Stem? = nil,
        notehead: Notehead? = nil,
        noteheadText: NoteheadText? = nil,
        staff: Int? = nil,
        beams: [Beam]? = nil,
        notations: Notations? = nil,
        lyrics: [Lyric] = [],
        play: Play? = nil
    ) {
        self.kind = .normal(
            Note.Normal(.pitch(pitch), duration: duration, ties: ties, isChord: isChord)
        )
        self.printStyle = printStyle
        self.printObject = printObject
        self.printDot = printDot
        self.printSpacing = printSpacing
        self.printLyric = printLyric
        self.dynamics = dynamics
        self.endDynamics = endDynamics
        self.attack = attack
        self.release = release
        self.timeOnly = timeOnly
        self.pizzicato = pizzicato
        self.instrument = instrument
        self.footnote = footnote
        self.level = level
        self.voice = voice
        self.type = type
        self.dots = dots
        self.accidental = accidental
        self.timeModification = timeModification
        self.stem = stem
        self.notehead = notehead
        self.noteheadText = noteheadText
        self.staff = staff
        self.beams = beams
        self.notations = notations
        self.lyrics = lyrics
        self.play = play
    }
}

extension Note {

    // MARK: Kinds of `Note`

    public struct Normal {
        public let isChord: Bool
        public let pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public let duration: Int
        public let ties: Ties

        public init(
            _ pitchUnpitchedOrRest: PitchUnpitchedOrRest,
            duration: Int,
            ties: Ties = Ties(),
            isChord: Bool = false
        ) {
            self.isChord = isChord
            self.pitchUnpitchedOrRest = pitchUnpitchedOrRest
            self.duration = duration
            self.ties = ties
        }
    }

    public struct Cue {
        public let isChord: Bool
        public let pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public let duration: Int

        public init(
            _ pitchUnpitchedOrRest: PitchUnpitchedOrRest,
            duration: Int,
            isChord: Bool = false
        ) {
            self.isChord = isChord
            self.pitchUnpitchedOrRest = pitchUnpitchedOrRest
            self.duration = duration
        }
    }

    public struct Grace {
        public let isChord: Bool
        public let pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public let ties: Ties

        public init(
            _ pitchUnpitchedOrRest: PitchUnpitchedOrRest,
            ties: Ties = Ties(),
            chord: Bool = false
        ) {
            self.isChord = chord
            self.pitchUnpitchedOrRest = pitchUnpitchedOrRest
            self.ties = ties
        }
    }

    public enum Kind: Equatable {
        case normal(Normal)
        case cue(Cue)
        case grace(Grace)
    }
}

extension Note.Normal: Equatable { }
extension Note.Cue: Equatable { }
extension Note.Grace: Equatable { }

extension Note: Equatable { }
extension Note: Codable {
    enum CodingKeys: String, CodingKey {
        // Attributes
        case printStyle = "print-style"
        case printObject = "print-object"
        case printDot = "print-dot"
        case printSpacing = "print-spacing"
        case printLyric = "print-lyric"
        case dynamics
        case endDynamics = "end-dynamics"
        case attack
        case release
        case timeOnly = "time-only"
        case pizzicato
        // Elements
        case instrument
        case footnote
        case level
        case voice
        case type
        case dots = "dot"
        case accidental
        case timeModification = "time-modification"
        case stem
        case notehead
        case noteheadText
        case staff
        case beams = "beam"
        case notations
        case lyrics = "lyric"
        case play
        // Normal Note, Cue and Grace
        case grace
        case cue
        case chord
        case duration
        case tie
        // Kind
        case pitch
        case rest
        case unpitched
    }

    public init(from decoder: Decoder) throws {

        // Decode attribute groups
        self.printStyle = try PrintStyle(from: decoder)

        // Decode attributes
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        self.printDot = try container.decodeIfPresent(Bool.self, forKey: .printDot)
        self.printSpacing = try container.decodeIfPresent(Bool.self, forKey: .printSpacing)
        self.printLyric = try container.decodeIfPresent(Bool.self, forKey: .printLyric)
        self.dynamics = try container.decodeIfPresent(Double.self, forKey: .dynamics)
        self.endDynamics = try container.decodeIfPresent(Double.self, forKey: .endDynamics)
        self.attack = try container.decodeIfPresent(Divisions.self, forKey: .attack)
        self.release = try container.decodeIfPresent(Divisions.self, forKey: .release)
        self.timeOnly = try container.decodeIfPresent(TimeOnly.self, forKey: .timeOnly)
        self.pizzicato = try container.decodeIfPresent(Bool.self, forKey: .pizzicato)

        // Decode elements
        self.instrument = try container.decodeIfPresent(Instrument.self, forKey: .instrument)
        self.footnote = try container.decodeIfPresent(FormattedText.self, forKey: .footnote)
        self.level = try container.decodeIfPresent(Level.self, forKey: .level)
        self.voice = try container.decodeIfPresent(String.self, forKey: .voice)
        self.type = try container.decodeIfPresent(NoteType.self, forKey: .type)
        self.dots = try container.decodeIfPresent([PlacementPrintStyle].self, forKey: .dots)
        self.accidental = try container.decodeIfPresent(Accidental.self, forKey: .accidental)
        self.timeModification = try container.decodeIfPresent(TimeModification.self, forKey: .timeModification)
        self.stem = try container.decodeIfPresent(Stem.self, forKey: .stem)
        self.notehead = try container.decodeIfPresent(Notehead.self, forKey: .notehead)
        self.noteheadText = try container.decodeIfPresent(NoteheadText.self, forKey: .noteheadText)
        self.staff = try container.decodeIfPresent(Int.self, forKey: .staff)
        self.beams = try container.decodeIfPresent([Beam].self, forKey: .beams)
        self.notations = try container.decodeIfPresent(Notations.self, forKey: .notations)
        self.lyrics = try container.decode([Lyric].self, forKey: .lyrics)
        self.play = try container.decodeIfPresent(Play.self, forKey: .play)

        // Decode kind

        // Only `normal` and `grace` notes have ties, so defer `Tie` parsing and initialization
        // until we know we need them.
        func ties() throws -> Ties {
            return Ties(ties: try container.decode([Tie].self, forKey: .tie))
        }

        // Only `normal` and `cue` notes have durations, so defer `duration` parsing until we know
        // we need it.
        func duration() throws -> Int {
            return try container.decode(Int.self, forKey: .duration)
        }

        // The `Note` is a chord if it contains an empty `<chord/>` element.
        let isChord = container.contains(.chord)

        // Decode pitch / unpitched / rest
        let pitchUnpitchedOrRest: PitchUnpitchedOrRest
        if container.contains(.pitch) {
            let pitch = try container.decode(Pitch.self, forKey: .pitch)
            pitchUnpitchedOrRest = .pitch(pitch)
        } else if container.contains(.rest) {
            let rest = try container.decode(Rest.self, forKey: .rest)
            pitchUnpitchedOrRest =  .rest(rest)
        } else {
            let unpitched = try container.decode(Unpitched.self, forKey: .unpitched)
            pitchUnpitchedOrRest = .unpitched(unpitched)
        }

        if container.contains(.grace) {
            self.kind = .grace(
                Note.Grace(pitchUnpitchedOrRest, ties: try ties(), chord: isChord)
            )
        } else if container.contains(.cue) {
            self.kind = .cue(
                Note.Cue(pitchUnpitchedOrRest, duration: try duration(), isChord: isChord)
            )
        } else {
            self.kind = .normal(
                Normal(pitchUnpitchedOrRest,
                    duration: try duration(),
                    ties: try ties(),
                    isChord: isChord
                )
            )
        }
    }
    public func encode(to encoder: Encoder) throws {
        fatalError("TODO: Note.encode(to:)")
    }
}
