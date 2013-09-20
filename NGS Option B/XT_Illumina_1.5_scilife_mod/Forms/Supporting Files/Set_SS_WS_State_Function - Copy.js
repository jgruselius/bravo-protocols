/* 
 2012-12 A modified version of Agilent's original
 NOTE: VWorks can't handle form variables being set 
 to " " or "-" (and possibly others)
*/
function set_initial_state(context, functionProtocolName, function_columns_samples) {
    var props = [
        "formCass1Slot1",
        "formCass1Slot2",
        "formCass1Slot3",
        "formCass1Slot4",
        "formCass1Slot5",
        "formCass2Slot1",
        "formCass2Slot2",
        "formCass2Slot3",
        "formCass2Slot4",
        "formCass2Slot5",
        "formCass3Slot1",
        "formCass3Slot2",
        "formCass3Slot3",
        "formCass3Slot4",
        "formCass3Slot5",
        "formCass4Slot1",
        "formCass4Slot2",
        "formCass4Slot3",
        "formCass4Slot4",
        "formCass4Slot5",
        "formBravoPos1",
        "formBravoPos2",
        "formBravoPos3",
        "formBravoPos4",
        "formBravoPos5",
        "formBravoPos6",
        "formBravoPos7",
        "formBravoPos8",
        "formBravoPos9",
        "formBravo4Temp",
        "formBravo6Temp",
        "formBravo9Temp"
    ];
    /*
    for(prop in context) {
        print(prop);
    }
    */
    switch(functionProtocolName) {
        case "AMPureXP_XT_Illumina_v1.5.pro":
            formCass1Slot5 = "Empty Nunc DeepWell Plate";
            formCass2Slot1 = "70% Ethanol Reservoir";
            formCass2Slot2 = "Nuclease-free Water Reservoir";
            formCass2Slot3 = "Empty Eppendorf Twin.tec Plate";
            formCass3Slot2 = "AmpureXP Beads in Nunc DeepWell";
            formBravoPos1  = "Waste Reservoir (ABgene)";
            formBravoPos4  = "DNA Plate for Cleanup (set in Parameter 2)";
            formBravoPos8  = "Empty Tip Box";
            formBravo4Temp = "4°C";
            formBravo6Temp = "RT";
            formBravo9Temp = "RT";
           
            print("Number of Columns selected is "+function_columns_samples);
            
            switch (function_columns_samples) {
                case 1:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 1 Columns");
                    break;
                case 2:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 2 Columns");
                    break;
                case 3:
                    formStacker1 = "2 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 3 Columns");
                    break;
                case 4:
                    formStacker1 = "2 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 4 Columns");
                    break;
                case 6:
                    formStacker1 = "3 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 6 Columns");
                    break;
                case 12:
                    formStacker1 = "6 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 12 Columns");
                    break;
                default: 
                    formStacker1 = "Enter Column Number";
                    formStacker2 = "Enter Column Number";
                    formStacker3 = "Enter Column Number";
                    formStacker4 = "Enter Column Number";
                    break;
            }
        break;
//***************************************Next***********************************
//*************************************Protocol*********************************
        case "LibraryPrep_XT_Illumina_v1.5.rst":
            formCass1Slot1 = "New Tip Box";
            formCass1Slot2 = "Empty Tip Box";
            formCass1Slot5 = "Empty Nunc DeepWell Plate";
            formCass2Slot1 = "70% Ethanol Reservoir";
            formCass2Slot2 = "Nuclease-free Water Reservoir";
            formCass2Slot4 = "Empty Eppendorf Twin.tec Plate";
            formCass2Slot5 = "Empty Nunc DeepWell Plate";
            formCass3Slot2 = "AmpureXP Beads in Nunc DeepWell";
            formCass3Slot4 = "Empty Eppendorf Twin.tec Plate";
            formCass3Slot5 = "Empty Nunc DeepWell Plate";
            formCass4Slot1 = "Empty Tip Box";
            formCass4Slot3 = "Empty Eppendorf Twin.tec Plate";
            formBravoPos1  = "Waste Reservoir (ABgene)";
            formBravoPos6  = "Empty Eppendorf Twin.tec Plate";
            formBravoPos7  = "DNA Plate from Cleanup (Twin.tec)";
            formBravoPos9  = "Nunc MasterMix Plate (Col 1-3)";
            formBravo4Temp = "20°C";
            formBravo6Temp = "4°C";
            formBravo9Temp = "0°C";
           
            print("Number of Columns selected is "+function_columns_samples);
            
            switch (function_columns_samples) {
                case 1:
                    formStacker1 = "2 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 1 Columns");
                    break;
                case 2:
                    formStacker1 = "4 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 2 Columns");
                    break;
                case 3:
                    formStacker1 = "5 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 3 Columns");
                    break;
                case 4:
                    formStacker1 = "7 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 4 Columns");
                    break;
                case 6:
                    formStacker1 = "10 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 6 Columns");
                    break;
                case 12:
                    formStacker1 = "11 Tip Boxes";
                    formStacker2 = "8 Tip Boxes";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 12 Columns");
                    break;
                default: 
                    formStacker1 = "Enter Column Number";
                    formStacker2 = "Enter Column Number";
                    formStacker3 = "Enter Column Number";
                    formStacker4 = "Enter Column Number";
                    break;
            }
        break;
