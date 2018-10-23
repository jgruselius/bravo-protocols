<?xml version='1.0' encoding='ASCII' ?>
<Velocity11 file='Protocol_Data' md5sum='f052059ad536c73f56bd904c70f3e3bc' version='2.0' >
	<File_Info AllowSimultaneousRun='1' AutoExportGanttChart='0' AutoLoadRacks='When the main protocol starts' AutoUnloadRacks='1' AutomaticallyLoadFormFile='1' Barcodes_Directory='' DeleteHitpickFiles='1' Description='' Device_File='C:\VWorks Workspace\Device Files\Bravo 96LT magnet.dev' Display_User_Task_Descriptions='1' DynamicAssignPlateStorageLoad='0' FinishScript='' Form_File='' HandlePlatesInInstance='1' Notes='' PipettePlatesInInstanceOrder='1' Protocol_Alias='' StartScript='open( &apos;C:/VWorks Workspace/Protocol Files/facility/transfer/transfer_lib.js&apos;);

' Use_Global_JS_Context='0' />
	<Processes >
		<Startup_Processes >
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='var global = GetGlobalObject();
var filePath = global.formFile;' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='var tm = new TransferManager(&quot;dilution&quot;, {&quot;row&quot;: 1, &quot;column&quot;:1});
tm.openTransferFile(filePath);

// Add compability for old Library Normalization file format:
if(!tm.errorState) {
   tm = new TransferManager(&quot;lims_dilution&quot;, {&quot;row&quot;: 1, &quot;column&quot;:1});
   tm.openTransferFile(filePath);
}

var MAX_VOLUME = 170;

var sourcePlate, destinationPlate, diluentPlate;
var plateSet = {
	&quot;Eppendorf twin.tec 96&quot;: &quot;96 Eppendorf Twin.tec PCR&quot;,
	&quot;Thermo-Fast skirted 96 (AB-0800)&quot;: &quot;96 Thermo-Fast Skirted PCR&quot;,
	&quot;ABgene TF LP 96 (AB-1300)&quot;: &quot;96 ABgene Thermo-Fast LP PCR&quot;
};
var diluentPlateSet = {
	&quot;Nunc Deepwell&quot;: &quot;96 Nunc Deep Well 1 mL&quot;,
	&quot;Reservoir&quot;: &quot;96 Matrix open reservoir movable&quot;
};
if(global.formDestinationPlate in plateSet) {
	destinationPlate = plateSet[global.formDestinationPlate];
} else {
	destinationPlate = &quot;96 Eppendorf Twin.tec PCR&quot;;
}
if(global.formSourcePlate in plateSet) {
	sourcePlate = plateSet[global.formSourcePlate];
} else {
	sourcePlate = &quot;96 Eppendorf Twin.tec PCR&quot;;
}
if(global.formDiluentPlate in diluentPlateSet) {
	diluentPlate = diluentPlateSet[global.formDiluentPlate];
} else {
	diluentPlate = &quot;96 Matrix open reservoir movable&quot;;
}
print(&quot;sourcePlate=&quot;+sourcePlate);
print(&quot;destinationPlate=&quot;+destinationPlate);
print(&quot;diluentPlate=&quot;+diluentPlate);

if(global.formLog) {
	print(&quot;Input file: &quot; + filePath);
	print(&quot;TransferManager errorstate: &quot; + tm.errorState);
	print(&quot;TransferManager size: &quot; + tm.getSize());
	for(var i=0,n=tm.numberOfPlates();i&lt;n;i++) {
		var t = tm.transfers[i];
		for(var j=0,m=t.length;j&lt;m;j++) {
			print(t[j]);
		}
	}
}

var firstTipBox = true;

//var ignoreBarcodes = !!global.formIgnoreBarcodes;
//var bc = new BarcodeManager(3);

' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='2' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::User Message' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='// Show an error message if hte selected file could
// not be interpreted successfully:
if(tm.errorState &amp;&amp; tm.getSize() &amp;&amp; typeof filePath !== &quot;undefined&quot;) {
	task.skip();
} else {
	task.repeat();
}' />
					<Parameters >
						<Parameter Category='' Name='Title' Value='Error' />
						<Parameter Category='' Name='Body' Value='The csv file could not be parsed successfully, abort and check format.' />
						<Parameter Category='' Name='Only show the first time' Value='' />
						<Parameter Category='Scripting variable data entry' Name='User data entry into variable' Value='0' />
						<Parameter Category='Scripting variable data entry' Name='Variable name' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='3' />
						<Parameter Category='Task Description' Name='Task description' Value='User Message' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='var buffer96Mode = false;
var sample96Mode = false;
var userEntry;' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='4' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::User Message' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(tm.volumeLimitedTo(MAX_VOLUME)) {
	task.skip();
} else {
	task.Body = &quot;The transfer instruction file contains volumes above what the tip can hold (&quot; + MAX_VOLUME + &quot; uL). Please abort the run and check the file.&quot;;
}
' />
					<Parameters >
						<Parameter Category='' Name='Title' Value='Volume warning' />
						<Parameter Category='' Name='Body' Value='' />
						<Parameter Category='' Name='Only show the first time' Value='' />
						<Parameter Category='Scripting variable data entry' Name='User data entry into variable' Value='0' />
						<Parameter Category='Scripting variable data entry' Name='Variable name' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='5' />
						<Parameter Category='Task Description' Name='Task description' Value='User Message' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::User Message' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >1</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(!tm.constantVolumes[0]) {
   task.skip();
}
' />
					<Parameters >
						<Parameter Category='' Name='Title' Value='Option' />
						<Parameter Category='' Name='Body' Value='The buffer volume is the same for all transfers, do you want to pipette all 96 wells simultaneously (Y/N)?' />
						<Parameter Category='' Name='Only show the first time' Value='' />
						<Parameter Category='Scripting variable data entry' Name='User data entry into variable' Value='1' />
						<Parameter Category='Scripting variable data entry' Name='Variable name' Value='userEntry' />
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >1</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(tm.constantVolumes[0] &amp;&amp; userEntry.match(/\s*y\s*/gi)) {
   buffer96Mode = true;
}' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::User Message' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >1</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='4' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(!tm.constantVolumes[1]) {
   task.skip();
}' />
					<Parameters >
						<Parameter Category='' Name='Title' Value='Option' />
						<Parameter Category='' Name='Body' Value='The sample volume is the same for all transfers, do you want to pipette all 96 wells simultaneously (Y/N)?' />
						<Parameter Category='' Name='Only show the first time' Value='' />
						<Parameter Category='Scripting variable data entry' Name='User data entry into variable' Value='1' />
						<Parameter Category='Scripting variable data entry' Name='Variable name' Value='userEntry' />
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >1</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(tm.constantVolumes[1] &amp;&amp; userEntry.match(/\s*y\s*/gi)) {
   sample96Mode = true;
}

