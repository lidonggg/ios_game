//
//  ChoseGameViewController.swift
//  ios_final_project_Game
//
//  Created by LS J on 2018/6/1.
//  Copyright © 2018年 LS J. All rights reserved.
//

import UIKit

class ChoseGameViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        bgImage.contentMode = .scaleAspectFill
        bgImage.clipsToBounds = true
        bgImage.image = UIImage.init(named: "bg.jpeg")
        self.view.addSubview(bgImage)
        
        let bgView = UIView.init(frame: CGRect.init(x: (ScreenWidth - 250) * 0.5, y: (ScreenHeight - 160 - 100) * 0.5, width: 250, height: 160))
        bgView.layer.cornerRadius = 6
        bgView.clipsToBounds = true
        bgView.backgroundColor = pinColor
        self.view.addSubview(bgView)
        
        let marginY:CGFloat = (bgView.height - 60 * 2) / 3
        let gameWidth:CGFloat = bgView.width - 20
        let gameHeight:CGFloat = 60
        
        let game1 = self.createGameBtn(name: "24 Game")
        game1.tag = 1
        game1.frame = CGRect.init(x: 10, y: marginY, width: gameWidth, height: gameHeight)
        bgView.addSubview(game1)
        
        let game2 = self.createGameBtn(name: "Ferris")
        game2.tag = 2
        game2.frame = CGRect.init(x: 10, y: game1.bottom + marginY, width: gameWidth, height: gameHeight)
        bgView.addSubview(game2)
        
        let back = UIButton.init(frame: CGRect.init(x: (ScreenWidth - (bgView.width - 30)) * 0.5, y: bgView.bottom + 30, width: bgView.width - 30, height: 50))
        back.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        back.layer.cornerRadius = 6
        back.clipsToBounds = true
        back.layer.borderWidth = 3
        back.layer.borderColor = UIColor.white.cgColor
        back.backgroundColor = pinColor
        back.setTitleColor(d4Color, for: .normal)
        back.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        back.setTitle("Back", for: .normal)
        self.view.addSubview(back)
        
        var a:[String]? = [String]()
        a?.append("xixiix")
        //print(a!)
    }
    
    func createGameBtn(name:String) -> UIButton {
        let btn = UIButton()
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.layer.borderWidth = 3
        btn.layer.borderColor = UIColor.white.cgColor
        btn.backgroundColor = blueColor
        btn.setTitleColor(d4Color, for: .normal)
        btn.setTitle(name, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        btn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
        return btn;
    }
    
    //进入游戏
    @objc func btnClick(sender:UIButton) -> Void {
        if(sender.tag == 1){
            let game1Vc = Game24ViewController()
            self.navigationController?.pushViewController(game1Vc, animated: true)
        }else if(sender.tag == 2){
            let ferrisVc = FerrisViewController()
            self.navigationController?.pushViewController(ferrisVc, animated: true)
        }
    }
    //返回上一级
    @objc func backClick() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
}

