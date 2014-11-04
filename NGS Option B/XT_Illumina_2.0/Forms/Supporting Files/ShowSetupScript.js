{ // Set form CheckSum to verify ready to run protocol
    for (var i = 1; i<=8; i++){
        if ( ( eval("typeof formSourceFile"+i))== "undefined" ){
            eval('formSourceFile'+i+' = ""')
        }else if ( i > formNumberOfSources ){
            eval('formSourceFile'+i+' = ""')
        }
        if ( ( eval("typeof formSourceID"+i))== "undefined" ){
            eval('formSourceID'+i+' = ""')
        }else if ( i > formNumberOfSources ){
            eval('formSourceID'+i+' = ""')
            }
    }
    formCheckSum = ""+formNumberOfSources+formDestID+formSourceFile1+formSourceID1+formSourceFile2+formSourceID2+formSourceFile3+formSourceID3+formSourceFile4+formSourceID4+formSourceFile5+formSourceID5+formSourceFile6+formSourceID6+formSourceFile7+formSourceID7+formSourceFile8+formSourceID8
}

{ // Count the source plates and check file entry
    source_counter = 0
    for (var i = 1; i<=8; i++){
        if ( ( eval("typeof formSourceFile"+i))== "undefined" ){
            print("No File Selected: Skipping Source file "+i)
        }else if  (/\b.csv/.test(eval("formSourceFile"+i))){
            source_counter++
            last_source = i
        } else print("Not a .csv File: Skipping Source File " +i)
    }
        if (source_counter == 0) {
            print("Please enter at least 1 source file.")
            formCheckSum = ""
        }else if (source_counter != last_source){
            print("Please re-enter source files to be a continuous list")
            formCheckSum = ""
        } 
    print("Number of Sources = "+source_counter)
} 
    
{ // Clear previous setup details
    formMasterInputFile = ""
    formCass1Slot1 = ""
    formCass1Slot2 = ""
    formCass1Slot3 = ""
    formCass1Slot4 = ""
    formCass1Slot5 = ""
    formCass2Slot1 = ""
    formCass2Slot2 = ""
    formCass2Slot3 = ""
    formCass2Slot4 = ""
    formCass2Slot5 = ""
    formCass3Slot1 = ""
    formCass3Slot2 = ""
    formCass3Slot3 = ""
    formCass3Slot4 = ""
    formCass3Slot5 = ""
    formCass4Slot1 = ""
    formCass4Slot2 = ""
    formCass4Slot3 = ""
    formCass4Slot4 = ""
    formCass4Slot5 = ""
    formBravoPos1  = "" 
    formBravoPos2  = "" 
    formBravoPos3  = "" 
    formBravoPos4  = "" 
    formBravoPos5  = "" 
    formBravoPos6  = "" 
    formBravoPos7  = "" 
    formBravoPos8  = "" 
    formBravoPos9  = "" 
    formStacker1 = ""
    formStacker2 = ""
    formStacker3 = ""
    formStacker4 = ""
}

{ // Display Current setup details    
    formBravoPos5  = "Destination Plate: "+formDestID
    formBravoPos6  = "Empty Tip Box"
	formBravo9Temp = "0°C"
    
    if (formNumberOfSources==1) formTipBoxText = " Tip Box"
    else formTipBoxText = " Tip Boxes"
    formStacker1 = ""+ formNumberOfSources + formTipBoxText
    
    if (formPromptForSources) formBravoPos3  = "Source Plate Loading Position"
    else{ 
        for (var i = 1; i<=formNumberOfSources; i++){
            if ( i == 1 ) formCass1Slot1 = "Source Plate 1: "+formSourceID1 
            if ( i == 2 ) formCass1Slot2 = "Source Plate 2: "+formSourceID2 
            if ( i == 3 ) formCass1Slot3 = "Source Plate 3: "+formSourceID3 
            if ( i == 4 ) formCass1Slot4 = "Source Plate 4: "+formSourceID4 
            if ( i == 5 ) formCass1Slot5 = "Source Plate 5: "+formSourceID5 
            if ( i == 6 ) formCass2Slot1 = "Source Plate 6: "+formSourceID6 
            if ( i == 7 ) formCass2Slot2 = "Source Plate 7: "+formSourceID7 
            if ( i == 8 ) formCass2Slot3 = "Source Plate 8: "+formSourceID8 
        }
    }
}