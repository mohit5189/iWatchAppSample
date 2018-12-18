//
//  FlightInterfaceController.swift
//  Watch Extension
//
//  Created by Mohit Kumar on 18/12/18.
//  Copyright © 2018 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class FlightInterfaceController: WKInterfaceController {

    @IBOutlet weak var flightLabel: WKInterfaceLabel!
    @IBOutlet weak var rootLabel: WKInterfaceLabel!
    @IBOutlet weak var boardingLabel: WKInterfaceLabel!
    @IBOutlet weak var boardingTimeLabel: WKInterfaceLabel!
    @IBOutlet weak var statuslabel: WKInterfaceLabel!
    @IBOutlet weak var gateLabel: WKInterfaceLabel!
    @IBOutlet weak var seatlabel: WKInterfaceLabel!
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    if let flight = context as? Flight {
      self.flight = flight
    }
  }

  var flight:Flight?{
    didSet{
      guard let flight = flight else { return }
      // 4
      flightLabel.setText("Flight \(flight.shortNumber)")
      rootLabel.setText(flight.route)
      boardingLabel.setText("\(flight.number) Boards")
      boardingTimeLabel.setText(flight.boardsAt)
      // 5
      if flight.onSchedule {
        statuslabel.setText("On Time")
      } else {
        statuslabel.setText("Delayed")
        statuslabel.setTextColor(.red)
      }
      gateLabel.setText("Gate \(flight.gate)")
      seatlabel.setText("Seat \(flight.seat)")
    }
  }

}
