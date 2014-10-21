// * * * * * * * Function Definition * * * * * * * * * * *
// This function opens the given file, reads the contents,
//  and closes the file.
//
// Parameters:
//   STRING filepath - complete path to file to open
//
// Returns:
//   STRING of contents of file.
// * * * * * * * * * * * * * * * * * * * * * * * * * * * *
function file_read( filepath )
{
    // Declare file object.
    var file_obj = new File();
    var file_contents = "";

    // Opens, Reads, Closes file.
    file_obj.Open( filepath );
    file_contents = file_obj.Read();
    file_obj.Close();
    return file_contents;
} // end function file_read.


// * * * * * * * Function Definition * * * * * * * * * * *
// This function opens the given file, writes the given
//  contents (appends to file), and closes the file.
//
// Parameters:
//   STRING filepath - complete path to file to open
//   STRING contents - contents to write to file
//
// Returns:
//   None.
// * * * * * * * * * * * * * * * * * * * * * * * * * * * *
function file_write( filepath, contents )
{
    // Declare file object
    var file_obj = new File();

    // Opens, Writes, and Closes file.
    file_obj.Open( filepath );
    file_obj.Write( contents+"\n" );
    file_obj.Close();

    return;
} // end function file_write.


// * * * * * * * Function Definition * * * * * * * * * * *
// This function opens the given file, writes the given
//  contents (overwrites file), and closes the file.
//
// Parameters:
//   STRING filepath - complete path to file to open
//   STRING contents - contents to write to file
//
// Returns:
//   None.
// * * * * * * * * * * * * * * * * * * * * * * * * * * * *
function file_overwrite( filepath, contents )
{
    // Declare file object
    var file_obj = new File();

    // Opens, Writes, and Closes file.
    file_obj.Open( filepath, 'w' );
    file_obj.Write( contents+"\n" );
    file_obj.Close();

    return;
} // end function file_overwrite.


// * * * * * * * Function Definition * * * * * * * * * * *
// This function creates a file with the given parameters
// with a time-stamp appended to the filename.
//
// Parameters:
//   STRING folder_path - path to the folder
//                        (Ex: "C:/Logs/" or "C:\\Logs\\")
//   STRING file_name   - base name of file
//                        (Ex: "Replication" or "ProtocolA")
//   STRING file_ext    - the extension of the file to create
//                        (Ex: "txt" or "csv")
//
// Returns:
//   STRING of newly created file including folder path.
// * * * * * * * * * * * * * * * * * * * * * * * * * * * *
function file_creation( folder_path, file_name, file_ext )
{
    // Get the current date and time.
    var date_time_str = getTimeStamp(new Date());

    // Create file_path.
    var file_path = folder_path + file_name + "_"
                    + date_time_str + "." + file_ext;

    // Create the file.
    file_read( file_path );

    return file_path;
} // end function file_creation


function getTimeStamp(tstamp) {
var outStr='';

var month=tstamp.getMonth() + 1;
var year=tstamp.getFullYear();
var date=tstamp.getDate();
var hours=tstamp.getHours();
var minutes=tstamp.getMinutes();
var seconds=tstamp.getSeconds();

if (month < 10) month = '0'+month;
if (date < 10) date = '0'+date;
if (hours < 10) hours = '0'+hours;
if (minutes < 10) minutes = '0'+minutes;
if (seconds < 10) seconds = '0'+seconds;
outStr = tstamp.getFullYear().toString() + month.toString() + date.toString() + '_' + hours.toString() + minutes.toString() + seconds.toString();
return outStr
} //End function getTimeStamp
//

// read_form_sources() converts the source plate information on the form into array
function read_form_sources(){
    source_file_array = []
    var source_counter = 0
    var last_source = 0
    var source_file_string = ""
    for (var i = 1; i<=formNumberOfSources; i++){
        if ( ( eval("typeof formSourceFile"+i))== "undefined" ){
            print("Skipping Source file "+i)
        }else if  (/\b.csv/.test(eval("formSourceFile"+i))){
            source_file_array[i] = []
            print("Adding Source File "+i+" with Source ID: "+eval("formSourceID"+i))
            source_file_array[i] = [ (eval("formSourceID"+i)) , (eval("formSourceFile"+i)) ]
//            print(source_file_array[i])
            source_counter++
            last_source = i
        } else print("Skipping Source File " +i)
    }
    if (source_counter!=last_source){
        print("Please reenter source files to be a continuous list")
        return false
    }else if (0 == source_counter){
        print("No .csv source files listed. Please reenter sources")
        return false
    }else if (formNumberOfSources != source_counter){
        print("Not enough .csv source files listed. Please reenter sources")
        return false
    } else return
}

// get_input_data(<string>) returns a string of file contents
function get_input_data(filepath) {
    input_file = new File();
    input_file.Open("" + filepath);
    var alllines = input_file.Read();
    input_file.Close();     //Close the file after you’ve finished reading the data
    if (alllines =="") {
        print("There is no information in the input file"); //test if the file is empty
        return false; 
    } else return alllines
}

