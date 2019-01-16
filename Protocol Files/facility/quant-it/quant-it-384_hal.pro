<?xml version='1.0' encoding='ASCII' ?>
<Velocity11 file='Protocol_Data' md5sum='304ae01260c0745a425890dfa4e76e5b' version='2.0' >
	<File_Info AllowSimultaneousRun='0' AutoExportGanttChart='0' AutoLoadRacks='When the main protocol starts' AutoUnloadRacks='0' AutomaticallyLoadFormFile='1' Barcodes_Directory='' DeleteHitpickFiles='1' Description='' Device_File='C:\VWorks Workspace\Device Files\Bravo 96LT magnet.dev' Display_User_Task_Descriptions='1' DynamicAssignPlateStorageLoad='0' FinishScript='' Form_File='' HandlePlatesInInstance='1' Notes='' PipettePlatesInInstanceOrder='0' Protocol_Alias='' StartScript='' Use_Global_JS_Context='0' />
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
					<TaskScript Name='TaskScript' Value='// Author: Joel Gruselius (joel.gruselius@scilifelab.se), SciLifeLab, 2014

var global = GetGlobalObject();
var columns = parseInt(global.formColumns, 10) || 1;
var startColumn = parseInt(global.formStartColumn, 10) || 1;
var standardColumn = parseInt(global.formStandardColumn, 10) || 1;
var sampleLocation = {
	&quot;9 (default)&quot;: 9,
	&quot;3 (magnet)&quot;: 3
}[global.formSampleLocation];

print(global.formSampleLocation + &quot; =&gt; &quot; +
	&quot;sampleLocation: &quot; + sampleLocation +
	&quot; (&quot; + typeof sampleLocation + &quot;)&quot;);

var volume = {
	max: 170,
	maxMix: 160,
	buffer: 200,
	assay: 40,
	extra: 5
};
volume.standard = parseFloat(global.formVolumeStandard) || 10;
volume.sample = parseFloat(global.formVolumeSample) || 2;

