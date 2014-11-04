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

function read_master_file(filepath){
    var csv_string = get_input_data(filepath)
    csv_lines1 = csv_string.split("\n")
    source_data_file_array = []
    for (var i in csv_lines1){
        if ( /,/.test(csv_lines1[i])){
            csv_fields = csv_lines1[i].split(",")
            source_data_file_array[i] = []
            source_data_file_array[i].number = csv_fields[0]
            source_data_file_array[i].barcode = csv_fields[1]
            source_data_file_array[i].filepath = csv_fields[2]
            if (i>0) source_data_file_array[i].fileContents = get_input_data(csv_fields[2])
        }
    }
    return
}    

function create_source_plate_array(){
    source_plate = []
}

// process_source_file(<integer>,<string>) returns array containing csv file data of all lines with a well ID in Column 1
function read_transfer_file_data(csv_string,source_number) {
    csv_lines = csv_string.split("\n")
    source_data_file_array[source_number].fileContentsArray = []
	for (var i in csv_lines){
        if ( /,/.test(csv_lines[i])){
            source_data_file_array[source_number].fileContentsArray[i] = csv_lines[i].split(",",5)
        }
	}
	return
}

// add_source_plate_data(<integer>,<string>) appends a new source plate and its well data to the source_plate[] array
function add_source_plate_data(plate_number,plate_barcode){
    source_plate[plate_number] = []
    source_plate[plate_number].well = []
    source_plate[plate_number].barcode = plate_barcode
    var transfer_count = 0
//    print("Wells in source plate = "+source_data_file_array[plate_number][3].length)
	for (var i in source_data_file_array[plate_number].fileContentsArray){
        if ( 0 == i ) {}
        else {
            source_plate[plate_number].well[i] = []
            source_plate[plate_number].well[i].transferNumber = source_data_file_array[plate_number].fileContentsArray[i][0]
            source_plate[plate_number].well[i].wellID = source_data_file_array[plate_number].fileContentsArray[i][1]
            source_plate[plate_number].well[i].concentration = source_data_file_array[plate_number].fileContentsArray[i][2]
            source_plate[plate_number].well[i].targetWellID = source_data_file_array[plate_number].fileContentsArray[i][3]
            source_plate[plate_number].well[i].volume = source_data_file_array[plate_number].fileContentsArray[i][4]
            transfer_count++
        }
    }
    source_plate[plate_number].numberOfTransfers = transfer_count
    return
}

function fill_source_plate_array(){
    var number_of_sources = 0
    for (var j in source_data_file_array){
        if ( 0 == j ) {}
        else{
            read_transfer_file_data(source_data_file_array[j].fileContents,j)
            add_source_plate_data(source_data_file_array[j].number,source_data_file_array[j].barcode)
            number_of_sources++
        }
    }
    return number_of_sources
}

// get_well_position(<string>) converts a alphanumeric well ID and returns an array for task.Wellposition
function get_well_position(wellID){
   components = wellID.split('')
    if(/[A-z]/.test(components[0])){
	    var row_letter = components.shift().toUpperCase()
        var row_number = row_letter.charCodeAt(0) - 64
	    if (components.length > 1){
		    var column_number = parseInt(components[0]+""+components[1])
		}else var column_number = parseInt(components[0])
	} else return false
    return [[row_number,column_number]]  //row_number+","+column_number
}

// well_map_builder(<integer>,<integer>) create a map of task.Wellselection values and returns a numbered array
function well_map_builder(rows,columns){
    var function_well_map = []
	var function_well_number = rows*columns
	var function_index = 0
	for (var i=1; i <= columns; i++){
	    for (var j=1; j <= rows; j++){
		    function_well_map[function_index] = [[j,i]]
			function_index++
		}
	}
	return function_well_map
}

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