// add_source_file_contents() appends a new column to each source_file_array row with the contents of the transfer data file
function add_source_file_contents(){
    var temp_contents = ""
    for(var i in source_file_array){
//        print(source_file_array[i])
        temp_contents = get_input_data(source_file_array[i][1])
        if (temp_contents == false) {
            print("One or more input files is empty, please check source file number "+i)
            return false
        }else source_file_array[i][2] = temp_contents
    }
    return
}

// process_source_file(<string>,<integer>) returns array containing csv file data of all lines with a well ID in Column 1
function process_source_file_data(csv_string,source_number) {
    csv_lines = csv_string.split("\n")
    source_file_array[source_number][3] = []
	csv_data_lines = []
	csv_skipped_lines = []
	for (var i in csv_lines){
	    if (/,+/.test(csv_lines[i]) && /[a-h]/i.test(csv_lines[i].charAt(0)) && /[0-9]/.test(csv_lines[i].charAt(1))){
    		csv_data_lines.push(csv_lines[i])
		}else if (csv_lines[i] != ""){
            csv_skipped_lines.push(csv_lines[i])
            print("Skipping line "+i+ " in file: " +source_file_array[source_number][1])
        }
	}
    print("csv_data_lines.length = "+csv_data_lines.length)
    for (var i in csv_data_lines){
//        source_file_array[source_number][3][i] = []
        source_file_array[source_number][3][i] = csv_data_lines[i].split(",",3)
//        print(source_file_array[source_number][3][i])
	}
	return
}

// add_source_plate(<array>,<integer>,<string>) appends a new source plate and its well data to the source_plate[] array
function add_source_plate(plate_number,plate_barcode){
    source_plate[plate_number] = []
    source_plate[plate_number].well = []
    source_plate[plate_number].barcode = plate_barcode
//    print("Wells in source plate = "+source_file_array[plate_number][3].length)
	for (var i in source_file_array[plate_number][3]){
        source_plate[plate_number].well[i] = []
        source_plate[plate_number].well[i].transferNumber = parseInt(i) + 1 // i starts at 0, transfer # starts at 1
        source_plate[plate_number].well[i].wellID = source_file_array[plate_number][3][i][0]
        source_plate[plate_number].well[i].concentration = source_file_array[plate_number][3][i][1]
        source_plate[plate_number].well[i].targetWellID = source_file_array[plate_number][3][i][2]
//        source_plate[plate_number].well[i].volume = source_file_array[plate_number][3][i][3]
//        print(source_plate[plate_number].well[i].transferNumber+", "+
//            source_plate[plate_number].well[i].wellID+", "+
//            source_plate[plate_number].well[i].concentration+", "+
//            source_plate[plate_number].well[i].targetWellID+"\n")
        }
    return
}

// var well_ng_target = formPoolConcentration / formPooledSamples

function fill_source_array(){
    for (var j in source_file_array){
        process_source_file_data(source_file_array[j][2],j)
        add_source_plate(j,source_file_array[j][0])
    }
}


// add the volume to transfer to column 4 of the source plate transfer array
function attach_source_volumes(target_dna_ng){
    for (var i in source_plate){
        for (var j in source_plate[i].well){
            if ( source_plate[i].well[j].concentration == 0 || source_plate[i].well[j].concentration == "" ){
                source_plate[i].well[j].volume = 0
            }else source_plate[i].well[j].volume =  target_dna_ng / source_plate[i].well[j].concentration
        }
    }
}

function create_output_files(dest_barcode){
    var filepath = ""
    output_array = []
    output_filepath_list = "Source Number,SourceID,Filepath\n"
    for (var i in source_plate){
        output_array[i] = "Transfer Number,Well ID,Concentration,Target Well,Transfer Volume\n"
//        print(source_plate[i].barcode)
        for (var j in source_plate[i].well){
            output_array[i] = output_array[i] + 
            source_plate[i].well[j].transferNumber +","+
            source_plate[i].well[j].wellID +","+
            source_plate[i].well[j].concentration +","+
            source_plate[i].well[j].targetWellID +","+
            source_plate[i].well[j].volume +"\n"
        }
        filepath = file_creation("C:/VWorks Workspace/VWorks/Hit Picking/Pooling Files/",source_plate[i].barcode,"csv")
        file_overwrite(filepath,output_array[i]) 
        output_filepath_list =  output_filepath_list + i + "," + source_plate[i].barcode + "," + filepath + "\n"
    }
    var master_file_path = file_creation("C:/VWorks Workspace/VWorks/Hit Picking/Pooling Files/","Pooling_master_file_"+dest_barcode,"csv")
    file_overwrite(master_file_path,output_filepath_list)
    return master_file_path
}

