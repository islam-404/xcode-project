import UIKit

class ContainerViewController: UIViewController, MainViewControllerDelegate, MenuViewControllerDelegate {
    
    var controller: UIViewController!
    var menuViewController: MenuViewController!
    var isMove = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureMainViewController()
//        configureMenuViewController()
//        showMenuViewController(shouldMove: true)
        print("=================")
    }

    func configureMainViewController() {
        let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! MainViewController
        mainViewController.delegate = self
        controller = mainViewController
        view.addSubview(controller.view)
        addChild(controller)
        print("Добавили mainViewController")
        
//        if menuViewController == nil {
//            menuViewController = MenuViewController()
//
//            view.insertSubview(menuViewController.view, at: 0)
//            addChild(menuViewController)
//            print("Добавили menuViewController")
////            menuViewController.delegate = self
//        }
    }
    
    func configureMenuViewController() {
       if menuViewController == nil {
            menuViewController = MenuViewController()
           menuViewController.delegate = self
//
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            print("Добавили menuViewController")
        }
    }
    
    func showMenuViewController(shouldMove: Bool) {
        if shouldMove {
            // показываем menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.controller.view.frame.origin.x = self.controller.view.frame.width - 140
            }) { (finished) in
                
            }
        } else {
            // убираем menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.controller.view.frame.origin.x = 0
            }) { (finished) in
                
            }
        }
    }
    
    // MARK: MainViewControllerDelegate
    
    func toggleMenu() {
        configureMenuViewController()
        isMove = !isMove
        showMenuViewController(shouldMove: isMove)
        print("Добавили")
    }

    
}