//***************************************Next***********************************
//*************************************Protocol*********************************
        case "Pre-CapturePCR_XT_Illumina_v1.5.pro":
            formCass1Slot1 = "Clean Tip Box (from Library Prep)";
            formCass1Slot2 = "Waste Tip Box (from Library Prep)";
            formCass4Slot1 = "Empty Tip Box";
            formCass4Slot5 = "Empty Eppendorf Twin.tec Plate";
            formBravoPos7  = "DNA Plate: Adapter-ligated library (Twin.tec)";
            formBravoPos9  = "Nunc MasterMix Plate (Col 1)";
            formBravo4Temp = "RT";
            formBravo6Temp = "4°C";
            formBravo9Temp = "0°C";
           
            print("Number of Columns selected is "+function_columns_samples);
            switch (function_columns_samples) {
                case 1:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 1 Columns");
                    break;
                case 2:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 2 Columns");
                    break;
                case 3:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 3 Columns");
                    break;
                case 4:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 4 Columns");
                    break;
                case 6:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 6 Columns");
                    break;
                case 12:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 12 Columns");
                    break;
                default: 
                    formStacker1 = "Enter Column Number";
                    formStacker2 = "Enter Column Number";
                    formStacker3 = "Enter Column Number";
                    formStacker4 = "Enter Column Number";
                    break;
            }
        break;
//***************************************Next***********************************
//*************************************Protocol*********************************
        case "Aliquot_Libraries_v1.5.pro":
            formBravoPos5  = "Empty Eppendorf Twin.tec Plate";
            formBravoPos6  = "Empty Tip Box";
            formBravoPos8  = "New Tip Box";
            formBravoPos9  = "Prepped library in Eppendorf twin.tec plate";
            formBravo4Temp = "RT";
            formBravo6Temp = "RT";
            formBravo9Temp = "0°C";
       
           
            print("Number of Columns selected is "+function_columns_samples);
            
            switch (function_columns_samples) {
                case 1:
                    formStacker1 = "Empty";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 1 Columns");
                    break;
                case 2:
                    formStacker1 = "Empty";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 2 Columns");
                    break;
                case 3:
                    formStacker1 = "Empty";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 3 Columns");
                    break;
                case 4:
                    formStacker1 = "Empty";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 4 Columns");
                    break;
                case 6:
                    formStacker1 = "Empty";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 6 Columns");
                    break;
                case 12:
                    formStacker1 = "Empty";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 12 Columns");
                    break;
                default: 
                    formStacker1 = "Enter Column Number";
                    formStacker2 = "Enter Column Number";
                    formStacker3 = "Enter Column Number";
                    formStacker4 = "Enter Column Number";
                    break;
            }
        break;
//***************************************Next***********************************
//*************************************Protocol*********************************
        case "Hybridization_v1.5.pro":
            formCass1Slot2 = "Empty Tip Box";
            formBravoPos5  = "Eppendorf Twin.tec Plate: 750ng gDNA Aliquots";
            formBravoPos6  = "Empty Eppendorf Twin.tec Plate";
            formBravoPos8  = "Empty Tip Box";
            formBravoPos9  = "Eppendorf Master Mix Plate (Col 1-3)";
            formBravo4Temp = "RT";
            formBravo6Temp = "RT";
            formBravo9Temp = "RT";
           
            print("Number of Columns selected is "+function_columns_samples);
            
            switch (function_columns_samples) {
                case 1:
                    formStacker1 = "2 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 1 Columns");
                    break;
                case 2:
                    formStacker1 = "2 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 2 Columns");
                    break;
                case 3:
                    formStacker1 = "2 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 3 Columns");
                    break;
                case 4:
                    formStacker1 = "3 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 4 Columns");
                    break;
                case 6:
                    formStacker1 = "3 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 6 Columns");
                    break;
                case 12:
                    formStacker1 = "5 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 12 Columns");
                    break;
                default: 
                    formStacker1 = "Enter Column Number";
                    formStacker2 = "Enter Column Number";
                    formStacker3 = "Enter Column Number";
                    formStacker4 = "Enter Column Number";
                    break;
            }
        break;
