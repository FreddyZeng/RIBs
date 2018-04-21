//
//  Copyright (c) 2017. Uber Technologies
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import RIBs
import RxSwift

public protocol RandomWinRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol RandomWinPresentable: Presentable {
    // UI可以反馈事件给逻辑
    var listener: RandomWinPresentableListener? { get set }
    // 逻辑主动给UI数据进行显示，并且可以拥有异步回调
    func announce(winner: PlayerType, withCompletionHandler handler: @escaping () -> ())
}

public protocol RandomWinListener: class {
    func didRandomlyWin(with player: PlayerType)
}

final class RandomWinInteractor: PresentableInteractor<RandomWinPresentable>, RandomWinInteractable, RandomWinPresentableListener {
    // 当逻辑驱动，需要切换整个页面的UI时，才会启动路由进行切换
    weak var router: RandomWinRouting?
    
    // 子模块的逻辑事件，告诉父模块
    weak var listener: RandomWinListener?

    init(presenter: RandomWinPresentable,
         mutableScoreStream: MutableScoreStream) {
        self.mutableScoreStream = mutableScoreStream
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

    // MARK: - RandomWinPresentableListener

    func determineWinner() {
        let random = arc4random_uniform(100)
        let winner = random > 50 ? PlayerType.player1 : PlayerType.player2
        presenter.announce(winner: winner) {
            self.mutableScoreStream.updateScore(with: winner)
            self.listener?.didRandomlyWin(with: winner)
        }
    }

    // MARK: - Private

    private let mutableScoreStream: MutableScoreStream
}