print(&quot;buffer96Mode=&quot;+buffer96Mode+&quot;\n&quot;+
   &quot;sample96Mode=&quot;+sample96Mode);' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='startup' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
		</Startup_Processes>
		<Main_Processes >
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='5' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='plate.labware = sourcePlate;' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='5' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::User Message' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(tm.plate === 0) task.skip();
task.Body = &quot;Place plate &quot; + tm.next.sourcePlate + &quot; on position 5.&quot;;' />
					<Parameters >
						<Parameter Category='' Name='Title' Value='Place plate' />
						<Parameter Category='' Name='Body' Value='' />
						<Parameter Category='' Name='Only show the first time' Value='' />
						<Parameter Category='Scripting variable data entry' Name='User data entry into variable' Value='0' />
						<Parameter Category='Scripting variable data entry' Name='Variable name' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='2' />
						<Parameter Category='Task Description' Name='Task description' Value='User Message' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='Bravo::SubProcess' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transfer' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='source' />
					<Parameter Name='Plate type' Value='96 Eppendorf Twin.tec PCR' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='' />
					<Parameter Name='Barcode filename' Value='No Selection' />
					<Parameter Name='Has header' Value='' />
					<Parameter Name='Barcode or header South' Value='No Selection' />
					<Parameter Name='Barcode or header West' Value='No Selection' />
					<Parameter Name='Barcode or header North' Value='No Selection' />
					<Parameter Name='Barcode or header East' Value='Barcode not in file' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='1' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='plate.labware = diluentPlate;' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='1' />
					</Parameters>
				</Task>
				<Task Name='Bravo::SubProcess' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transfer' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='diluent' />
					<Parameter Name='Plate type' Value='96 Matrix open reservoir movable' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='1' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='' />
					<Parameter Name='Barcode filename' Value='No Selection' />
					<Parameter Name='Has header' Value='' />
					<Parameter Name='Barcode or header South' Value='No Selection' />
					<Parameter Name='Barcode or header West' Value='No Selection' />
					<Parameter Name='Barcode or header North' Value='No Selection' />
					<Parameter Name='Barcode or header East' Value='No Selection' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='6' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='plate.labware = destinationPlate;' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='6' />
					</Parameters>
				</Task>
				<Task Name='Bravo::SubProcess' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transfer' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='destination' />
					<Parameter Name='Plate type' Value='96 Eppendorf Twin.tec PCR' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='1' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='' />
					<Parameter Name='Barcode filename' Value='No Selection' />
					<Parameter Name='Has header' Value='' />
					<Parameter Name='Barcode or header South' Value='No Selection' />
					<Parameter Name='Barcode or header West' Value='No Selection' />
					<Parameter Name='Barcode or header North' Value='No Selection' />
					<Parameter Name='Barcode or header East' Value='No Selection' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::User Message' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='7' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(firstTipBox) task.skip();' />
					<Parameters >
						<Parameter Category='' Name='Title' Value='Place tips' />
						<Parameter Category='' Name='Body' Value='Place a tipbox with unused tips at position 2. Place an empty tipbox on position 1.' />
						<Parameter Category='' Name='Only show the first time' Value='' />
						<Parameter Category='Scripting variable data entry' Name='User data entry into variable' Value='0' />
						<Parameter Category='Scripting variable data entry' Name='Variable name' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='User Message' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='8' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='2' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='8' />
					</Parameters>
				</Task>
				<Task Name='Bravo::SubProcess' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transfer' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='newTips' />
					<Parameter Name='Plate type' Value='96 V11 LT250 Tip Box 19477.002' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='' />
					<Parameter Name='Barcode filename' Value='No Selection' />
					<Parameter Name='Has header' Value='' />
					<Parameter Name='Barcode or header South' Value='No Selection' />
					<Parameter Name='Barcode or header West' Value='No Selection' />
					<Parameter Name='Barcode or header North' Value='No Selection' />
					<Parameter Name='Barcode or header East' Value='No Selection' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='9' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='9' />
					</Parameters>
				</Task>
				<Task Name='Bravo::SubProcess' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transfer' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='usedTips' />
					<Parameter Name='Plate type' Value='96 V11 LT250 Tip Box 19477.002' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='' />
					<Parameter Name='Barcode filename' Value='No Selection' />
					<Parameter Name='Has header' Value='' />
					<Parameter Name='Barcode or header South' Value='No Selection' />
					<Parameter Name='Barcode or header West' Value='No Selection' />
					<Parameter Name='Barcode or header North' Value='No Selection' />
					<Parameter Name='Barcode or header East' Value='No Selection' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
			<Pipette_Process Name='transfer' >
				<Minimized >0</Minimized>
				<Task Name='Bravo::secondary::Set Head Mode' Task_Type='512' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(buffer96Mode) {
   task.Headmode = &quot;0,2,1,1&quot;;
} else {
   task.Headmode = &quot;4,0,1,1&quot;;
}' />
					<Parameters >
						<Parameter Category='' Name='Head mode' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;f3c57de56bf5d361ee4249fe09d18f71&apos; version=&apos;1.0&apos; &gt;
	&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='Set Head Mode (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='var hasTransfer = tm.hasNextTransfer();
