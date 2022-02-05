import UIKit

class AlicItemsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageProduct: UIImageView!
    
    @IBOutlet weak var titleProduct: UILabel!
    
    @IBOutlet weak var priceProduct: UILabel!
    
    func setup(with alic: Alic) {
        
        DispatchQueue.main.async{
        var image = "https://islam-404.github.io/alic/"
        image += alic.imgMin
        let url = URL(string:"\(image)")
        if let data = try? Data(contentsOf: url!)
        {
            self.imageProduct.image = UIImage(data: data)
        }
        }
        titleProduct.text = alic.title
        priceProduct.text = "\(String(alic.price)) ₽"
    }
}
