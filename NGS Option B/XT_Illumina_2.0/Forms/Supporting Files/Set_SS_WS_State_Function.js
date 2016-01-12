function set_initial_state(functionProtocolName, function_columns_samples){
switch(functionProtocolName){
    case "SPRI_XT_Illumina_v2.0.pro":{
        formCass1Slot1 = "";
        formCass1Slot2 = "";
        formCass1Slot3 = "";
        formCass1Slot4 = "";
        formCass1Slot5 = "Empty Nunc DeepWell Plate";
        formCass2Slot1 = "70% Ethanol Reservoir";
        formCass2Slot2 = "Nuclease-free Water Reservoir";
        formCass2Slot3 = "Empty Eppendorf Twin.tec Plate";
        formCass2Slot4 = "";
        formCass2Slot5 = "";
        formCass3Slot1 = "";
        formCass3Slot2 = "AmpureXP Beads in Nunc DeepWell";
        formCass3Slot3 = "";
        formCass3Slot4 = "";
        formCass3Slot5 = "";
        formCass4Slot1 = "Empty Tip Box";
        formCass4Slot2 = "";
        formCass4Slot3 = "";
        formCass4Slot4 = "";
        formCass4Slot5 = "";
        formBravoPos1  = "Waste Reservoir (Axygen 96DW)";
        formBravoPos2  = "";
        formBravoPos3  = "";
        formBravoPos4  = "";
        formBravoPos5  = "";
        formBravoPos6  = "";
        formBravoPos7  = "";
        formBravoPos8  = "";
        formBravoPos9  = "DNA for Cleanup in PCR Plate          (Set labware in 2)";
		formBravo4Temp = "RT"
		formBravo6Temp = "RT"
		formBravo9Temp = "0°C"
       
        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = "2 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = "2 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = "3 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = "6 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 12 Columns")
                break;
            default: 
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                formStacker3 = "Enter Column Number"
                formStacker4 = "Enter Column Number"
                break;
        }break;
    }
    // **************************************Next**************************************
    // ************************************Protocol************************************
    case "LibraryPrep_XT_Illumina_v2.0.rst":{
        formCass1Slot1 = "New Tip Box";
        formCass1Slot2 = "Empty Tip Box";
        formCass1Slot3 = "";
        formCass1Slot4 = "";
        formCass1Slot5 = "";
        formCass2Slot1 = "70% Ethanol Reservoir";
        formCass2Slot2 = "Nuclease-free Water Reservoir";
        formCass2Slot3 = "";
        formCass2Slot4 = "Empty Eppendorf Twin.tec Plate";
        formCass2Slot5 = "Empty Nunc DeepWell Plate";
        formCass3Slot1 = "";
        formCass3Slot2 = "AmpureXP Beads in Nunc DeepWell";
        formCass3Slot3 = "Empty Eppendorf Twin.tec Plate";
        formCass3Slot4 = "Empty Eppendorf Twin.tec Plate";
        formCass3Slot5 = "Empty Nunc DeepWell Plate";
        formCass4Slot1 = "Empty Tip Box";
        formCass4Slot2 = "";
        formCass4Slot3 = "";
        formCass4Slot4 = "";
        formCass4Slot5 = "Index Adapters (Twin.tec)";
        formBravoPos1  = "Waste Reservoir (Axygen 96DW)";
        formBravoPos2  = "";
        formBravoPos3  = "";
        formBravoPos4  = "";
        formBravoPos5  = "";
        formBravoPos6  = "Empty Eppendorf Twin.tec Plate";
        formBravoPos7  = "Sheared DNA Plate (Twin.tec)";
        formBravoPos8  = "";
        formBravoPos9  = "Nunc Master Mix Plate (Col 1-3) on Silver Insert";
		formBravo4Temp = "RT"
		formBravo6Temp = "4°C"
		formBravo9Temp = "0°C"
       
        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = "2 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = "3 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = "4 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = "5 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = "7 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = "11 Tip Boxes"
                formStacker2 = "3 Tip Boxes"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 12 Columns")
                break;
            default: 
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                formStacker3 = "Enter Column Number"
                formStacker4 = "Enter Column Number"
                break;
        }break;
    }
    // **************************************Next**************************************
    // ************************************Protocol************************************
    case "LibraryPrep_XT_Illumina_v2.1.rst":{
        formCass1Slot1 = "New Tip Box";
        formCass1Slot2 = "Empty Tip Box";
        formCass1Slot3 = "";
        formCass1Slot4 = "";
        formCass1Slot5 = "";
        formCass2Slot1 = "70% Ethanol Reservoir";
        formCass2Slot2 = "Nuclease-free Water Reservoir";
        formCass2Slot3 = "";
        formCass2Slot4 = "Empty Eppendorf Twin.tec Plate";
        formCass2Slot5 = "Empty Nunc DeepWell Plate";
        formCass3Slot1 = "PEG in Nunc DeepWell";
        formCass3Slot2 = "AmpureXP Beads in Nunc DeepWell";
        formCass3Slot3 = "Empty Eppendorf Twin.tec Plate";
        formCass3Slot4 = "Empty Eppendorf Twin.tec Plate";
        formCass3Slot5 = "Empty Nunc DeepWell Plate";
        formCass4Slot1 = "Empty Tip Box";
        formCass4Slot2 = "";
        formCass4Slot3 = "";
        formCass4Slot4 = "";
        formCass4Slot5 = "Index Adapters (Twin.tec)";
        formBravoPos1  = "Waste Reservoir (Axygen 96DW)";
        formBravoPos2  = "";
        formBravoPos3  = "";
        formBravoPos4  = "";
        formBravoPos5  = "";
        formBravoPos6  = "Empty Eppendorf Twin.tec Plate";
        formBravoPos7  = "Sheared DNA Plate (Twin.tec)";
        formBravoPos8  = "";
        formBravoPos9  = "Nunc Master Mix Plate (Col 1-3) on Silver Insert";
		formBravo4Temp = "RT"
		formBravo6Temp = "RT"
		formBravo9Temp = "0°C"
       
        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = "2 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = "3 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = "4 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = "5 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = "7 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = "11 Tip Boxes"
                formStacker2 = "3 Tip Boxes"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 12 Columns")
                break;
            default: 
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                formStacker3 = "Enter Column Number"
                formStacker4 = "Enter Column Number"
                break;
        }break;
    }
    // **************************************Next**************************************
    // ************************************Protocol************************************
    case "Pre-CapturePCR_XT_Illumina_v2.0.pro":{
        formCass1Slot1 = "Clean Tip Box (from Library Prep)";
        formCass1Slot2 = "Waste Tip Box (from Library Prep)";
        formCass1Slot3 = "";
        formCass1Slot4 = "";
        formCass1Slot5 = "";
        formCass2Slot1 = "";
        formCass2Slot2 = "";
        formCass2Slot3 = "";
        formCass2Slot4 = "";
        formCass2Slot5 = "";
        formCass3Slot1 = "";
        formCass3Slot2 = "";
        formCass3Slot3 = "";
        formCass3Slot4 = "";
        formCass3Slot5 = "";
        formCass4Slot1 = "Empty Tip Box";
        formCass4Slot2 = "";
        formCass4Slot3 = "";
        formCass4Slot4 = "";
        formCass4Slot5 = "";
        formBravoPos1  = "";
        formBravoPos2  = "";
        formBravoPos3  = "";
        formBravoPos4  = "";
        formBravoPos5  = "";
        formBravoPos6  = "Empty PCR Plate (Set labware in 2)";
        formBravoPos7  = "DNA Plate: Adapter-ligated library(Twin.tec)";
        formBravoPos8  = "";
        formBravoPos9  = "Nunc Master Mix Plate (Col 4) on Silver Insert";
		formBravo4Temp = "RT"
		formBravo6Temp = "4°C"
		formBravo9Temp = "0°C"
       
        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 12 Columns")
                break;
            default: 
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                formStacker3 = "Enter Column Number"
                formStacker4 = "Enter Column Number"
                break;
        }break;
    }
    // **************************************Next**************************************
    // ************************************Protocol************************************
    case "500ng_v2.0.pro":{
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
        formBravoPos1  = "";
        formBravoPos2  = "";
        formBravoPos3  = "";
        formBravoPos4  = "";
        formBravoPos5  = "Prepped Library in Eppendorf Twin.tec Plate";
        formBravoPos6  = "Empty Tip Box";
        formBravoPos7  = "";
        formBravoPos8  = "New Tip Box";
        formBravoPos9  = "Empty PCR Plate (Set labware in 2)";
		formBravo4Temp = "RT"
		formBravo6Temp = "RT"
		formBravo9Temp = "0°C"
          
        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 12 Columns")
                break;
            default: 
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                formStacker3 = "Enter Column Number"
                formStacker4 = "Enter Column Number"
                break;
        }break;
    }
    // **************************************Next**************************************
    // ************************************Protocol************************************
    case "Hybridization_MMCol_v2.0.pro":{
        formCass1Slot1 = "";
        formCass1Slot2 = "";
        formCass1Slot3 = "";
        formCass1Slot4 = "";
        formCass1Slot5 = "";
        formCass2Slot1 = "";
        formCass2Slot2 = "";
        formCass2Slot3 = "";
        formCass2Slot4 = "";
        formCass2Slot5 = "";
        formCass3Slot1 = "";
        formCass3Slot2 = "";
        formCass3Slot3 = "";
        formCass3Slot4 = "";
        formCass3Slot5 = "";
        formCass4Slot1 = "";
        formCass4Slot2 = "Empty Tip Box";
        formCass4Slot3 = "";
        formCass4Slot4 = "";
        formCass4Slot5 = "";
        formBravoPos1  = "";
        formBravoPos2  = "";
        formBravoPos3  = "";
        formBravoPos4  = "PCR plate (Set labware in 2)";
        formBravoPos5  = "Empty Eppendorf Twin.tec Plate";
        formBravoPos6  = "Nunc Master Mix Plate (Col 1-3) on Silver Insert";
        formBravoPos7  = "";
        formBravoPos8  = "Empty Tip Box";
        formBravoPos9  = "Pooled DNA Stock Plate in Eppendorf Twin.tec Plate";
		formBravo4Temp = "RT"
		formBravo6Temp = "RT"
		formBravo9Temp = "0°C"
       
        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = "2 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = "2 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = "2 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = "2 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = "3 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = "4 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 12 Columns")
                break;
            default: 
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                formStacker3 = "Enter Column Number"
                formStacker4 = "Enter Column Number"
                break;
        }break;
    }
    // **************************************Next**************************************
    // ************************************Protocol************************************
    case "Hybridization_MMRow_v2.0.pro":{
        formCass1Slot1 = "";
        formCass1Slot2 = "";
        formCass1Slot3 = "";
        formCass1Slot4 = "";
        formCass1Slot5 = "";
        formCass2Slot1 = "";
        formCass2Slot2 = "";
        formCass2Slot3 = "";
        formCass2Slot4 = "";
        formCass2Slot5 = "";
        formCass3Slot1 = "";
        formCass3Slot2 = "";
        formCass3Slot3 = "";
        formCass3Slot4 = "";
        formCass3Slot5 = "";
        formCass4Slot1 = "";
        formCass4Slot2 = "";
        formCass4Slot3 = "";
        formCass4Slot4 = "";
        formCass4Slot5 = "";
        formBravoPos1  = "Empty Tip Box";
        formBravoPos2  = "";
        formBravoPos3  = "";
        formBravoPos4  = "PCR plate (Set labware in 2)";
        formBravoPos5  = "Empty Eppendorf Twin.tec Plate";
        formBravoPos6  = "Nunc Master Mix Plate (Row 1-3) on Silver Insert";
        formBravoPos7  = "";
        formBravoPos8  = "";
        formBravoPos9  = "Pooled DNA Stock Plate in Eppendorf Twin.tec Plate";
		formBravo4Temp = "RT"
		formBravo6Temp = "RT"
		formBravo9Temp = "0°C"
       
        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = "1 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = "1 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = "2 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = "2 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = "3 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = "5 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 12 Columns")
                break;
            default: 
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                formStacker3 = "Enter Column Number"
                formStacker4 = "Enter Column Number"
                break;
        }break;
    }
    // **************************************Next**************************************
    // ************************************Protocol************************************
	    case "SureSelectCapture&Wash_v2.0.rst":{
        formCass1Slot1 = "";
        formCass1Slot2 = "";
        formCass1Slot3 = "Empty Eppendorf Twin.tec Plate";
        formCass1Slot4 = "";
        formCass1Slot5 = "";
        formCass2Slot1 = "";
        formCass2Slot2 = "Nuclease-free Water Reservoir";
        formCass2Slot3 = "";
        formCass2Slot4 = "";
        formCass2Slot5 = "";
        formCass3Slot1 = "";
        formCass3Slot2 = "";
        formCass3Slot3 = "Wash #1:   Twin.tec Plate";
        formCass3Slot4 = "";
        formCass3Slot5 = "";
        formCass4Slot1 = "Empty Tip Box";
        formCass4Slot2 = "";
        formCass4Slot3 = "";
        formCass4Slot4 = "";
        formCass4Slot5 = "";
        formBravoPos1  = "Waste Reservoir (Axygen 96DW)";
        formBravoPos2  = "";
        formBravoPos3  = "";
        formBravoPos4  = "Red Aluminum  PCR Plate Insert (Set labware in 2)";
        formBravoPos5  = "Dynabeads: Nunc DW source plate";
        formBravoPos6  = "Wash #2: Nunc DW source on Silver Insert";
        formBravoPos7  = "";
        formBravoPos8  = "";
        formBravoPos9  = "";
		formBravo4Temp = "66°C"
		formBravo6Temp = "RT"
		formBravo9Temp = "RT"
       
        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = "2 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = "3 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = "4 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = "6 Tip Boxes"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = "10 Tip Boxes"
                formStacker2 = "2 Tip Boxes"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 12 Columns")
                break;
            default: 
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                formStacker3 = "Enter Column Number"
                formStacker4 = "Enter Column Number"
                break;
        }break;
    }
    // **************************************Next**************************************
    // ************************************Protocol************************************
    case "Post-CaptureOnBeadPCR_XT_Illumina_v2.0.pro":{
         formCass1Slot1 = "New Tip Box";
        formCass1Slot2 = "Empty Tip Box";
        formCass1Slot3 = "";
        formCass1Slot4 = "";
        formCass1Slot5 = "";
        formCass2Slot1 = "";
        formCass2Slot2 = "";
        formCass2Slot3 = "";
        formCass2Slot4 = "";
        formCass2Slot5 = "";
        formCass3Slot1 = "";
        formCass3Slot2 = "";
        formCass3Slot3 = "";
        formCass3Slot4 = "";
        formCass3Slot5 = "";
        formCass4Slot1 = "Empty Tip Box";
        formCass4Slot2 = "";
        formCass4Slot3 = "";
        formCass4Slot4 = "";
        formCass4Slot5 = "";
        formBravoPos1  = "";
        formBravoPos2  = "";
        formBravoPos3  = "";
        formBravoPos4  = "";
        formBravoPos5  = "DNA  Plate: Captured Library (Twin.tec)";
        formBravoPos6  = "Empty PCR Plate (Set labware in 2)";
        formBravoPos7  = "";
        formBravoPos8  = "";
        formBravoPos9  = "Nunc Master Mix Plate (Col 4) on Silver Insert";
		formBravo4Temp = "RT"
		formBravo6Temp = "4°C"
		formBravo9Temp = "0°C"
       
        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                formStacker3 = "Empty"
                formStacker4 = "Empty"
                print("Case: 12 Columns")
                break;
            default: 
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                formStacker3 = "Enter Column Number"
                formStacker4 = "Enter Column Number"
                break;
        }break;
    }
    // **************************************Next**************************************
    // ************************************Protocol************************************
    case "Empty":{
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
		formBravo4Temp = ""
		formBravo6Temp = ""
		formBravo9Temp = ""
       
        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 12 Columns")
                break;
            default: 
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                formStacker3 = "Enter Column Number"
                formStacker4 = "Enter Column Number"
                break;
        }break;
    }
    // **************************************Next**************************************
    // ************************************Protocol************************************
    default:{
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
		formBravo4Temp = ""
		formBravo6Temp = ""
		formBravo9Temp = ""
       
        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = ""
                formStacker2 = ""
                formStacker3 = ""
                formStacker4 = ""
                print("Case: 12 Columns")
                break;
            default: 
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                formStacker3 = "Enter Column Number"
                formStacker4 = "Enter Column Number"
                break;
        }break;
    }
}

}