var sampleWells = [[1,1],[1,2],[2,1]];
var standardWells = [[2,2],[2,4],[2,6]];' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
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
						<Device Device_Name='Bravo - 1' Location_Name='9' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='task.Locationtouse = sampleLocation;' />
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
						<Parameter Category='' Name='Sub-process name' Value='transferSamples' />
						<Parameter Category='Static labware configuration' Name='Display confirmation' Value='Don&apos;t display' />
						<Parameter Category='Static labware configuration' Name='1' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='2' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='3' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='4' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='5' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='6' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='7' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='8' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='9' Value='&lt;use default&gt;' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transferSamples' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='SampleSource' />
					<Parameter Name='Plate type' Value='96 Eppendorf Twin.tec PCR' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='1' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='0' />
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
					<TaskScript Name='TaskScript' Value='' />
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
						<Parameter Category='' Name='Sub-process name' Value='transferStandards' />
						<Parameter Category='Static labware configuration' Name='Display confirmation' Value='Don&apos;t display' />
						<Parameter Category='Static labware configuration' Name='1' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='2' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='3' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='4' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='5' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='6' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='7' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='8' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='9' Value='&lt;use default&gt;' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transferStandards' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='StandardSource' />
					<Parameter Name='Plate type' Value='96 Eppendorf Twin.tec PCR' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='1' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='0' />
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
						<Device Device_Name='Bravo - 1' Location_Name='8' />
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
						<Parameter Category='' Name='Sub-process name' Value='transferSamples' />
						<Parameter Category='Static labware configuration' Name='Display confirmation' Value='Don&apos;t display' />
						<Parameter Category='Static labware configuration' Name='1' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='2' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='3' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='4' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='5' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='6' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='7' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='8' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='9' Value='&lt;use default&gt;' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transferSamples' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='SamplePrep' />
					<Parameter Name='Plate type' Value='96 Eppendorf Twin.tec PCR' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='0' />
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
						<Device Device_Name='Bravo - 1' Location_Name='2' />
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
						<Parameter Category='' Name='Location to use' Value='2' />
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
						<Parameter Category='' Name='Sub-process name' Value='transferStandards' />
						<Parameter Category='Static labware configuration' Name='Display confirmation' Value='Don&apos;t display' />
						<Parameter Category='Static labware configuration' Name='1' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='2' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='3' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='4' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='5' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='6' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='7' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='8' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='9' Value='&lt;use default&gt;' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transferStandards' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='StandardPrep' />
					<Parameter Name='Plate type' Value='96 Eppendorf Twin.tec PCR' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='0' />
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
						<Device Device_Name='Bravo - 1' Location_Name='5' />
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
						<Parameter Category='' Name='Location to use' Value='5' />
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
						<Parameter Category='' Name='Sub-process name' Value='transferSamples' />
						<Parameter Category='Static labware configuration' Name='Display confirmation' Value='Don&apos;t display' />
						<Parameter Category='Static labware configuration' Name='1' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='2' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='3' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='4' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='5' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='6' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='7' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='8' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='9' Value='&lt;use default&gt;' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transferSamples' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='SampleTips' />
					<Parameter Name='Plate type' Value='96 V11 LT250 Tip Box 19477.002' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='0' />
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
						<Device Device_Name='Bravo - 1' Location_Name='1' />
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
						<Parameter Category='' Name='Sub-process name' Value='transferStandards' />
						<Parameter Category='Static labware configuration' Name='Display confirmation' Value='Don&apos;t display' />
						<Parameter Category='Static labware configuration' Name='1' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='2' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='3' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='4' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='5' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='6' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='7' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='8' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='9' Value='&lt;use default&gt;' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transferStandards' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='StandardTips' />
					<Parameter Name='Plate type' Value='96 V11 LT250 Tip Box 19477.002' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='0' />
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
						<Device Device_Name='Bravo - 1' Location_Name='7' />
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
						<Parameter Category='' Name='Location to use' Value='7' />
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
						<Parameter Category='' Name='Sub-process name' Value='transferSamples' />
						<Parameter Category='Static labware configuration' Name='Display confirmation' Value='Don&apos;t display' />
						<Parameter Category='Static labware configuration' Name='1' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='2' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='3' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='4' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='5' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='6' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='7' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='8' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='9' Value='&lt;use default&gt;' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transferSamples' />
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
						<Parameter Category='' Name='Sub-process name' Value='transferStandards' />
						<Parameter Category='Static labware configuration' Name='Display confirmation' Value='Don&apos;t display' />
						<Parameter Category='Static labware configuration' Name='1' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='2' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='3' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='4' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='5' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='6' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='7' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='8' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='9' Value='&lt;use default&gt;' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='transferStandards' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='Assay' />
					<Parameter Name='Plate type' Value='384 Bio-Rad Hard-Shell' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='0' />
					<Parameter Name='Barcode filename' Value='No Selection' />
					<Parameter Name='Has header' Value='' />
					<Parameter Name='Barcode or header South' Value='No Selection' />
					<Parameter Name='Barcode or header West' Value='No Selection' />
					<Parameter Name='Barcode or header North' Value='No Selection' />
					<Parameter Name='Barcode or header East' Value='No Selection' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
			<Pipette_Process Name='transferSamples' >
				<Minimized >0</Minimized>
				<Task Name='Bravo::secondary::Set Head Mode' Task_Type='512' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Headmode = &quot;1,2,1,&quot; + columns;' />
					<Parameters >
						<Parameter Category='' Name='Head mode' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;5929d18748dd2bd11633d3faafa655d1&apos; version=&apos;1.0&apos; &gt;
	&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='Set Head Mode (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='12' RowCount='8' SubsetConfig='0' SubsetType='0' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::Group Begin' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='2' />
						<Parameter Category='Task Description' Name='Task description' Value='Group Begin' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='Bravo::secondary::Tips On' Task_Type='16' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='7' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Wellselection = [[1,13-columns]];' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='SampleTips' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;b37e670787c8474f935b41a6ceb5f9f6&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='3' />
						<Parameter Category='Task Description' Name='Task description' Value='Tips On (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='12' RowCount='8' SubsetConfig='0' SubsetType='0' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Aspirate' Task_Type='1' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='18' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Wellselection = [[1,startColumn]];' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='SampleSource' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Volume' TaskParameterScript='=volume.sample;' Value='10' />
						<Parameter Category='Volume' Name='Pre-aspirate volume' Value='10' />
						<Parameter Category='Volume' Name='Post-aspirate volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_slow_small_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='0.8' />
						<Parameter Category='Properties' Name='Dynamic tip extension' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6d9e778ac7f7235a77c7705582d38a22&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='4' />
						<Parameter Category='Task Description' Name='Task description' Value='Aspirate (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='12' RowCount='8' SubsetConfig='0' SubsetType='0' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Dispense' Task_Type='2' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='SamplePrep' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Empty tips' Value='0' />
						<Parameter Category='Volume' Name='Volume' TaskParameterScript='=volume.sample;' Value='10' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_normal_small_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='2' />
						<Parameter Category='Properties' Name='Dynamic tip retraction' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6d9e778ac7f7235a77c7705582d38a22&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='5' />
						<Parameter Category='Task Description' Name='Task description' Value='Dispense (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='12' RowCount='8' SubsetConfig='0' SubsetType='0' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Mix [Dual Height]' Task_Type='4096' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='47' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='var mixVol = 0.8 * volume.buffer;
