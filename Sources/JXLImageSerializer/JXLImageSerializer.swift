import Foundation
import ImageSerializationPlugin
import JxlCoder

/// A serializer class for handling JPEG XL (JXL) image format encoding and decoding.
///
/// The `JXLImageSerializer` class conforms to the `ImageSerializationPlugin` protocol and provides functionality
/// to encode and decode images in the JPEG XL format. It utilizes the `JXLCoder` to perform the actual image data
/// conversions and is designed to integrate seamlessly with a plugin-based architecture for image serialization.
public class JXLImageSerializer: ImageSerializationPlugin {
  /// Creates a new instance of `JXLImageSerializer`.
  ///
  /// This initializer is required by the `SnapshotTestingPlugin` protocol, allowing the class to be instantiated by
  /// the plugin registry.
  required public init() {}

  /// The image format that this serializer supports, which is JPEG XL.
  ///
  /// This property identifies the `JXLImageSerializer` as handling the JPEG XL format, represented by the `.plugins("jxl")` value
  /// in the `ImageSerializationFormat` enum. This allows the `ImageSerializer` to select this plugin when JPEG XL encoding or decoding is needed.
  static public let imageFormat: ImageSerializationFormat = .plugins("jxl")

  /// A unique identifier for the `JXLImageSerializer` plugin.
  ///
  /// This identifier is used by the plugin registry to distinguish the `JXLImageSerializer` from other plugins. The identifier
  /// follows a convention of `"ImageSerializationPlugin.jxl"`, ensuring that it is both unique and descriptive.
  static public let identifier: String = "ImageSerializationPlugin.jxl"

  /// Encodes a `SnapImage` into JPEG XL data.
  ///
  /// This method uses the `JXLCoder` to encode the provided image into the JPEG XL format. The encoded data can then be stored or transmitted
  /// as needed.
  ///
  /// - Parameter image: The image to be encoded.
  /// - Returns: The encoded image data in JPEG XL format, or `nil` if encoding fails.
  public func encodeImage(_ image: SnapImage) -> Data? {
    try? JXLCoder.encode(image: image)
  }
  
  /// Decodes JPEG XL data into a `SnapImage`.
  ///
  /// This method uses the `JXLCoder` to decode the provided data back into an image. The decoded image can then be used within the application
  /// as needed.
  ///
  /// - Parameter data: The image data in JPEG XL format.
  /// - Returns: The decoded `SnapImage`, or `nil` if decoding fails.
  public func decodeImage(_ data: Data) -> SnapImage? {
    try? JXLCoder.decode(data: data)
  }
}
