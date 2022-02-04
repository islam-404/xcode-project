import Foundation
import UIKit

enum MenuModel: Int, CustomStringConvertible {
    
    case mobile
    case pc
    case electron
    case home
    case sport

    
    var description: String {
        switch self {
        case .mobile: return "Телефоны"
        case .pc: return "ПК"
        case .electron: return "Элекктроника"
        case .home: return "Длядома"
        case .sport: return "Спорт"
        }
    }
    
//    var image: UIImage {
//        switch self {
//        case .Profile: return UIImage(named: "Profile") ?? UIImage()
//        case .Menu: return UIImage(named: "Menu") ?? UIImage()
//        case .Contacts: return UIImage(named: "Contacts") ?? UIImage()
//        case .Settings: return UIImage(named: "Settings") ?? UIImage()
//            
//        }
//    }
    
}
