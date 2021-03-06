import UIKit

protocol MenuViewControllerDelegate {
    func toggleMenu()
}

class MenuViewController: UIViewController {

    var tableView: UITableView!
    var delegate: MenuViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        configureTableView()
    }
    
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuTableCell.self, forCellReuseIdentifier: MenuTableCell.reuseId)
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.separatorStyle = .none
        tableView.rowHeight = 90
        tableView.backgroundColor = .darkGray
    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.reuseId) as! MenuTableCell
        let menuModel = MenuModel(rawValue: indexPath.row)
//        cell.iconImageView.image = menuModel?.image
        cell.myLabel.text = menuModel?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let menuModel = MenuModel(rawValue: indexPath.row)
         let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! MainViewController
        vc.numCategoryTrack = "\(String(describing: menuModel?.description))"
        delegate?.toggleMenu()
//        }
//            show(vc, sender: nil)
//            clickCattegory()
//            ContainerViewController.showMenuViewController(shouldMove: false)
        
//        print(menuModel)
//            let detalsVC = segue.destination as! DetailVC
//                detalsVC.detalTrack.append(self.alicItems[index])
    }
    
    
}
