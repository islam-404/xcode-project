import UIKit



struct Alic: Decodable {
    let id: String
    let category: [Category]
    let title: String
    let imgMin: String
    let imgCart: String
    let price: Double
    
    enum Category: String, Decodable {
        case mobile
        case pc
        case electron
        case home
        case sport
        //        case mobile = "Телефоны"
        //        case pc = "ПК"
        //        case electron = "Элекктроника"
        //        case home = "Для дома"
        //        case sport = "Спорт"
    }
}
protocol MainViewControllerDelegate: AnyObject {
    func toggleMenu()
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var mainViewCollection: UICollectionView!
    weak var delegate: MainViewControllerDelegate?
    
    @IBAction func menuButton(_ sender: UIButton) {
//        qwe(index: "")
        delegate?.toggleMenu()
        numCategoryTrack = "345"
    }
    

    
    
    
    var alicItems: [Alic] = []
    var alicAllItems: [Alic] = []
    var mobile: [Alic] = []
    var pc: [Alic] = []
    var electron: [Alic] = []
    var home: [Alic] = []
    var sport: [Alic] = []
    let idCell = "AlicItemsCollectionViewCell"
    let viewLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var numCategoryTrack: String = "" {
               didSet {
                       qwe(index: numCategoryTrack)
                   }
               }

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let urlString = "https://islam-404.github.io/alic/db/db.json"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }

            do{
                let alic = try JSONDecoder().decode([Alic].self, from: data)
                self.alicItems = alic
                self.alicAllItems = alic
                self.alicItems.forEach { item in
                    switch item.category[0] {
                    case .mobile:
                        self.mobile.append(item)
                    case .electron:
                        self.electron.append( item)
                    case .sport:
                        self.sport.append( item)
                    case .home:
                        self.home.append( item)
                    case .pc:
                        self.pc.append( item)
                    }
                }

                DispatchQueue.main.async{
                    self.mainViewCollection.reloadData()
                }
            } catch{
                print(error)
            }
            //            print(self.alicItems[0].price)
        }.resume()

        print(alicItems)
        mainViewCollection.delegate = self
        mainViewCollection.dataSource = self
        //        mainViewCollection.collectionViewLayout = UICollectionViewLayout()
      
        
    }
    func qwe(index: String) {
        print(index)
//        if index != "" {
//            print("true")
//            switch index {
//            case "Телефоны":
//                alicItems = mobile
//            case "ПК":
//                alicItems = pc
//            case "Элекктроника":
//                alicItems = electron
//            case "Длядома":
//                alicItems = home
//            case "Спорт":
//                alicItems = sport
//            default:
//                alicItems = alicAllItems
//            }
////            mainViewCollection.reloadData()
//            DispatchQueue.main.async{
//                self.mainViewCollection.reloadData()
//            }
//        } else {
//            print("FALSE QWE")
//        }
                alicItems = home
                mainViewCollection.reloadData()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.mainViewCollection.indexPathsForSelectedItems {
                DispatchQueue.main.async{
                    let index = Int(indexPath[0][1])
                    let detalsVC = segue.destination as! DetailVC
                    detalsVC.detalTrack.append(self.alicItems[index])
                }
            }
        }
        
    }
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.alicItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlicItemsCollectionViewCell", for: indexPath) as! AlicItemsCollectionViewCell
        
                DispatchQueue.main.async{
        cell.setup(with: self.alicItems[indexPath.row])
                }
        return cell
    }
    
    ////    2022-02-02 23:29:10.083119+0300 alicV3[75967:16998983] Failed to set (la) user defined inspected property on (alicV3.AlicItemsCollectionViewCell): [<alicV3.AlicItemsCollectionViewCell 0x1245168f0> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key la.
    //
    
    
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.indetifier == "ShowDetail" {
    //
    //        }
    //    }
    //
}
