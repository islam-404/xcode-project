import UIKit

//protocol MenuViewControllerDelegate {
//    func toggleMenu()
//}

class MenuViewController: UIViewController {

    var tableView: UITableView!
//    var delegate: MenuViewControllerDelegate?
    
    
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
//    MenuViewController.delegate = self
    func clickCattegory(){
//        self.toggleMenu()
//        MenuViewControllerDelegate.toggl
//        delegate?.toggleMenu()
//        print(delegate?.toggleMenu())
    }

}
//
//extension MenuViewController: MenuViewControllerDelegate {

    
//    func toggleMenu() {
//    }
//    delegate?.toggleMenu()
//    func toggleMenu()
//}
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
        print(indexPath[1] + 1)
        tableView.deselectRow(at: indexPath, animated: true)
//        let index = Int(indexPath[1])
//        delegate?.toggleMenu()
//        
    }
    
    
}