//***************************************Next***********************************
//*************************************Protocol*********************************
        case "SureSelectCapture&Wash_v1.5.rst":
            formCass1Slot3 = "Empty Eppendorf Twin.tec Plate";
            formCass2Slot2 = "Nuclease-free Water Reservoir";
            formCass3Slot3 = "Wash #1:   Twin.tec Plate";
            formCass4Slot1 = "Empty Tip Box";
            formBravoPos1  = "Waste Reservoir (ABgene)";
            formBravoPos4  = "Red Adaptor Block";
            formBravoPos5  = "Dynabeads: Nunc DW source plate";
            formBravoPos6  = "Wash #2: Nunc DW source on Silver Insert";
            formBravo4Temp = "69°C";
            formBravo6Temp = "RT";
            formBravo9Temp = "RT";
           
            print("Number of Columns selected is "+function_columns_samples);
            
            switch (function_columns_samples) {
                case 1:
                    formStacker1 = "2 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 1 Columns");
                    break;
                case 2:
                    formStacker1 = "3 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 2 Columns");
                    break;
                case 3:
                    formStacker1 = "4 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 3 Columns");
                    break;
                case 4:
                    formStacker1 = "5 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 4 Columns");
                    break;
                case 6:
                    formStacker1 = "7 Tip Boxes";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 6 Columns");
                    break;
                case 12:
                    formStacker1 = "10 Tip Boxes";
                    formStacker2 = "3 Tip Boxes";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 12 Columns");
                    break;
                default: 
                    formStacker1 = "Enter Column Number";
                    formStacker2 = "Enter Column Number";
                    formStacker3 = "Enter Column Number";
                    formStacker4 = "Enter Column Number";
                    break;
            }
        break;
//***************************************Next***********************************
//*************************************Protocol*********************************
        case "Post-CaptureIndexing_XT_Illumina_v1.5.pro":
            formCass1Slot1 = "New Tip Box";
            formCass1Slot2 = "Empty Tip Box";
            formCass4Slot1 = "Empty Tip Box";
            formCass4Slot5 = "Indexing Primers (Eppendorf Twin.tec Plate)";
            formBravoPos4  = "Captured DNA Samples in Twin.tec Plate";
            formBravoPos9  = "Nunc MasterMix Plate (Col 1)";
            formBravo4Temp = "4°C";
            formBravo6Temp = "4°C";
            formBravo9Temp = "0°C";
           
            print("Number of Columns selected is "+function_columns_samples);
            
            switch (function_columns_samples) {
                case 1:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 1 Columns");
                    break;
                case 2:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 2 Columns");
                    break;
                case 3:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 3 Columns");
                    break;
                case 4:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 4 Columns");
                    break;
                case 6:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 6 Columns");
                    break;
                case 12:
                    formStacker1 = "1 Tip Box";
                    formStacker2 = "Empty";
                    formStacker3 = "Empty";
                    formStacker4 = "Empty";
                    print("Case: 12 Columns");
                    break;
                default: 
                    formStacker1 = "Enter Column Number";
                    formStacker2 = "Enter Column Number";
                    formStacker3 = "Enter Column Number";
                    formStacker4 = "Enter Column Number";
                    break;
            }
        break;
