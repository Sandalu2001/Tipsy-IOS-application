struct TipBrain{
    var tipAmount: Float?
    var splitNumber: Int?
    var eachPersonAmount : Float?

    
    mutating func getTipAmount(buttonName : String){
        if(buttonName == "0%"){
            tipAmount = 0.0
        }
        else if(buttonName == "10%"){
            tipAmount = 0.1
        }
        else{
            tipAmount = 0.2
        }
    }
    
    mutating func getSplitNumber(splitNumber : Int){
        self.splitNumber = splitNumber
    }
    
    mutating func calculateEachPersonAmount(userInput :Float){
        eachPersonAmount = (userInput)*(tipAmount ?? 0.0 + 1)/Float(splitNumber ?? 2)
    }
    
    func returnEachPersonAmount() -> Float{
        return eachPersonAmount ?? 0.0
    }
    
    func returnAdvice() -> String{
        let percentage :String
        if(tipAmount == 0.2){
            percentage = "20%"
        }
        else if(tipAmount == 0.1){
            percentage = "10%"
        }
        else{
            percentage = "0%"
        }
        return "Split between \(splitNumber ?? 2) people, with \(percentage) tip."
    }
}