var counter = 0;' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='2' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Loop' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='task.Numberoftimestoloop = buffer96Mode ? 1 : tm.getCurrentSize();' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Number of times to loop' TaskParameterScript='=tm.getCurrentSize();' Value='1' />
						<Parameter Category='' Name='Change tips every N times, N = ' Value='1' />
					</Parameters>
					<Variables />
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='tm.increment();' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='4' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Group Begin' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='5' />
						<Parameter Category='Task Description' Name='Task description' Value='Group Begin' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='Bravo::secondary::Tips On' Task_Type='16' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='8' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(hasTransfer &amp;&amp; tm.useNewTip()) {
   task.Wellselection = buffer96Mode ? [[1,1]] : [tm.takeTip()];
} else {
	task.skip();
}' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='newTips' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;ab99b0c18d761e0a5915f3aaa41401fe&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='6' />
						<Parameter Category='Task Description' Name='Task description' Value='Tips On (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Aspirate' Task_Type='1' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='8' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(hasTransfer) {
	task.Volume = tm.getVolume();
   task.Wellselection = buffer96Mode ? [[1,1]] : [[8,12]];
} else {
	task.skip();
}
' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='diluent' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Volume' Value='' />
						<Parameter Category='Volume' Name='Pre-aspirate volume' Value='5' />
						<Parameter Category='Volume' Name='Post-aspirate volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_normal_medium_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='3' />
						<Parameter Category='Properties' Name='Dynamic tip extension' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;c174b013033cf67c4900ca5680b60eba&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;11&apos; Row=&apos;7&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='7' />
						<Parameter Category='Task Description' Name='Task description' Value='Aspirate (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Dispense' Task_Type='2' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='9' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(hasTransfer) {
	task.Volume = tm.getVolume();
	task.Wellselection = buffer96Mode ? [[1,1]] : [tm.getWellSelectionTransferDestination()];
	counter++;
} else {
	task.skip();
}' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='destination' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Empty tips' Value='0' />
						<Parameter Category='Volume' Name='Volume' Value='' />
						<Parameter Category='Volume' Name='Blowout volume' Value='5' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_normal_medium_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='1' />
						<Parameter Category='Properties' Name='Dynamic tip retraction' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='South/North' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;c11e6d6b068be97a72100ad9b9de9bfe&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='8' />
						<Parameter Category='Task Description' Name='Task description' Value='Dispense (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Tips Off' Task_Type='32' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='7' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(hasTransfer &amp;&amp; tm.returnTip()) {
	task.Wellselection = buffer96Mode ? [[1,1]] : [tm.putTip()];
} else {
	task.skip();
}' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='usedTips' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Mark tips as used' Value='1' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;f1398bdb240ae4d7e29273f0645fe362&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;11&apos; Row=&apos;7&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='9' />
						<Parameter Category='Task Description' Name='Task description' Value='Tips Off (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::Group End' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='10' />
						<Parameter Category='Task Description' Name='Task description' Value='Group End' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Loop End' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='Bravo::secondary::Tips On' Task_Type='16' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.skip();' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='newTips' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;ab99b0c18d761e0a5915f3aaa41401fe&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='12' />
						<Parameter Category='Task Description' Name='Task description' Value='Tips On (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Tips Off' Task_Type='32' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='3' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(hasTransfer &amp;&amp; (!tm.returnTip() &amp;&amp; (buffer96Mode != sample96Mode))) {
	task.Wellselection = buffer96Mode ? [[1,1]] : [[8,12]];
} else {
	task.skip();
}' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='newTips' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Mark tips as used' Value='1' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;ab99b0c18d761e0a5915f3aaa41401fe&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='13' />
						<Parameter Category='Task Description' Name='Task description' Value='Tips Off (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Move To Location' Task_Type='1024' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Location' Value='3' />
						<Parameter Category='Task Description' Name='Task number' Value='14' />
						<Parameter Category='Task Description' Name='Task description' Value='Move To Location (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::User Message' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Body = &quot;Place plate &quot; + tm.next.sourcePlate + &quot; on position 5.&quot;;' />
					<Parameters >
						<Parameter Category='' Name='Title' Value='Place plate' />
						<Parameter Category='' Name='Body' Value='' />
						<Parameter Category='' Name='Only show the first time' Value='' />
						<Parameter Category='Scripting variable data entry' Name='User data entry into variable' Value='0' />
						<Parameter Category='Scripting variable data entry' Name='Variable name' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='15' />
						<Parameter Category='Task Description' Name='Task description' Value='User Message' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='// Skip forward:
