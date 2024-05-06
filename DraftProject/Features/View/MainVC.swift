import UIKit
import SnapKit


class MainVC : UIViewController {
    var tableView : UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        config()
        configConstraint()
        
        view.backgroundColor = .red
    }
}



private extension MainVC {
    func config(){
        view.addSubview(tableView)
    }
    
    func configConstraint(){
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
