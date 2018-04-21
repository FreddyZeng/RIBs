//
//  TestInteractor.swift
//  TicTacToe
//
//  Created by fanrong on 2018/4/11.
//  Copyright © 2018年 Uber. All rights reserved.
//

import RIBs
import RxSwift

protocol TestRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol TestPresentable: Presentable {
    weak var listener: TestPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol TestListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class TestInteractor: PresentableInteractor<TestPresentable>, TestInteractable, TestPresentableListener {

    weak var router: TestRouting?
    weak var listener: TestListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: TestPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
