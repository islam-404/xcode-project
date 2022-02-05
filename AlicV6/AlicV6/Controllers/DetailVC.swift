import UIKit

class DetailVC: UIViewController {
   
    var detalTrack: [Alic] = []
    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var titleProduct: UILabel!
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        print(detalTrack, "detal")
//        print(detalTrack.count, "detal")
        if detalTrack.count != 0 {
        DispatchQueue.main.async{
        var image = "https://islam-404.github.io/alic/"
            image += self.detalTrack[0].imgCart
        let url = URL(string:"\(image)")
        if let data = try? Data(contentsOf: url!)
        {
            self.imageProduct.image = UIImage(data: data)
        }
        }
        titleProduct.text = detalTrack[0].title
        priceProduct.text = "\(String(detalTrack[0].price)) ₽"
    }       
    }
}