if(buffer96Mode) {
   for(var i = 1, n = tm.getCurrentSize(); i &lt; n; i++) {
      tm.increment();
   }
}' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='14' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='Bravo::secondary::Set Head Mode' Task_Type='512' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(sample96Mode) {
   task.Headmode = &quot;0,2,1,1&quot;;
} else {
   task.Headmode = &quot;4,0,1,1&quot;;
}' />
					<Parameters >
						<Parameter Category='' Name='Head mode' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;f3c57de56bf5d361ee4249fe09d18f71&apos; version=&apos;1.0&apos; &gt;
	&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='15' />
						<Parameter Category='Task Description' Name='Task description' Value='Set Head Mode (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::Loop' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Number of times to loop' TaskParameterScript='=tm.numberOfPlates() - 1;' Value='' />
						<Parameter Category='' Name='Change tips every N times, N = ' Value='1' />
					</Parameters>
					<Variables />
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='var hasTransfer = tm.hasNextTransfer();' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='17' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Loop' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='task.Numberoftimestoloop = sample96Mode ? 1 : tm.getCurrentSize();' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Number of times to loop' TaskParameterScript='=tm.getCurrentSize();' Value='1' />
						<Parameter Category='' Name='Change tips every N times, N = ' Value='1' />
					</Parameters>
					<Variables />
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(hasTransfer) {
	tm.increment();
}' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='19' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Group Begin' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='20' />
						<Parameter Category='Task Description' Name='Task description' Value='Group Begin' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='Bravo::secondary::Tips On' Task_Type='16' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='8' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(hasTransfer &amp;&amp; (counter &lt; 1 || tm.useNewTip() || (sample96Mode != buffer96Mode))) {
   task.Wellselection = sample96Mode ? [[1,1]] : [tm.takeTip()];
} else {
	task.skip();
}' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='newTips' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;92b7eaad1b7593e5501526eb63fcf41d&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;1&apos; Row=&apos;3&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='21' />
						<Parameter Category='Task Description' Name='Task description' Value='Tips On (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Aspirate' Task_Type='1' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='6' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(hasTransfer) {
	task.Volume = tm.getVolume();
	task.Wellselection = sample96Mode ? [[1,1]] : [tm.getWellSelectionTransferSource()];
} else {
	task.skip();
}
' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='source' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Volume' Value='' />
						<Parameter Category='Volume' Name='Pre-aspirate volume' Value='5' />
						<Parameter Category='Volume' Name='Post-aspirate volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_normal_small_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='0.75' />
						<Parameter Category='Properties' Name='Dynamic tip extension' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;c11e6d6b068be97a72100ad9b9de9bfe&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='22' />
						<Parameter Category='Task Description' Name='Task description' Value='Aspirate (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Dispense' Task_Type='2' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(hasTransfer) {
	task.Volume = tm.getVolume();
	task.Wellselection = sample96Mode ? [[1,1]] : [tm.getWellSelectionTransferDestination()];
	counter++;
} else {
	task.skip();
}' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='destination' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Empty tips' Value='0' />
						<Parameter Category='Volume' Name='Volume' Value='' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_normal_small_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='0.75' />
						<Parameter Category='Properties' Name='Dynamic tip retraction' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='South/North' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;c11e6d6b068be97a72100ad9b9de9bfe&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='23' />
						<Parameter Category='Task Description' Name='Task description' Value='Dispense (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Dispense' Task_Type='2' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='// Blowout
