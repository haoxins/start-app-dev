
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        //
        let btn01 = newButton([
            "title": "collection view",
            "radius": 5,
            "frame": CGRect(x: 30, y: 20, width: 140, height: 30)
        ])

        btn01.addTarget(self, action: #selector(ViewController.gotoCollView), for: .touchUpInside)
        
        view.addSubview(btn01)
        //
        let btn02 = newButton([
            "title": "table view",
            "radius": 5,
            "frame": CGRect(x: 30, y: 60, width: 140, height: 30)
        ])
        
        btn02.addTarget(self, action: #selector(ViewController.gotoTableView), for: .touchUpInside)
        
        view.addSubview(btn02)
    func gotoCollView() {
        let collView = CollectionView()
        navigationController?.pushViewController(collView, animated: true)
    }

    func gotoTableView() {
        let tableView = TableView()
        navigationController?.pushViewController(tableView, animated: true)
    }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
