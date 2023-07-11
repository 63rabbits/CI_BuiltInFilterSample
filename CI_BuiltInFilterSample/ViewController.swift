import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Assetsから画像を読み込んで CIImage に変換する。
        let inputUiImage = UIImage(named: "kerokero")!      // get the image in assets.
        let inputCiImage = CIImage(image: inputUiImage)!    // convert to CIImage



        // フィルター「CIColorClamp」を作成する。
        let filter = CIFilter(name:"CIColorClamp")!

        // パラメータを設定する。（RGBA = xyzw）
        filter.setValue(CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0), forKey:"inputMinComponents")
        filter.setValue(CIVector(x: 0.0, y: 1.0, z: 1.0, w: 1.0), forKey:"inputMaxComponents")
        filter.setValue(inputCiImage, forKey:kCIInputImageKey)

        // フィルターを適用する。（遅延評価）
        let outputImage = filter.outputImage!



        // UIImageに変換しViewに設置する。
        imageView.image = UIImage(ciImage: outputImage)


    }


}
