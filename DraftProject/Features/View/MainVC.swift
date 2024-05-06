import UIKit
import SnapKit


protocol UserModelDelegate {
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [UserModel])
}




final class MainVC : UIViewController {
    private lazy var viewModel : UserViewModel = UserViewModel()
    private lazy var result : [UserModel] = []
    private let titleLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    private let subTitle : UILabel = {
        let label = UILabel()
        return label
    }()
    private let leadingView : UIView  = {
        let view = UIView()
        return view
        
    }()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var tableView : UITableView = {
        let tv = UITableView()
        tv.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.id)
        return tv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setDelegate(delegate: self)
        viewModel.fetchItem()
        config()
        configConstraint()
        view.backgroundColor = .red
    }
}



extension MainVC: UserModelDelegate {
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }

    func saveDatas(values: [UserModel]) {
        result = values
        tableView.reloadData()
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

extension MainVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.id, for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        let data = result[indexPath.row]
        cell.titleLabel.text = data.title
        cell.subTitleLabel.text = data.body
        return cell
    }

    
    
}
