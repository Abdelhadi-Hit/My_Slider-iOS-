//
//  ViewController.swift
//  MonCurseur
//
//  Created by ABDELHADI BAKHTY on 30/12/2022.
//

import UIKit

class ViewController: UIViewController {
    var valeurCourante: Int = 0
    var valeurCible: Int=0
    var Score = 0
    var round = 0
    
      
    @IBOutlet weak var Curseur: UISlider!
    @IBOutlet weak var labelCible: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelRound: UILabel!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        valeurCourante = Int(Curseur.value)
        demarrerNouveauJeu()
        let buttonHighlighted = "Bouton-EnFocus"
        let normalCursor = "imageCurseur-Normal"
        let focusedCursor = "imageCurseur-EnFocus"
        button.setBackgroundImage(UIImage(named: buttonHighlighted), for: .highlighted)
        
        Curseur.setThumbImage(UIImage(named: normalCursor), for: .normal)
        Curseur.setThumbImage(UIImage(named: focusedCursor), for: .highlighted)
        
       
        
        
        let TrackInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let pisteDroite = "pisteDroiteCurseur"
        let pisteGauche = "pisteGaucheCurseur"
        
        Curseur.setMinimumTrackImage(UIImage(named: pisteDroite)?.resizableImage(withCapInsets: TrackInsets), for: .normal)
        
       
        Curseur.setMaximumTrackImage(UIImage(named: pisteGauche)?.resizableImage(withCapInsets: TrackInsets), for: .normal)
        
        
       
        
    }
    
   
   
   
    
    // Méthode appelée lorsque le bouton est tapé
    @IBAction func buttonTapped() {
      // Affiche une alerte avec un message
      let alertController = UIAlertController(title: "Attention", message: "Vous avez tapé sur le bouton TocToc", preferredStyle: .alert)
      
      let action = UIAlertAction(title: "OK", style: .default) { (action) in
        print("L'utilisateur a sélectionné l'option OK dans l'alerte")
      }
      alertController.addAction(action)
      
      // Affiche l'alerte à l'écran
      present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func curseurDeplace(_ curseur: UISlider) {
        valeurCourante = Int(curseur.value)
            print(curseur.value)
        }
    

    
    @IBAction func afficherAlerte(_ sender: UIButton) {
        
       let difference = abs(valeurCible-valeurCourante)
       let points = 100 - difference
       Score += points
        
        let titre: String
        
        if difference == 0 {
            titre = "parfait ! ⚡️"
            Score+=100
        }
        else if difference < 5 {
            if difference == 1 {
                Score+=50
                
            }
            titre = "presque ca ! ⚓️ "
        }
        else if difference < 10 {
            titre = "bien ! 👍"
        }
        else {
            titre = "Encore loin ! 🧐 "
        }
    
        
        let alertController = UIAlertController(title: titre, message:"la valeur du curseur:\(valeurCourante)\nla valeur cible:\(valeurCible)\ndifference:\(difference)" , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Super!", style: .default, handler: {
            action in
            self.demarrerNouveauRound()
        })
        
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
      
        
    }
    
    @IBAction func mettreAJourLabels(){
        labelCible.text = String(valeurCible)
        labelScore.text = String(Score)
        labelRound.text = String(round)
        
    }
    
    @IBAction func demarrerNouveauRound(){
        valeurCible = Int.random(in: 1...100)
        valeurCourante = 50
        Curseur.value = Float(valeurCourante)
        round+=1
        mettreAJourLabels()
        
    }
    
    @IBAction func demarrerNouveauJeu(){
        Score = 0
        round = 0
        demarrerNouveauRound()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
           performSegue(withIdentifier: "goToAboutGame", sender: self)
       }

    
   
}

