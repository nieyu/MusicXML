//
//  HarpPedals.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The harp-pedals type is used to create harp pedal diagrams. The pedal-step and pedal-alter
/// elements use the same values as the step and alter elements. For easiest reading, the
/// pedal-tuning elements should follow standard harp pedal order, with pedal-step values of D, C,
/// B, E, F, G, and A.
public struct HarpPedals {

    // MARK: - Instance Properties

    // MARK: Attribute Groups

    public let printStyleAlign: PrintStyleAlign

    // MARK: - Elements

    public let pedalTunings: [PedalTuning]

    public init(_ pedalTunings: [PedalTuning], printStyleAlign: PrintStyleAlign = PrintStyleAlign()) {
        precondition(!pedalTunings.isEmpty)
        self.printStyleAlign = printStyleAlign
        self.pedalTunings = pedalTunings
    }
}

extension HarpPedals: Equatable { }
extension HarpPedals: Codable {
    private enum CodingKeys: String, CodingKey {
        case pedalTunings = "pedal-tuning"
    }

    public init(from decoder: Decoder) throws {

        // Decode attribute groups
        self.printStyleAlign = try PrintStyleAlign(from: decoder)

        // Decode elements
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pedalTunings = try container.decode([PedalTuning].self, forKey: .pedalTunings)
    }
}