task.Volume = (mixVol &lt;= volume.maxMix) ? mixVol : volume.maxMix;' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='SamplePrep' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Volume' Value='' />
						<Parameter Category='Volume' Name='Pre-aspirate volume' Value='0' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_normal_mixing' />
						<Parameter Category='Properties' Name='Mix cycles' Value='10' />
						<Parameter Category='Properties' Name='Dynamic tip extension' Value='0' />
						<Parameter Category='Distance From Well Bottom' Name='Aspirate distance' Value='2' />
						<Parameter Category='Distance From Well Bottom' Name='Dispense at different distance' Value='0' />
						<Parameter Category='Distance From Well Bottom' Name='Dispense distance' Value='2' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6d9e778ac7f7235a77c7705582d38a22&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='6' />
						<Parameter Category='Task Description' Name='Task description' Value='Mix (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='12' RowCount='8' SubsetConfig='0' SubsetType='0' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Aspirate' Task_Type='1' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='12' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Volume = sampleWells.length * volume.assay + volume.extra;' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='SamplePrep' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Volume' Value='' />
						<Parameter Category='Volume' Name='Pre-aspirate volume' Value='0' />
						<Parameter Category='Volume' Name='Post-aspirate volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_slow_large_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='1' />
						<Parameter Category='Properties' Name='Dynamic tip extension' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6d9e778ac7f7235a77c7705582d38a22&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='7' />
						<Parameter Category='Task Description' Name='Task description' Value='Aspirate (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='12' RowCount='8' SubsetConfig='0' SubsetType='0' TipType='0' />
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
						<Parameter Category='' Name='Number of times to loop' TaskParameterScript='=sampleWells.length;' Value='1' />
						<Parameter Category='' Name='Change tips every N times, N = ' Value='1' />
					</Parameters>
					<Variables >
						<Variable fIncrement='1' iFreqValue='0' strFrequency='Every time' strInitialValue='0' strVariableName='i' />
					</Variables>
				</Task>
				<Task Name='Bravo::secondary::Dispense' Task_Type='2' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='6' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Wellselection = [sampleWells[i]];
task.Dynamictipretraction = 5 / volume.assay;' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='Assay' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Empty tips' Value='0' />
						<Parameter Category='Volume' Name='Volume' TaskParameterScript='=volume.assay;' Value='10' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_normal_small_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='2.5' />
						<Parameter Category='Properties' Name='Dynamic tip retraction' Value='' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;3c6b6aaa4e1a04c0981248867138af34&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;1&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='384 adjust 35 right' />
						<Parameter Category='Task Description' Name='Task number' Value='9' />
						<Parameter Category='Task Description' Name='Task description' Value='Dispense (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='12' RowCount='8' SubsetConfig='0' SubsetType='0' TipType='0' />
					</PipetteHead>
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
				<Task Name='Bravo::secondary::Dispense' Task_Type='2' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='14' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='SamplePrep' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Empty tips' Value='1' />
						<Parameter Category='Volume' Name='Volume' Value='10' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_blowout' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='8' />
						<Parameter Category='Properties' Name='Dynamic tip retraction' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='1' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='-7' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6d9e778ac7f7235a77c7705582d38a22&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='11' />
						<Parameter Category='Task Description' Name='Task description' Value='Dispense (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='12' RowCount='8' SubsetConfig='0' SubsetType='0' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Tips Off' Task_Type='32' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='6' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Wellselection = [[1,13-columns]];' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='SampleTips' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Mark tips as used' Value='1' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;b37e670787c8474f935b41a6ceb5f9f6&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='12' />
						<Parameter Category='Task Description' Name='Task description' Value='Tips Off (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='12' RowCount='8' SubsetConfig='0' SubsetType='0' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::Group End' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='13' />
						<Parameter Category='Task Description' Name='Task description' Value='Group End' />
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
				<Dependencies />
			</Pipette_Process>
			<Pipette_Process Name='transferStandards' >
				<Minimized >0</Minimized>
				<Task Name='Bravo::secondary::Set Head Mode' Task_Type='512' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Head mode' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;9132ba130c10b728fbff387cb5cb659a&apos; version=&apos;1.0&apos; &gt;
	&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='Set Head Mode (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::Group Begin' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='2' />
						<Parameter Category='Task Description' Name='Task description' Value='Group Begin' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='Bravo::secondary::Tips On' Task_Type='16' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='7' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='StandardTips' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;d6e19158af474d37af658538fb6eeef8&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;11&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='3' />
						<Parameter Category='Task Description' Name='Task description' Value='Tips On (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Aspirate' Task_Type='1' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='21' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='StandardSource' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Volume' TaskParameterScript='=volume.standard;' Value='10' />
						<Parameter Category='Volume' Name='Pre-aspirate volume' Value='10' />
						<Parameter Category='Volume' Name='Post-aspirate volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_slow_small_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='0.8' />
						<Parameter Category='Properties' Name='Dynamic tip extension' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6543b50eca2ed8c0ec774d51e47a8e12&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='4' />
						<Parameter Category='Task Description' Name='Task description' Value='Aspirate (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Dispense' Task_Type='2' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='StandardPrep' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Empty tips' Value='0' />
						<Parameter Category='Volume' Name='Volume' TaskParameterScript='=volume.standard;' Value='10' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_normal_small_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='2' />
						<Parameter Category='Properties' Name='Dynamic tip retraction' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6543b50eca2ed8c0ec774d51e47a8e12&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='5' />
						<Parameter Category='Task Description' Name='Task description' Value='Dispense (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Mix [Dual Height]' Task_Type='4096' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='47' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='var mixVol = 0.8 * volume.buffer;
