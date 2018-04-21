//
//  TestViewController.swift
//  TicTacToe
//
//  Created by fanrong on 2018/4/11.
//  Copyright © 2018年 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol TestPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class TestViewController: UIViewController, TestPresentable, TestViewControllable {

    weak var listener: TestPresentableListener?
}
