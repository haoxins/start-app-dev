//
//  ViewController.swift
//  hello-alamofire-realm
//
//  Created by hx on 5/8/16.
//  Copyright © 2016 hx. All rights reserved.
//

import UIKit

import RealmSwift
import Alamofire
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addBtn("hello alamofire", top: 0, action: "helloAlamofire:")

        addBtn("hello realm", top: 100, action: "helloRealm:")

        addBtn("hello rx", top: 200, action: "helloRx:")

        addBtn("goto rx", top: 300, action: "gotoRxView:")
    }

    func addBtn(text: String, top: CGFloat, action: Selector) {
        let btn = UIButton()
        btn.setTitle(text, forState: .Normal)
        btn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        btn.frame = CGRectMake(15, top, 300, 100)
        view.addSubview(btn)

        btn.addTarget(self, action: action, forControlEvents: .TouchUpInside)
    }

    func helloAlamofire(sender: UIButton!) {
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .responseJSON { response in
                // print(response.request)
                // print(response.response)
                // print(response.data) // bin
                print(response.result)

                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }

                print("\n\n --- \n\n")

                let parameters = [
                    "foo": [1,2,3],
                    "bar": [
                        "baz": "qux"
                    ]
                ]

                Alamofire.request(.POST, "https://httpbin.org/post", parameters: parameters, encoding: .JSON)
                    .responseJSON { response in
                        print(response.result)

                        if let JSON = response.result.value {
                            print("JSON: \(JSON)")
                        }
                    }
            }

    }

    func helloRealm(sender: UIButton!) {
        let dog = Dog()
        dog.name = "hi"
        dog.age = 123

        let realm = try! Realm()

        try! realm.write {
            realm.add(dog)
        }

        let count = realm.objects(Dog).filter("age == 123").count

        print("dogs: \(count)")
    }

    func helloRx(sender: UIButton!) {
        // https://github.com/ReactiveX/RxSwift/blob/master/Documentation/Examples.md#calculated-variable
        let a = Variable(1)
        let b = Variable(2)

        let c = Observable.combineLatest(a.asObservable(), b.asObservable()) { $0 + $1 }
            .filter { $0 >= 0 }               // if `a + b >= 0` is true, `a + b` is passed to map operator
            .map { "\($0) is positive" }      // maps `a + b` to "\(a + b) is positive"

        // Since initial values are a = 1, b = 2
        // 1 + 2 = 3 which is >= 0, `c` is initially equal to "3 is positive"

        // To pull values out of rx variable `c`, subscribe to values from  `c`.
        // `subscribeNext` means subscribe to next (fresh) values of variable `c`.
        // That also includes the initial value "3 is positive".
        c.subscribeNext { print($0) }          // prints: "3 is positive"

        // a = 4 is in RxSwift
        a.value = 4                                   // prints: 6 is positive
        // Sum of latest values is now `4 + 2`, `6` is >= 0, map operator
        // produces "6 is positive" and that result is "assigned" to `c`.
        // Since the value of `c` changed, `{ print($0) }` will get called,
        // and "6 is positive" is printed.

        // b = -8 is in RxSwift
        b.value = -8                                 // doesn't print anything
        // Sum of latest values is `4 + (-8)`, `-4` is not >= 0, map doesn't
        // get executed.
        // That means that `c` still contains "6 is positive" and that's correct.
        // Since `c` hasn't been updated, that means next value hasn't been produced,
        // and `{ print($0) }` won't be called.
    }

    func gotoRxView(sender: UIButton!) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let callView: UIViewController = storyboard.instantiateViewControllerWithIdentifier("RxController")
        self.presentViewController(callView, animated: true) {
            print("Oh, rx view")
        }
    }

    func gotoRacView(sender: UIButton!) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let callView: UIViewController = storyboard.instantiateViewControllerWithIdentifier("RacController")
        self.presentViewController(callView, animated: true) {
            print("Oh, rac view")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}