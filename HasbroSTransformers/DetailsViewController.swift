//
//  DetailsViewController.swift
//  HasbroSTransformers
//
//  Created by Pooya on 2018-09-22.
//  Copyright © 2018 Amir. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var keyIndex: String = ""
    var typeValue: String = ""
    var oneTransformer: Transformer?
    
    @IBOutlet weak var teamTitle : UILabel!
    @IBOutlet weak var teamSeg: UISegmentedControl!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet var attrSegment: [UISegmentedControl]!
    @IBOutlet weak var actIndicatorView: UIActivityIndicatorView!
    
    let api = API()
    
    let teamDef: [Int: String] =
        [0: "A",
         1: "D"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actIndicatorView.alpha = 0.0
        navigationItem.title = " \(typeValue) Transformer"
        teamTitle.text = ( teamSeg.selectedSegmentIndex == 0 ) ?  "Team: Autobots" : "Team: Decepticons"
        if ( typeValue == "Edit" ) {
            setInputs(inputTransformerValues: oneTransformer!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateTeamSeg(_ sender: UISegmentedControl) {
        teamTitle.text = ( teamSeg.selectedSegmentIndex == 0 ) ?  "Team: Autobots" : "Team: Decepticons"
    }
    
    
    @IBAction func saveAct(_ sender: UIBarButtonItem) {
        actIndicatorView.alpha = 1.0
        if ( typeValue == "Add" ) {
            let transformer = Transformer(json: readInputs())
            print("Add")
            api.postTransformer(transformer: transformer)
        } else if ( typeValue == "Edit" )  {
            var transformer = Transformer(json: readInputs())
            transformer.id = keyIndex
            print("Edit")
            api.putTransformer(transformer: transformer)
        } else {
            // TODO
        }
        actIndicatorView.alpha = 0.0
        self.navigationController?.popViewController(animated: true)

//        navigationController?.dismiss(animated: true, completion: nil)
//        dismiss(animated: true, completion: nil)
//        dismissed()

    }
    
    func dismissed() {
        let yourViewController = UIViewController()
        guard let navigationController = self.navigationController else {return}
        navigationController.pushViewController(yourViewController, animated: true)
    }
    
    // MARK: - read Input Values
    func readInputs() -> [String : Any] {
        
        var jsonObject: [String: Any]  = [
            "name" : nameText.text,
            "team" : teamDef[teamSeg.selectedSegmentIndex]
        ];
        
        for  segment in attrSegment {
            let segmentValue = segment.selectedSegmentIndex+1
            switch segment.tag {
            case 3:
                jsonObject["strength"] = segmentValue
                break
            case 4:
                jsonObject["intelligence"] = segmentValue
                break
            case 5:
                jsonObject["speed"] = segmentValue
                break
            case 6:
                jsonObject["endurance"] = segmentValue
                break
            case 7:
                jsonObject["rank"] = segmentValue
                break
            case 8:
                jsonObject["courage"] = segmentValue
                break
            case 9:
                jsonObject["firepower"] = segmentValue
                break
            case 10:
                jsonObject["skill"] = segmentValue
            default: break
            }
        }
        return jsonObject
    }
    
    
    // MARK: - set form Input Values
    func setInputs(inputTransformerValues : Transformer) {
        
        nameText.text = inputTransformerValues.name
        teamSeg.selectedSegmentIndex = (inputTransformerValues.team == "A" ) ? 0  : 1

        for  segment in attrSegment {
            switch segment.tag {
            case 3:
                segment.selectedSegmentIndex = inputTransformerValues.strength - 1
                break
            case 4:
                segment.selectedSegmentIndex = inputTransformerValues.intelligence - 1
                break
            case 5:
                segment.selectedSegmentIndex = inputTransformerValues.speed - 1
                break
            case 6:
                segment.selectedSegmentIndex = inputTransformerValues.endurance - 1
                break
            case 7:
                segment.selectedSegmentIndex = inputTransformerValues.rank - 1
                break
            case 8:
                segment.selectedSegmentIndex = inputTransformerValues.courage - 1
                break
            case 9:
                segment.selectedSegmentIndex = inputTransformerValues.firepower - 1
                break
            case 10:
                segment.selectedSegmentIndex = inputTransformerValues.skill - 1
            default: break
            }
        }
        
    }
    


}