task.Volume = (mixVol &lt;= volume.maxMix) ? mixVol : volume.maxMix;' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='StandardPrep' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Volume' Value='' />
						<Parameter Category='Volume' Name='Pre-aspirate volume' Value='0' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_normal_mixing' />
						<Parameter Category='Properties' Name='Mix cycles' Value='10' />
						<Parameter Category='Properties' Name='Dynamic tip extension' Value='0' />
						<Parameter Category='Distance From Well Bottom' Name='Aspirate distance' Value='2' />
						<Parameter Category='Distance From Well Bottom' Name='Dispense at different distance' Value='0' />
						<Parameter Category='Distance From Well Bottom' Name='Dispense distance' Value='2' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6543b50eca2ed8c0ec774d51e47a8e12&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='6' />
						<Parameter Category='Task Description' Name='Task description' Value='Mix (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Aspirate' Task_Type='1' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='12' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Volume = standardWells.length * volume.assay + volume.extra;' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='StandardPrep' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Volume' Value='' />
						<Parameter Category='Volume' Name='Pre-aspirate volume' Value='0' />
						<Parameter Category='Volume' Name='Post-aspirate volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_slow_large_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='1.5' />
						<Parameter Category='Properties' Name='Dynamic tip extension' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6543b50eca2ed8c0ec774d51e47a8e12&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='7' />
						<Parameter Category='Task Description' Name='Task description' Value='Aspirate (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
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
						<Parameter Category='' Name='Number of times to loop' TaskParameterScript='=standardWells.length' Value='1' />
						<Parameter Category='' Name='Change tips every N times, N = ' Value='1' />
					</Parameters>
					<Variables >
						<Variable fIncrement='1' iFreqValue='0' strFrequency='Every time' strInitialValue='0' strVariableName='i' />
					</Variables>
				</Task>
				<Task Name='Bravo::secondary::Dispense' Task_Type='2' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='6' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Wellselection = [standardWells[i]];
task.Dynamictipretraction = 5 / volume.assay;' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='Assay' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Empty tips' Value='0' />
						<Parameter Category='Volume' Name='Volume' TaskParameterScript='=volume.assay;' Value='10' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_normal_small_vol' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='2.5' />
						<Parameter Category='Properties' Name='Dynamic tip retraction' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6543b50eca2ed8c0ec774d51e47a8e12&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='384 adjust 35 right' />
						<Parameter Category='Task Description' Name='Task number' Value='9' />
						<Parameter Category='Task Description' Name='Task description' Value='Dispense (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
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
				<Task Name='Bravo::secondary::Dispense' Task_Type='2' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='14' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='StandardPrep' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Empty tips' Value='1' />
						<Parameter Category='Volume' Name='Volume' Value='10' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='j_blowout' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='8' />
						<Parameter Category='Properties' Name='Dynamic tip retraction' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='1' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='-7' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6543b50eca2ed8c0ec774d51e47a8e12&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='11' />
						<Parameter Category='Task Description' Name='Task description' Value='Dispense (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Tips Off' Task_Type='32' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='6' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='StandardTips' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Mark tips as used' Value='1' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;d6e19158af474d37af658538fb6eeef8&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;11&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='12' />
						<Parameter Category='Task Description' Name='Task description' Value='Tips Off (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::Group End' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='13' />
						<Parameter Category='Task Description' Name='Task description' Value='Group End' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='Bravo::secondary::Move To Location' Task_Type='1024' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='2' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Location' Value='1' />
						<Parameter Category='Task Description' Name='Task number' Value='14' />
						<Parameter Category='Task Description' Name='Task description' Value='Move To Location (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
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
				<Dependencies />
			</Pipette_Process>
		</Main_Processes>
	</Processes>
</Velocity11>