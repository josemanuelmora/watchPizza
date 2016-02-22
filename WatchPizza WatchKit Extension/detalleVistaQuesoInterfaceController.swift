//
//  detalleVistaQuesoInterfaceController.swift
//  WatchPizza
//
//  Created by Marian Mora on 20/02/16.
//  Copyright © 2016 Jose Mora. All rights reserved.
//

import WatchKit
import Foundation


class detalleVistaQuesoInterfaceController: WKInterfaceController {
    
    @IBOutlet var pickerQueso: WKInterfacePicker!
    
    let tipos :[String] = ["Cheddar", "Mozzarela", "Provolone", "Sin queso"]
    
    var valores = valor()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        let c = context as! valor
        valores = c
        
        valores.imprimir()
        
        llenaPicker()
        
    }

    func llenaPicker()
    {
        
        var pickerItems:[WKPickerItem] = []
        
        for tipo in tipos
        {
            let item = WKPickerItem()
            item.title = tipo
            pickerItems.append(item)
        }
        
        self.pickerQueso.setItems(pickerItems)
        
        let indice : Int? = tipos.indexOf(valores.quesoSel)
        if (indice != nil){
            pickerQueso.setSelectedItemIndex(indice!)
        }
        else
        {
            valores.setQueso(tipos[0])
        }
    }
    
    @IBAction func seleccionaPicker(value: Int) {
        
        valores.setQueso(tipos[value])
    }
    

    @IBAction func cambiaVista() {
        pushControllerWithName("vistaIngredientes", context: valores)
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