//***************************************Next***********************************
//*************************************Protocol*********************************
        case "Empty":
            formCass1Slot1 = "–";
            formCass1Slot2 = "–";
            formCass1Slot3 = "–";
            formCass1Slot4 = "–";
            formCass1Slot5 = "–";
            formCass2Slot1 = "–";
            formCass2Slot2 = "–";
            formCass2Slot3 = "–";
            formCass2Slot4 = "–";
            formCass2Slot5 = "–";
            formCass3Slot1 = "–";
            formCass3Slot2 = "–";
            formCass3Slot3 = "–";
            formCass3Slot4 = "–";
            formCass3Slot5 = "–";
            formCass4Slot1 = "–";
            formCass4Slot2 = "–";
            formCass4Slot3 = "–";
            formCass4Slot4 = "–";
            formCass4Slot5 = "–";
            formBravoPos1 = "–";
            formBravoPos2 = "–";
            formBravoPos3 = "–";
            formBravoPos4 = "–";
            formBravoPos5 = "–";
            formBravoPos6 = "–";
            formBravoPos7 = "–";
            formBravoPos8 = "–";
            formBravoPos9 = "–";
            formBravo4Temp = "–";
            formBravo6Temp = "–";
            formBravo9Temp = "–";
           
            print("Number of Columns selected is "+function_columns_samples);

             switch (function_columns_samples) {
                case 1:
                    formStacker1 = "–";
                    formStacker2 = "–";
                    formStacker3 = "–";
                    formStacker4 = "–";
                    print("Case: 1 Columns");
                    break;
                case 2:
                    formStacker1 = "–";
                    formStacker2 = "–";
                    formStacker3 = "–";
                    formStacker4 = "–";
                    print("Case: 2 Columns");
                    break;
                case 3:
                    formStacker1 = "–";
                    formStacker2 = "–";
                    formStacker3 = "–";
                    formStacker4 = "–";
                    print("Case: 3 Columns");
                    break;
                case 4:
                    formStacker1 = "–";
                    formStacker2 = "–";
                    formStacker3 = "–";
                    formStacker4 = "–";
                    print("Case: 4 Columns");
                    break;
                case 6:
                    formStacker1 = "–";
                    formStacker2 = "–";
                    formStacker3 = "–";
                    formStacker4 = "–";
                    print("Case: 6 Columns");
                    break;
                case 12:
                    formStacker1 = "–";
                    formStacker2 = "–";
                    formStacker3 = "–";
                    formStacker4 = "–";
                    print("Case: 12 Columns");
                    break;
                default: 
                    formStacker1 = "Enter Column Number";
                    formStacker2 = "Enter Column Number";
                    formStacker3 = "Enter Column Number";
                    formStacker4 = "Enter Column Number";
                    break;
            }
        break;
//***************************************Next***********************************
//*************************************Protocol*********************************
        default:
            formCass1Slot1 = "–";
            formCass1Slot2 = "–";
            formCass1Slot3 = "–";
            formCass1Slot4 = "–";
            formCass1Slot5 = "–";
            formCass2Slot1 = "–";
            formCass2Slot2 = "–";
            formCass2Slot3 = "–";
            formCass2Slot4 = "–";
            formCass2Slot5 = "–";
            formCass3Slot1 = "–";
            formCass3Slot2 = "–";
            formCass3Slot3 = "–";
            formCass3Slot4 = "–";
            formCass3Slot5 = "–";
            formCass4Slot1 = "–";
            formCass4Slot2 = "–";
            formCass4Slot3 = "–";
            formCass4Slot4 = "–";
            formCass4Slot5 = "–";
            formBravoPos1 = "–";
            formBravoPos2 = "–";
            formBravoPos3 = "–";
            formBravoPos4 = "–";
            formBravoPos5 = "–";
            formBravoPos6 = "–";
            formBravoPos7 = "–";
            formBravoPos8 = "–";
            formBravoPos9 = "–";
            formBravo4Temp = "–";
            formBravo6Temp = "–";
            formBravo9Temp = "–";
           
            print("Number of Columns selected is "+function_columns_samples);
            
            switch (function_columns_samples) {
                case 1:
                    formStacker1 = "–";
                    formStacker2 = "–";
                    formStacker3 = "–";
                    formStacker4 = "–";
                    print("Case: 1 Columns");
                    break;
                case 2:
                    formStacker1 = "–";
                    formStacker2 = "–";
                    formStacker3 = "–";
                    formStacker4 = "–";
                    print("Case: 2 Columns");
                    break;
                case 3:
                    formStacker1 = "–";
                    formStacker2 = "–";
                    formStacker3 = "–";
                    formStacker4 = "–";
                    print("Case: 3 Columns");
                    break;
                case 4:
                    formStacker1 = "–";
                    formStacker2 = "–";
                    formStacker3 = "–";
                    formStacker4 = "–";
                    print("Case: 4 Columns");
                    break;
                case 6:
                    formStacker1 = "–";
                    formStacker2 = "–";
                    formStacker3 = "–";
                    formStacker4 = "–";
                    print("Case: 6 Columns");
                    break;
                case 12:
                    formStacker1 = "–";
                    formStacker2 = "–";
                    formStacker3 = "–";
                    formStacker4 = "–";
                    print("Case: 12 Columns");
                    break;
                default: 
                    formStacker1 = "Enter Column Number";
                    formStacker2 = "Enter Column Number";
                    formStacker3 = "Enter Column Number";
                    formStacker4 = "Enter Column Number";
                    break;
            }
        break;
    }
}