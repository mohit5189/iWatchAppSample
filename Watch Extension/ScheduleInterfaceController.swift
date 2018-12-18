//
//  ScheduleInterfaceController.swift
//  Watch Extension
//
//  Created by Mohit Kumar on 18/12/18.
//  Copyright © 2018 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {
    @IBOutlet weak var flightTable: WKInterfaceTable!
  
  var flights = Flight.allFlights()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
      
      flightTable.setNumberOfRows(flights.count, withRowType: "FlightRow")

      for index in 0..<flightTable.numberOfRows {
        guard let controller = flightTable.rowController(at: index) as? FlightRowController else { continue }
        
        controller.flight = flights[index]
      }

        // Configure interface objects here.
    }

  override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    let flight = flights[rowIndex]
    presentController(withName: "Flight", context: flight)
  }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