if(hasTransfer) {
	task.Wellselection =  sample96Mode ? [[1,1]] : [tm.getWellSelectionTransferDestination()];
} else {
	task.skip();
}' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='destination' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Empty tips' Value='0' />
						<Parameter Category='Volume' Name='Volume' Value='5' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_normal_small_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='10' />
						<Parameter Category='Properties' Name='Dynamic tip retraction' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='1' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='-9' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;c11e6d6b068be97a72100ad9b9de9bfe&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='24' />
						<Parameter Category='Task Description' Name='Task description' Value='Dispense (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Tips Off' Task_Type='32' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='6' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(hasTransfer &amp;&amp; (tm.returnTip() || sample96Mode)) {
	task.Wellselection =  sample96Mode ? [[1,1]] : [tm.putTip()];
} else {
	task.skip();
}' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='usedTips' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Mark tips as used' Value='1' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;caa910585bdda2c93cd400f31b755eb6&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;10&apos; Row=&apos;4&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='25' />
						<Parameter Category='Task Description' Name='Task description' Value='Tips Off (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::Group End' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='26' />
						<Parameter Category='Task Description' Name='Task description' Value='Group End' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Change Instance' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='if(tm.hasTip()) task.skip();' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='27' />
						<Parameter Category='Task Description' Name='Task description' Value='Change Instance' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Plate to change' Value='newTips' />
						<Parameter Category='' Name='Spawn control' Value='Spawn new plates when task runs ' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Change Instance' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='if(tm.hasTip()) task.skip();' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='28' />
						<Parameter Category='Task Description' Name='Task description' Value='Change Instance' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Plate to change' Value='usedTips' />
						<Parameter Category='' Name='Spawn control' Value='Spawn new plates when task runs ' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(!tm.hasTip()) tm.resetTips();' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='29' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Loop End' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='// Skip forward:
if(sample96Mode) {
   for(var i = 1, n = tm.getCurrentSize(); i &lt; n; i++) {
      tm.increment();
   }
}' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='31' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Change Instance' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='if(!tm.changePlate()) task.skip();' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='32' />
						<Parameter Category='Task Description' Name='Task description' Value='Change Instance' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Plate to change' Value='source' />
						<Parameter Category='' Name='Spawn control' Value='Spawn new plates when task runs ' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Loop End' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='0' />
						<Parameter Category='Task Description' Name='Task description' Value='' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Devices >
					<Device Device_Name='Bravo - 1' Location_Name='1' />
				</Devices>
				<Parameters >
					<Parameter Name='Display confirmation' Value='Don&apos;t display' />
					<Parameter Name='1' Value='&lt;use default&gt;' />
					<Parameter Name='2' Value='&lt;use default&gt;' />
					<Parameter Name='3' Value='&lt;use default&gt;' />
					<Parameter Name='4' Value='&lt;use default&gt;' />
					<Parameter Name='5' Value='&lt;use default&gt;' />
					<Parameter Name='6' Value='&lt;use default&gt;' />
					<Parameter Name='7' Value='&lt;use default&gt;' />
					<Parameter Name='8' Value='&lt;use default&gt;' />
					<Parameter Name='9' Value='&lt;use default&gt;' />
				</Parameters>
				<Dependencies >
					<Sub_Process Name='bufferTransfer' />
				</Dependencies>
			</Pipette_Process>
		</Main_Processes>
	</Processes>
</Velocity11>