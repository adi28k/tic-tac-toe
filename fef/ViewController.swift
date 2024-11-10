//
//  ViewController.swift
//  fef
//
//  Created by Adilet Kistaubayev on 09.11.2024.
//

import UIKit


class ViewController: UIViewController {

    var player = 1
    var arrayBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winArray = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func game(_ sender: UIButton) {
        let index = sender.tag - 1

        if arrayBoard[index] != 0 {
            return
        }

        arrayBoard[index] = player


        if player == 1 {
            sender.setBackgroundImage(UIImage(named: "x"), for: .normal)
            player = 2
        } else {
            sender.setBackgroundImage(UIImage(named: "o"), for: .normal)
            player = 1
        }


        for win in winArray {
            if arrayBoard[win[0]] == arrayBoard[win[1]] && arrayBoard[win[1]] == arrayBoard[win[2]] && arrayBoard[win[2]] != 0 {
                let winner = player == 1 ? "O" : "X"
                showAlert(message: "\(winner) wins!")
                return
            }
        }

      
        if !arrayBoard.contains(0) {
            showAlert(message: "It's a draw!")
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.clearBoard()
        }))
        present(alert, animated: true)
    }

    func clearBoard() {
        for i in 0...8 {
            let button = view.viewWithTag(i + 1) as! UIButton
            button.setBackgroundImage(nil, for: .normal)
            arrayBoard[i] = 0
        }
        player = 1
    }
}

