//
//  Stick.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The stick type represents pictograms where the material of the stick, mallet, or beater is
/// included.
public struct Stick {
    public let tip: TipDirection?
    public let stickType: StickType
    public let stickMaterial: StickMaterial

    public init(tip: TipDirection? = nil, stickType: StickType, stickMaterial: StickMaterial) {
        self.tip = tip
        self.stickType = stickType
        self.stickMaterial = stickMaterial
    }
}

extension Stick: Equatable { }
extension Stick: Codable { }
