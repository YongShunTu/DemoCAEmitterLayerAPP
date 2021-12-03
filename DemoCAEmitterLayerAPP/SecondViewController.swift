//
//  SnowstormViewController.swift
//  DemoCAEmitterLayerAPP
//
//  Created by 姜又寧 on 2021/12/3.
//

//建立love3個圖檔Array
enum Love : String, CaseIterable {
    case love0, love1, love2
}
import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    var player : AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //建立CAEmitterCell並用回圈建立出Array裡面有3個cell
        let snowStrings = Love.allCases
        var cells : [CAEmitterCell] = []
        for snowString in snowStrings {
            view.backgroundColor = .white //背景白色
            let cell = CAEmitterCell()
            cell.contents = UIImage(named: snowString.rawValue)?.cgImage
            cell.birthRate = 3
            cell.lifetime = 20
            cell.velocity = 100
            cell.scale = 0.25
            cell.scaleRange = 0.05
            cell.scaleSpeed = -0.02
            cell.yAcceleration = 30
            cells.append(cell)
        }
        let layer = CAEmitterLayer()
        layer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -50)
        layer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        layer.emitterShape = .line
        layer.emitterCells = cells
        view.layer.addSublayer(layer)
        
        //抓取專案裡音樂檔url
        if let url = Bundle.main.url(forResource: "chainsmokers", withExtension: "mp4") {
            let music = AVPlayer(url: url)
            self.player = music
            self.player?.play()
        }
        
        //顯示圖片檔
        image.image = UIImage(named: "closer")
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
