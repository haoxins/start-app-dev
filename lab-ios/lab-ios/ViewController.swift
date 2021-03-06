
import CoreLocation
import UIKit

class ViewController: UIViewController {
    var backFrom: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan

        let manager = CLLocationManager()
        if CLLocationManager.authorizationStatus() == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }

        let label = UILabel()
        label.text = self.backFrom
        label.frame = CGRect(x: 30, y: 20, width: 140, height: 30)

        view.addSubview(label)

        // 1
        let btn01 = UIButton() { b in
            b.title = "collection view"
            b.radius = 5
            b.frame = CGRect(x: 30, y: 60, width: 140, height: 30)

            b.addTarget(self, action: #selector(ViewController.gotoCollView), for: .touchUpInside)
        }

        view.addSubview(btn01)
        // 2
        let btn02 = UIButton() { b in
            b.title = "table view"
            b.radius = 5
            b.frame = CGRect(x: 30, y: 100, width: 140, height: 30)

            b.addTarget(self, action: #selector(ViewController.gotoTableView), for: .touchUpInside)
        }

        view.addSubview(btn02)
        // 3
        let btn03 = UIButton() { b in
            b.title = "web view"
            b.radius = 5
            b.frame = CGRect(x: 30, y: 140, width: 140, height: 30)

            b.addTarget(self, action: #selector(ViewController.gotoWebView), for: .touchUpInside)
        }

        view.addSubview(btn03)
        // 4
        let btn04 = UIButton() { b in
            b.title = "wk web view"
            b.radius = 5
            b.frame = CGRect(x: 30, y: 180, width: 140, height: 30)

            b.addTarget(self, action: #selector(ViewController.gotoWXWebView), for: .touchUpInside)
        }

        view.addSubview(btn04)
        // 5
        let btn05 = UIButton() { b in
            b.title = "baidu map"
            b.radius = 5
            b.frame = CGRect(x: 30, y: 220, width: 140, height: 30)

            b.addTarget(self, action: #selector(ViewController.gotoBaiduMap), for: .touchUpInside)
        }

        view.addSubview(btn05)

        // just test
        view.addSubview(UILabel() { l in
            l.text = "hello"
            l.frame = CGRect(x: 30, y: 260, width: 140, height: 30)
        })

        view.addSubview(UITextField() { t in
            t.placeholder = "hello"
            t.frame = CGRect(x: 30, y: 300, width: 140, height: 30)
        })
    }

    func gotoCollView() {
        let collView = CollectionView()
        navigationController?.pushViewController(collView, animated: true)
    }

    func gotoTableView() {
        let tableView = TableView()
        navigationController?.pushViewController(tableView, animated: true)
    }

    func gotoWebView() {
        let webView = WebView()
        navigationController?.pushViewController(webView, animated: true)
    }
    
    func gotoWXWebView() {
        let wxWebView = MyWKWebView()
        navigationController?.pushViewController(wxWebView, animated: true)
    }

    func gotoBaiduMap() {
        let baiduMap = BaiduMapView()
        navigationController?.pushViewController(baiduMap, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

