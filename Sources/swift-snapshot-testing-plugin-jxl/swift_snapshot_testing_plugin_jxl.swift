import Foundation
import ImageSerializationPlugin
import JxlCoder

public class JXLImageSerializer: ImageSerializationPlugin {
  required public init() {}

  static public let identifier: String = "jxl"

  public func encodeImage(_ image: SnapImage) /*async throws*/ -> Data? {
    try? JXLCoder.encode(image: image)
  }
  
  public func decodeImage(_ data: Data) /*async throws*/ -> SnapImage? {
    try? JXLCoder.decode(data: data)
  }
}
