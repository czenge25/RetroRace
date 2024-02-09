import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {

    /// The "BrakeButton" asset catalog image resource.
    static let brakeButton = ImageResource(name: "BrakeButton", bundle: resourceBundle)

    /// The "Bush_01" asset catalog image resource.
    static let bush01 = ImageResource(name: "Bush_01", bundle: resourceBundle)

    /// The "Bush_02" asset catalog image resource.
    static let bush02 = ImageResource(name: "Bush_02", bundle: resourceBundle)

    /// The "Car1" asset catalog image resource.
    static let car1 = ImageResource(name: "Car1", bundle: resourceBundle)

    /// The "Car2" asset catalog image resource.
    static let car2 = ImageResource(name: "Car2", bundle: resourceBundle)

    /// The "Car3" asset catalog image resource.
    static let car3 = ImageResource(name: "Car3", bundle: resourceBundle)

    /// The "Car4" asset catalog image resource.
    static let car4 = ImageResource(name: "Car4", bundle: resourceBundle)

    /// The "Car5" asset catalog image resource.
    static let car5 = ImageResource(name: "Car5", bundle: resourceBundle)

    /// The "Car6" asset catalog image resource.
    static let car6 = ImageResource(name: "Car6", bundle: resourceBundle)

    /// The "Decor_Building_01" asset catalog image resource.
    static let decorBuilding01 = ImageResource(name: "Decor_Building_01", bundle: resourceBundle)

    /// The "Decor_Building_02" asset catalog image resource.
    static let decorBuilding02 = ImageResource(name: "Decor_Building_02", bundle: resourceBundle)

    /// The "Finish" asset catalog image resource.
    static let finish = ImageResource(name: "Finish", bundle: resourceBundle)

    /// The "Grass_Tile" asset catalog image resource.
    static let grassTile = ImageResource(name: "Grass_Tile", bundle: resourceBundle)

    /// The "Pavilion_01" asset catalog image resource.
    static let pavilion01 = ImageResource(name: "Pavilion_01", bundle: resourceBundle)

    /// The "Pavilion_02" asset catalog image resource.
    static let pavilion02 = ImageResource(name: "Pavilion_02", bundle: resourceBundle)

    /// The "Racing_Lights" asset catalog image resource.
    static let racingLights = ImageResource(name: "Racing_Lights", bundle: resourceBundle)

    /// The "Road1" asset catalog image resource.
    static let road1 = ImageResource(name: "Road1", bundle: resourceBundle)

    /// The "Road_01_Tile_01" asset catalog image resource.
    static let road01Tile01 = ImageResource(name: "Road_01_Tile_01", bundle: resourceBundle)

    /// The "Road_01_Tile_02" asset catalog image resource.
    static let road01Tile02 = ImageResource(name: "Road_01_Tile_02", bundle: resourceBundle)

    /// The "Road_01_Tile_03" asset catalog image resource.
    static let road01Tile03 = ImageResource(name: "Road_01_Tile_03", bundle: resourceBundle)

    /// The "Road_01_Tile_04" asset catalog image resource.
    static let road01Tile04 = ImageResource(name: "Road_01_Tile_04", bundle: resourceBundle)

    /// The "Road_01_Tile_05" asset catalog image resource.
    static let road01Tile05 = ImageResource(name: "Road_01_Tile_05", bundle: resourceBundle)

    /// The "Road_01_Tile_06" asset catalog image resource.
    static let road01Tile06 = ImageResource(name: "Road_01_Tile_06", bundle: resourceBundle)

    /// The "Road_01_Tile_07" asset catalog image resource.
    static let road01Tile07 = ImageResource(name: "Road_01_Tile_07", bundle: resourceBundle)

    /// The "Road_01_Tile_08" asset catalog image resource.
    static let road01Tile08 = ImageResource(name: "Road_01_Tile_08", bundle: resourceBundle)

    /// The "Road_02_Tile_01" asset catalog image resource.
    static let road02Tile01 = ImageResource(name: "Road_02_Tile_01", bundle: resourceBundle)

    /// The "Road_02_Tile_02" asset catalog image resource.
    static let road02Tile02 = ImageResource(name: "Road_02_Tile_02", bundle: resourceBundle)

    /// The "Road_02_Tile_03" asset catalog image resource.
    static let road02Tile03 = ImageResource(name: "Road_02_Tile_03", bundle: resourceBundle)

    /// The "Road_02_Tile_04" asset catalog image resource.
    static let road02Tile04 = ImageResource(name: "Road_02_Tile_04", bundle: resourceBundle)

    /// The "Road_02_Tile_05" asset catalog image resource.
    static let road02Tile05 = ImageResource(name: "Road_02_Tile_05", bundle: resourceBundle)

    /// The "Road_02_Tile_06" asset catalog image resource.
    static let road02Tile06 = ImageResource(name: "Road_02_Tile_06", bundle: resourceBundle)

    /// The "Road_02_Tile_08" asset catalog image resource.
    static let road02Tile08 = ImageResource(name: "Road_02_Tile_08", bundle: resourceBundle)

    /// The "Road_Main" asset catalog image resource.
    static let roadMain = ImageResource(name: "Road_Main", bundle: resourceBundle)

    /// The "Road_Side_01" asset catalog image resource.
    static let roadSide01 = ImageResource(name: "Road_Side_01", bundle: resourceBundle)

    /// The "Road_Side_02" asset catalog image resource.
    static let roadSide02 = ImageResource(name: "Road_Side_02", bundle: resourceBundle)

    /// The "Rock1_4" asset catalog image resource.
    static let rock14 = ImageResource(name: "Rock1_4", bundle: resourceBundle)

    /// The "Rock_01" asset catalog image resource.
    static let rock01 = ImageResource(name: "Rock_01", bundle: resourceBundle)

    /// The "Rock_02" asset catalog image resource.
    static let rock02 = ImageResource(name: "Rock_02", bundle: resourceBundle)

    /// The "Soil_Tile" asset catalog image resource.
    static let soilTile = ImageResource(name: "Soil_Tile", bundle: resourceBundle)

    /// The "Start" asset catalog image resource.
    static let start = ImageResource(name: "Start", bundle: resourceBundle)

    /// The "Tree_01" asset catalog image resource.
    static let tree01 = ImageResource(name: "Tree_01", bundle: resourceBundle)

    /// The "Tree_02" asset catalog image resource.
    static let tree02 = ImageResource(name: "Tree_02", bundle: resourceBundle)

    /// The "Water_Tile" asset catalog image resource.
    static let waterTile = ImageResource(name: "Water_Tile", bundle: resourceBundle)

    /// The "arrow" asset catalog image resource.
    static let arrow = ImageResource(name: "arrow", bundle: resourceBundle)

    /// The "knob" asset catalog image resource.
    static let knob = ImageResource(name: "knob", bundle: resourceBundle)

}

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Hashable {

    /// An asset catalog color resource name.
    fileprivate let name: String

    /// An asset catalog color resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize a `ColorResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

/// An image resource.
struct ImageResource: Hashable {

    /// An asset catalog image resource name.
    fileprivate let name: String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// Initialize a `NSColor` with a color resource.
    convenience init(resource: ColorResource) {
        self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
    }

}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {

    /// Initialize a `NSImage` with an image resource.
    init(resource: ImageResource) {
        self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// Initialize a `UIColor` with a color resource.
    convenience init(resource: ColorResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// Initialize a `UIImage` with an image resource.
    convenience init(resource: ImageResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// Initialize a `Color` with a color resource.
    init(_ resource: ColorResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {

    /// Initialize an `Image` with an image resource.
    init(_ resource: ImageResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}
#endif