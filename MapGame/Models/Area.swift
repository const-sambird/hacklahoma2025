//
//  Area.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import SwiftUI
import MapKit

struct Area: Codable, Identifiable {
    let vertices: [Coordinate]
    let id: UUID
    var isDiscovered: Bool
    let name: String
    let desc: String
    
    var mapOpacity: Double {
        if isDiscovered {
            return 0.3
        } else {
            return 1
        }
    }
    
    init(id: UUID = UUID(), name: String, desc: String, vertices: [Coordinate], discovered: Bool = false) {
        self.id = id
        self.name = name
        self.desc = desc
        self.vertices = vertices
        self.isDiscovered = discovered
    }
    
    func asMapCoords() -> [CLLocationCoordinate2D] {
        var coordinates: [CLLocationCoordinate2D] = []
        for vertex in vertices {
            coordinates.append(CLLocationCoordinate2D(latitude: vertex.latitude, longitude: vertex.longitude))
        }
        return coordinates
    }
    
    func containsPoint(point: CLLocationCoordinate2D) -> Bool {
        false
    }
}

extension Area {
    static var sample: [Area] = [
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2009042, longitude: -97.4470761),
            Coordinate(latitude: 35.1997689, longitude: -97.4470868),
            Coordinate(latitude: 35.1997733, longitude: -97.4442544),
            Coordinate(latitude: 35.2008779, longitude: -97.4443724),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2009086, longitude: -97.4470949),
            Coordinate(latitude: 35.200913, longitude: -97.4442651),
            Coordinate(latitude: 35.2021033, longitude: -97.4442602),
            Coordinate(latitude: 35.2021033, longitude: -97.4470926),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2074818, longitude: -97.4412851),
            Coordinate(latitude: 35.2074839, longitude: -97.4434239),
            Coordinate(latitude: 35.2064604, longitude: -97.4434964),
            Coordinate(latitude: 35.2063837, longitude: -97.4441025),
            Coordinate(latitude: 35.2062676, longitude: -97.4442554),
            Coordinate(latitude: 35.2038875, longitude: -97.4442527),
            Coordinate(latitude: 35.2038765, longitude: -97.4412835),
            Coordinate(latitude: 35.2047028, longitude: -97.4412916),
            Coordinate(latitude: 35.2048891, longitude: -97.4412245),
            Coordinate(latitude: 35.2051926, longitude: -97.4409724),
            Coordinate(latitude: 35.2053635, longitude: -97.4409281),
            Coordinate(latitude: 35.2063585, longitude: -97.4409188),
            Coordinate(latitude: 35.2064845, longitude: -97.4409469),
            Coordinate(latitude: 35.2065941, longitude: -97.4410032),
            Coordinate(latitude: 35.2068122, longitude: -97.4411762),
            Coordinate(latitude: 35.2069656, longitude: -97.4412581),
            Coordinate(latitude: 35.2071042, longitude: -97.4412869),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2038875, longitude: -97.4442473),
            Coordinate(latitude: 35.2021033, longitude: -97.4470926),
            Coordinate(latitude: 35.2021033, longitude: -97.4442602),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2038875, longitude: -97.4442473),
            Coordinate(latitude: 35.2074543, longitude: -97.4442246),
            Coordinate(latitude: 35.2074908, longitude: -97.4479153),
            Coordinate(latitude: 35.2038922, longitude: -97.447926),
            Coordinate(latitude: 35.2038984, longitude: -97.4470647),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2038875, longitude: -97.4442473),
            Coordinate(latitude: 35.202554, longitude: -97.444257),
            Coordinate(latitude: 35.2025584, longitude: -97.4438908),
            Coordinate(latitude: 35.2026022, longitude: -97.4432859),
            Coordinate(latitude: 35.2026779, longitude: -97.4431733),
            Coordinate(latitude: 35.2027918, longitude: -97.4431746),
            Coordinate(latitude: 35.2028148, longitude: -97.4428984),
            Coordinate(latitude: 35.2028346, longitude: -97.4423713),
            Coordinate(latitude: 35.2028262, longitude: -97.4413358),
            Coordinate(latitude: 35.2038765, longitude: -97.4412781),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2028262, longitude: -97.4413358),
            Coordinate(latitude: 35.2025068, longitude: -97.4413175),
            Coordinate(latitude: 35.2025068, longitude: -97.4401883),
            Coordinate(latitude: 35.2038831, longitude: -97.4401749),
            Coordinate(latitude: 35.2038765, longitude: -97.4412781),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2025068, longitude: -97.4413175),
            Coordinate(latitude: 35.2028262, longitude: -97.4413358),
            Coordinate(latitude: 35.2028337, longitude: -97.4422511),
            Coordinate(latitude: 35.2013175, longitude: -97.4422516),
            Coordinate(latitude: 35.201311, longitude: -97.4413075),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2008731, longitude: -97.4422516),
            Coordinate(latitude: 35.2028337, longitude: -97.4422511),
            Coordinate(latitude: 35.2028346, longitude: -97.4423713),
            Coordinate(latitude: 35.2028148, longitude: -97.4428984),
            Coordinate(latitude: 35.2027918, longitude: -97.4431746),
            Coordinate(latitude: 35.2026779, longitude: -97.4431733),
            Coordinate(latitude: 35.2026022, longitude: -97.4432859),
            Coordinate(latitude: 35.202554, longitude: -97.444257),
            Coordinate(latitude: 35.200913, longitude: -97.4442651),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.200913, longitude: -97.4442651),
            Coordinate(latitude: 35.1997733, longitude: -97.4442544),
            Coordinate(latitude: 35.1997563, longitude: -97.4413027),
            Coordinate(latitude: 35.2008683, longitude: -97.4413075),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.1997733, longitude: -97.4442544),
            Coordinate(latitude: 35.1980672, longitude: -97.4442558),
            Coordinate(latitude: 35.1980497, longitude: -97.442499),
            Coordinate(latitude: 35.1980804, longitude: -97.4420216),
            Coordinate(latitude: 35.198111, longitude: -97.4419357),
            Coordinate(latitude: 35.1981286, longitude: -97.4418097),
            Coordinate(latitude: 35.1981182, longitude: -97.4413132),
            Coordinate(latitude: 35.1997563, longitude: -97.4413027),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.1980672, longitude: -97.4442558),
            Coordinate(latitude: 35.1967054, longitude: -97.4442398),
            Coordinate(latitude: 35.1967361, longitude: -97.4413269),
            Coordinate(latitude: 35.1981182, longitude: -97.4413132),
            Coordinate(latitude: 35.1981286, longitude: -97.4418097),
            Coordinate(latitude: 35.198111, longitude: -97.4419357),
            Coordinate(latitude: 35.1980804, longitude: -97.4420216),
            Coordinate(latitude: 35.1980497, longitude: -97.442499),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.1997689, longitude: -97.4470868),
            Coordinate(latitude: 35.1966795, longitude: -97.4471182),
            Coordinate(latitude: 35.1967054, longitude: -97.4442398),
            Coordinate(latitude: 35.1997733, longitude: -97.4442544),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2038765, longitude: -97.4412781),
            Coordinate(latitude: 35.2038831, longitude: -97.4401749),
            Coordinate(latitude: 35.2038854, longitude: -97.4370514),
            Coordinate(latitude: 35.2074873, longitude: -97.4369794),
            Coordinate(latitude: 35.2074818, longitude: -97.4412797),
            Coordinate(latitude: 35.2071042, longitude: -97.4412815),
            Coordinate(latitude: 35.2069656, longitude: -97.4412527),
            Coordinate(latitude: 35.2068122, longitude: -97.4411708),
            Coordinate(latitude: 35.2065941, longitude: -97.4409978),
            Coordinate(latitude: 35.2064845, longitude: -97.4409415),
            Coordinate(latitude: 35.2063585, longitude: -97.4409134),
            Coordinate(latitude: 35.2053635, longitude: -97.4409227),
            Coordinate(latitude: 35.2051926, longitude: -97.440967),
            Coordinate(latitude: 35.2048891, longitude: -97.4412191),
            Coordinate(latitude: 35.2047028, longitude: -97.4412862),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2038854, longitude: -97.4370514),
            Coordinate(latitude: 35.2038634, longitude: -97.4329036),
            Coordinate(latitude: 35.2074713, longitude: -97.4352015),
            Coordinate(latitude: 35.2074855, longitude: -97.4356682),
            Coordinate(latitude: 35.2074873, longitude: -97.4369794),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2080566, longitude: -97.4467504),
            Coordinate(latitude: 35.2081404, longitude: -97.4467504),
            Coordinate(latitude: 35.2081404, longitude: -97.4468282),
            Coordinate(latitude: 35.2080582, longitude: -97.4468282),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2081408, longitude: -97.4467916),
            Coordinate(latitude: 35.2081404, longitude: -97.4467504),
            Coordinate(latitude: 35.2080566, longitude: -97.4467504),
            Coordinate(latitude: 35.2080567, longitude: -97.4467916),
            Coordinate(latitude: 35.2074797, longitude: -97.4467889),
            Coordinate(latitude: 35.2074594, longitude: -97.4448549),
            Coordinate(latitude: 35.2083728, longitude: -97.4448556),
            Coordinate(latitude: 35.2083777, longitude: -97.4467937),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2074818, longitude: -97.4412797),
            Coordinate(latitude: 35.2085815, longitude: -97.4412841),
            Coordinate(latitude: 35.2085859, longitude: -97.4417951),
            Coordinate(latitude: 35.2085761, longitude: -97.4422162),
            Coordinate(latitude: 35.2086396, longitude: -97.4423811),
            Coordinate(latitude: 35.2086484, longitude: -97.442762),
            Coordinate(latitude: 35.2074836, longitude: -97.4427701),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2085815, longitude: -97.4412841),
            Coordinate(latitude: 35.2074818, longitude: -97.4412797),
            Coordinate(latitude: 35.2074831, longitude: -97.4400919),
            Coordinate(latitude: 35.2082978, longitude: -97.4400849),
            Coordinate(latitude: 35.2082983, longitude: -97.4400963),
            Coordinate(latitude: 35.2087183, longitude: -97.4400862),
            Coordinate(latitude: 35.2087148, longitude: -97.4388927),
            Coordinate(latitude: 35.2111145, longitude: -97.4388856),
            Coordinate(latitude: 35.2111188, longitude: -97.4397356),
            Coordinate(latitude: 35.2096801, longitude: -97.4397262),
            Coordinate(latitude: 35.2096754, longitude: -97.4412885),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2068906, longitude: -97.4479167),
            Coordinate(latitude: 35.2074908, longitude: -97.4479153),
            Coordinate(latitude: 35.207512, longitude: -97.4479105),
            Coordinate(latitude: 35.2075164, longitude: -97.4484469),
            Coordinate(latitude: 35.2068924, longitude: -97.4484552),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2096801, longitude: -97.4397262),
            Coordinate(latitude: 35.2111188, longitude: -97.4397356),
            Coordinate(latitude: 35.2111213, longitude: -97.4412683),
            Coordinate(latitude: 35.2096754, longitude: -97.4412885),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2111213, longitude: -97.4412683),
            Coordinate(latitude: 35.2111324, longitude: -97.4437232),
            Coordinate(latitude: 35.2098296, longitude: -97.4437366),
            Coordinate(latitude: 35.2098132, longitude: -97.4412864),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2098132, longitude: -97.4412864),
            Coordinate(latitude: 35.2098296, longitude: -97.4437366),
            Coordinate(latitude: 35.2086533, longitude: -97.4437376),
            Coordinate(latitude: 35.2086484, longitude: -97.442762),
            Coordinate(latitude: 35.2086396, longitude: -97.4423811),
            Coordinate(latitude: 35.2085761, longitude: -97.4422162),
            Coordinate(latitude: 35.2085815, longitude: -97.4412841),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2083728, longitude: -97.4448556),
            Coordinate(latitude: 35.2074594, longitude: -97.4448549),
            Coordinate(latitude: 35.2074839, longitude: -97.4434185),
            Coordinate(latitude: 35.2079705, longitude: -97.4434284),
            Coordinate(latitude: 35.2082708, longitude: -97.4436108),
            Coordinate(latitude: 35.2086126, longitude: -97.4436161),
            Coordinate(latitude: 35.2086533, longitude: -97.4437376),
            Coordinate(latitude: 35.2086796, longitude: -97.4448566),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2086533, longitude: -97.4437376),
            Coordinate(latitude: 35.2086126, longitude: -97.4436161),
            Coordinate(latitude: 35.2082708, longitude: -97.4436108),
            Coordinate(latitude: 35.2079705, longitude: -97.4434284),
            Coordinate(latitude: 35.2074839, longitude: -97.4434185),
            Coordinate(latitude: 35.2074836, longitude: -97.4427701),
            Coordinate(latitude: 35.2086484, longitude: -97.442762),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2101953, longitude: -97.4437322),
            Coordinate(latitude: 35.2102036, longitude: -97.4447108),
            Coordinate(latitude: 35.2092848, longitude: -97.4447443),
            Coordinate(latitude: 35.2092859, longitude: -97.4448382),
            Coordinate(latitude: 35.2086796, longitude: -97.4448566),
            Coordinate(latitude: 35.2086533, longitude: -97.4437376),
            Coordinate(latitude: 35.2098296, longitude: -97.4437366),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2096859, longitude: -97.4453645),
            Coordinate(latitude: 35.2096957, longitude: -97.4447275),
            Coordinate(latitude: 35.2102036, longitude: -97.4447108),
            Coordinate(latitude: 35.2101953, longitude: -97.4437322),
            Coordinate(latitude: 35.2111324, longitude: -97.4437232),
            Coordinate(latitude: 35.2111432, longitude: -97.4453699),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2097312, longitude: -97.4459983),
            Coordinate(latitude: 35.2099378, longitude: -97.4459986),
            Coordinate(latitude: 35.2099422, longitude: -97.446629),
            Coordinate(latitude: 35.2098239, longitude: -97.446637),
            Coordinate(latitude: 35.20978, longitude: -97.446696),
            Coordinate(latitude: 35.2097647, longitude: -97.4473478),
            Coordinate(latitude: 35.209642, longitude: -97.447549),
            Coordinate(latitude: 35.2096244, longitude: -97.4478735),
            Coordinate(latitude: 35.2090196, longitude: -97.4478842),
            Coordinate(latitude: 35.2090129, longitude: -97.4467937),
            Coordinate(latitude: 35.2091041, longitude: -97.4467941),
            Coordinate(latitude: 35.2090946, longitude: -97.4459957),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2090196, longitude: -97.4478842),
            Coordinate(latitude: 35.207512, longitude: -97.4479105),
            Coordinate(latitude: 35.2074908, longitude: -97.4479153),
            Coordinate(latitude: 35.2074797, longitude: -97.4467889),
            Coordinate(latitude: 35.2083777, longitude: -97.4467937),
            Coordinate(latitude: 35.2090129, longitude: -97.4467937),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2096244, longitude: -97.4478735),
            Coordinate(latitude: 35.209642, longitude: -97.447549),
            Coordinate(latitude: 35.2097647, longitude: -97.4473478),
            Coordinate(latitude: 35.20978, longitude: -97.446696),
            Coordinate(latitude: 35.2098239, longitude: -97.446637),
            Coordinate(latitude: 35.2099422, longitude: -97.446629),
            Coordinate(latitude: 35.2099378, longitude: -97.4459986),
            Coordinate(latitude: 35.2104274, longitude: -97.4460007),
            Coordinate(latitude: 35.2104315, longitude: -97.4462494),
            Coordinate(latitude: 35.2104496, longitude: -97.4465444),
            Coordinate(latitude: 35.2104417, longitude: -97.4466319),
            Coordinate(latitude: 35.2103918, longitude: -97.4467254),
            Coordinate(latitude: 35.2103729, longitude: -97.4467275),
            Coordinate(latitude: 35.2103507, longitude: -97.4467422),
            Coordinate(latitude: 35.2103258, longitude: -97.4467717),
            Coordinate(latitude: 35.2103129, longitude: -97.4467925),
            Coordinate(latitude: 35.2103055, longitude: -97.4468146),
            Coordinate(latitude: 35.2102998, longitude: -97.4468505),
            Coordinate(latitude: 35.2103014, longitude: -97.4468901),
            Coordinate(latitude: 35.2103107, longitude: -97.4469283),
            Coordinate(latitude: 35.2103239, longitude: -97.4469558),
            Coordinate(latitude: 35.2103387, longitude: -97.4469796),
            Coordinate(latitude: 35.2103524, longitude: -97.44699),
            Coordinate(latitude: 35.2103787, longitude: -97.4470024),
            Coordinate(latitude: 35.2103921, longitude: -97.4470094),
            Coordinate(latitude: 35.2104055, longitude: -97.4470346),
            Coordinate(latitude: 35.2104474, longitude: -97.4471512),
            Coordinate(latitude: 35.2104507, longitude: -97.4472069),
            Coordinate(latitude: 35.2104217, longitude: -97.4473416),
            Coordinate(latitude: 35.2104228, longitude: -97.4474288),
            Coordinate(latitude: 35.2104737, longitude: -97.4476119),
            Coordinate(latitude: 35.2104768, longitude: -97.4478709),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2103918, longitude: -97.4467254),
            Coordinate(latitude: 35.2104064, longitude: -97.4467277),
            Coordinate(latitude: 35.2104214, longitude: -97.4467334),
            Coordinate(latitude: 35.2104299, longitude: -97.4467428),
            Coordinate(latitude: 35.2104379, longitude: -97.4467552),
            Coordinate(latitude: 35.2104477, longitude: -97.4467777),
            Coordinate(latitude: 35.2104535, longitude: -97.4468005),
            Coordinate(latitude: 35.2104606, longitude: -97.4468444),
            Coordinate(latitude: 35.21046, longitude: -97.4468803),
            Coordinate(latitude: 35.2104551, longitude: -97.4469044),
            Coordinate(latitude: 35.2104461, longitude: -97.4469373),
            Coordinate(latitude: 35.2104362, longitude: -97.4469597),
            Coordinate(latitude: 35.2104159, longitude: -97.4469872),
            Coordinate(latitude: 35.2103921, longitude: -97.4470094),
            Coordinate(latitude: 35.2103524, longitude: -97.44699),
            Coordinate(latitude: 35.2103387, longitude: -97.4469796),
            Coordinate(latitude: 35.2103239, longitude: -97.4469558),
            Coordinate(latitude: 35.2103107, longitude: -97.4469283),
            Coordinate(latitude: 35.2103014, longitude: -97.4468901),
            Coordinate(latitude: 35.2102998, longitude: -97.4468505),
            Coordinate(latitude: 35.2103055, longitude: -97.4468146),
            Coordinate(latitude: 35.2103135, longitude: -97.4467904),
            Coordinate(latitude: 35.2103258, longitude: -97.4467717),
            Coordinate(latitude: 35.2103507, longitude: -97.4467422),
            Coordinate(latitude: 35.2103729, longitude: -97.4467275),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2104768, longitude: -97.4478709),
            Coordinate(latitude: 35.2104737, longitude: -97.4476119),
            Coordinate(latitude: 35.2104228, longitude: -97.4474288),
            Coordinate(latitude: 35.2104217, longitude: -97.4473416),
            Coordinate(latitude: 35.2104507, longitude: -97.4472069),
            Coordinate(latitude: 35.2104474, longitude: -97.4471512),
            Coordinate(latitude: 35.2104055, longitude: -97.4470346),
            Coordinate(latitude: 35.2103921, longitude: -97.4470094),
            Coordinate(latitude: 35.2104141, longitude: -97.4469898),
            Coordinate(latitude: 35.2104362, longitude: -97.4469597),
            Coordinate(latitude: 35.2104461, longitude: -97.4469395),
            Coordinate(latitude: 35.21046, longitude: -97.4468803),
            Coordinate(latitude: 35.2104606, longitude: -97.4468444),
            Coordinate(latitude: 35.2104477, longitude: -97.4467777),
            Coordinate(latitude: 35.2104379, longitude: -97.4467552),
            Coordinate(latitude: 35.2104299, longitude: -97.4467428),
            Coordinate(latitude: 35.2104214, longitude: -97.4467334),
            Coordinate(latitude: 35.2104064, longitude: -97.4467277),
            Coordinate(latitude: 35.2103918, longitude: -97.4467254),
            Coordinate(latitude: 35.2104417, longitude: -97.4466319),
            Coordinate(latitude: 35.2104496, longitude: -97.4465444),
            Coordinate(latitude: 35.2104315, longitude: -97.4462494),
            Coordinate(latitude: 35.2104274, longitude: -97.4460007),
            Coordinate(latitude: 35.2111316, longitude: -97.445986),
            Coordinate(latitude: 35.2111206, longitude: -97.4478715),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2086978, longitude: -97.4478898),
            Coordinate(latitude: 35.2087037, longitude: -97.4490207),
            Coordinate(latitude: 35.2075216, longitude: -97.4490302),
            Coordinate(latitude: 35.2075164, longitude: -97.4484469),
            Coordinate(latitude: 35.207512, longitude: -97.4479105),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2087037, longitude: -97.4490207),
            Coordinate(latitude: 35.2086978, longitude: -97.4478898),
            Coordinate(latitude: 35.2090196, longitude: -97.4478842),
            Coordinate(latitude: 35.2091427, longitude: -97.4478833),
            Coordinate(latitude: 35.2091614, longitude: -97.4490273),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2111206, longitude: -97.4478715),
            Coordinate(latitude: 35.2111121, longitude: -97.4489951),
            Coordinate(latitude: 35.2091614, longitude: -97.4490273),
            Coordinate(latitude: 35.2091427, longitude: -97.4478833),
        ]),
        Area(name: "FIXME", desc: "FIXME", vertices: [
            Coordinate(latitude: 35.2111316, longitude: -97.445986),
            Coordinate(latitude: 35.2099378, longitude: -97.4459986),
            Coordinate(latitude: 35.2090946, longitude: -97.4459957),
            Coordinate(latitude: 35.2091041, longitude: -97.4467941),
            Coordinate(latitude: 35.2090129, longitude: -97.4467937),
            Coordinate(latitude: 35.2083777, longitude: -97.4467937),
            Coordinate(latitude: 35.2083728, longitude: -97.4448556),
            Coordinate(latitude: 35.2086796, longitude: -97.4448566),
            Coordinate(latitude: 35.2092859, longitude: -97.4448382),
            Coordinate(latitude: 35.2092848, longitude: -97.4447443),
            Coordinate(latitude: 35.2096957, longitude: -97.4447275),
            Coordinate(latitude: 35.2096859, longitude: -97.4453645),
            Coordinate(latitude: 35.2111432, longitude: -97.4453699),
        ])
    ]
}

extension Area {
    static var emptyArea: Area {
        Area(name: "", desc: "", vertices: [])
    }
}
