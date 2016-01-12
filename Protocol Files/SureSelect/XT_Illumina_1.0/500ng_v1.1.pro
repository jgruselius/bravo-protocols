<?xml version='1.0' encoding='ASCII' ?>
<Velocity11 file='Protocol_Data' md5sum='575e3b20c079133d8a7886a351911c61' version='2.0' >
	<File_Info AllowSimultaneousRun='0' AutoLoadRacks='When the main protocol starts' AutoUnloadRacks='0' AutomaticallyLoadFormFile='1' Barcodes_Directory='' DeleteHitpickFiles='1' Description='' Device_File='C:\VWorks Workspace\Device Files\SureSelect\XT_Illumina\BravoMiniPHBenchCel_round_magnet.dev' DynamicAssignPlateStorageLoad='0' FinishScript='' Form_File='' HandlePlatesInInstance='1' Notes='' PipettePlatesInInstanceOrder='1' Protocol_Alias='' StartScript='' Use_Global_JS_Context='1' />
	<Processes >
		<Startup_Processes >
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::User Message' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='11' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if (formProtocolName != undefined) task.skip()' />
					<Parameters >
						<Parameter Category='' Name='Title' Value='Place Labware' />
						<Parameter Category='' Name='Body' Value='Place the source plate at position 5.

Place the destination plate (ABI PCR plate in carrier) at position 9.

Place a new tip box at 8 and empty tip box at position 6.' />
						<Parameter Category='' Name='Only show the first time' Value='' />
						<Parameter Category='Scripting variable data entry' Name='User data entry into variable' Value='0' />
						<Parameter Category='Scripting variable data entry' Name='Variable name' Value='' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='//  Create map of wells for tip loading
well_map_96 = []
well_map_96[0]   = [ [ 1 , 1 ] ]
well_map_96[1]   = [ [ 2 , 1 ] ]
well_map_96[2]   = [ [ 3 , 1 ] ]
well_map_96[3]   = [ [ 4 , 1 ] ]
well_map_96[4]   = [ [ 5 , 1 ] ]
well_map_96[5]   = [ [ 6 , 1 ] ]
well_map_96[6]   = [ [ 7 , 1 ] ]
well_map_96[7]   = [ [ 8 , 1 ] ]
well_map_96[8]   = [ [ 1 , 2 ] ]
well_map_96[9]   = [ [ 2 , 2 ] ]
well_map_96[10] = [ [ 3 , 2 ] ]
well_map_96[11] = [ [ 4 , 2 ] ]
well_map_96[12] = [ [ 5 , 2 ] ]
well_map_96[13] = [ [ 6 , 2 ] ]
well_map_96[14] = [ [ 7 , 2 ] ]
well_map_96[15] = [ [ 8 , 2 ] ]
well_map_96[16] = [ [ 1 , 3 ] ]
well_map_96[17] = [ [ 2 , 3 ] ]
well_map_96[18] = [ [ 3 , 3 ] ]
well_map_96[19] = [ [ 4 , 3 ] ]
well_map_96[20] = [ [ 5 , 3 ] ]
well_map_96[21] = [ [ 6 , 3 ] ]
well_map_96[22] = [ [ 7 , 3 ] ]
well_map_96[23] = [ [ 8 , 3 ] ]
well_map_96[24] = [ [ 1 , 4 ] ]
well_map_96[25] = [ [ 2 , 4 ] ]
well_map_96[26] = [ [ 3 , 4 ] ]
well_map_96[27] = [ [ 4 , 4 ] ]
well_map_96[28] = [ [ 5 , 4 ] ]
well_map_96[29] = [ [ 6 , 4 ] ]
well_map_96[30] = [ [ 7 , 4 ] ]
well_map_96[31] = [ [ 8 , 4 ] ]
well_map_96[32] = [ [ 1 , 5 ] ]
well_map_96[33] = [ [ 2 , 5 ] ]
well_map_96[34] = [ [ 3 , 5 ] ]
well_map_96[35] = [ [ 4 , 5 ] ]
well_map_96[36] = [ [ 5 , 5 ] ]
well_map_96[37] = [ [ 6 , 5 ] ]
well_map_96[38] = [ [ 7 , 5 ] ]
well_map_96[39] = [ [ 8 , 5 ] ]
well_map_96[40] = [ [ 1 , 6 ] ]
well_map_96[41] = [ [ 2 , 6 ] ]
well_map_96[42] = [ [ 3 , 6 ] ]
well_map_96[43] = [ [ 4 , 6 ] ]
well_map_96[44] = [ [ 5 , 6 ] ]
well_map_96[45] = [ [ 6 , 6 ] ]
well_map_96[46] = [ [ 7 , 6 ] ]
well_map_96[47] = [ [ 8 , 6 ] ]
well_map_96[48] = [ [ 1 , 7 ] ]
well_map_96[49] = [ [ 2 , 7 ] ]
well_map_96[50] = [ [ 3 , 7 ] ]
well_map_96[51] = [ [ 4 , 7 ] ]
well_map_96[52] = [ [ 5 , 7 ] ]
well_map_96[53] = [ [ 6 , 7 ] ]
well_map_96[54] = [ [ 7 , 7 ] ]
well_map_96[55] = [ [ 8 , 7 ] ]
well_map_96[56] = [ [ 1 , 8 ] ]
well_map_96[57] = [ [ 2 , 8 ] ]
well_map_96[58] = [ [ 3 , 8 ] ]
well_map_96[59] = [ [ 4 , 8 ] ]
well_map_96[60] = [ [ 5 , 8 ] ]
well_map_96[61] = [ [ 6 , 8 ] ]
well_map_96[62] = [ [ 7 , 8 ] ]
well_map_96[63] = [ [ 8 , 8 ] ]
well_map_96[64] = [ [ 1 , 9 ] ]
well_map_96[65] = [ [ 2 , 9 ] ]
well_map_96[66] = [ [ 3 , 9 ] ]
well_map_96[67] = [ [ 4 , 9 ] ]
well_map_96[68] = [ [ 5 , 9 ] ]
well_map_96[69] = [ [ 6 , 9 ] ]
well_map_96[70] = [ [ 7 , 9 ] ]
well_map_96[71] = [ [ 8 , 9 ] ]
well_map_96[72] = [ [ 1 , 10 ] ]
well_map_96[73] = [ [ 2 , 10 ] ]
well_map_96[74] = [ [ 3 , 10 ] ]
well_map_96[75] = [ [ 4 , 10 ] ]
well_map_96[76] = [ [ 5 , 10 ] ]
well_map_96[77] = [ [ 6 , 10 ] ]
well_map_96[78] = [ [ 7 , 10 ] ]
well_map_96[79] = [ [ 8 , 10 ] ]
well_map_96[80] = [ [ 1 , 11 ] ]
well_map_96[81] = [ [ 2 , 11 ] ]
well_map_96[82] = [ [ 3 , 11 ] ]
well_map_96[83] = [ [ 4 , 11 ] ]
well_map_96[84] = [ [ 5 , 11 ] ]
well_map_96[85] = [ [ 6 , 11 ] ]
well_map_96[86] = [ [ 7 , 11 ] ]
well_map_96[87] = [ [ 8 , 11 ] ]
well_map_96[88] = [ [ 1 , 12 ] ]
well_map_96[89] = [ [ 2 , 12 ] ]
well_map_96[90] = [ [ 3 , 12 ] ]
well_map_96[91] = [ [ 4 , 12 ] ]
well_map_96[92] = [ [ 5 , 12 ] ]
well_map_96[93] = [ [ 6 , 12 ] ]
well_map_96[94] = [ [ 7 , 12 ] ]
well_map_96[95] = [ [ 8 , 12 ] ]' />
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='startup process - 1' />
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
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
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
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='Transfer 500ng' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='Source' />
					<Parameter Name='Plate type' Value='96 Eppendorf Twin.tec PCR' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
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
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='Transfer 500ng' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='Destination' />
					<Parameter Name='Plate type' Value='96 ABI PCR half skirt in black carrier' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
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
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='Transfer 500ng' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='New tips' />
					<Parameter Name='Plate type' Value='96 V11 LT250 Tip Box 19477.002' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='1' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
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
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='Transfer 500ng' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='Used tips' />
					<Parameter Name='Plate type' Value='96 V11 LT250 Tip Box 19477.002' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='1' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Barcode filename' Value='No Selection' />
					<Parameter Name='Has header' Value='' />
					<Parameter Name='Barcode or header South' Value='No Selection' />
					<Parameter Name='Barcode or header West' Value='No Selection' />
					<Parameter Name='Barcode or header North' Value='No Selection' />
					<Parameter Name='Barcode or header East' Value='No Selection' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
			<Pipette_Process Name='Transfer 500ng' >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='current_tip = 0' />
				</Task>
				<Task Name='Bravo::secondary::Hit Pick Routine (Begin)' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Test' Value='Test' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='12' RowCount='8' SubsetConfig='0' SubsetType='0' TipType='1' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Set Head Mode' Task_Type='512' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Head mode' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;f3c57de56bf5d361ee4249fe09d18f71&apos; version=&apos;1.0&apos; &gt;
	&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
&lt;/Velocity11&gt;' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Tips On' Task_Type='16' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Wellselection = well_map_96[current_tip]
print(&quot;Loading tip number &quot;+current_tip+&quot; at &quot;+task.Wellselection)' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='New tips' />
						<Parameter Category='' Name='Location, location' Value='8' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;b4a3b031f296ad0b0a739379f6d67492&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;1&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Hit Pick Replication' Task_Type='64' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='29' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Built-in Parameters' Name='Source, plate' Value='Source' />
						<Parameter Category='Built-in Parameters' Name='Source, location' Value='5' />
						<Parameter Category='Built-in Parameters' Name='Destination, plate' Value='Destination' />
						<Parameter Category='Built-in Parameters' Name='Destination, location' Value='9' />
						<Parameter Category='Built-in Parameters' Name='Choose input file at protocol start' Value='1' />
						<Parameter Category='Built-in Parameters' Name='Input file' Value='C:\VWorks Workspace\Hit Pick Input Files\500ng Normalization\500ng_transfer_full_plate_template.csv' />
						<Parameter Category='Built-in Parameters' Name='Format file' Value='500ng transfer.xml' />
						<Parameter Category='Built-in Parameters' Name='Verify source plate barcodes' Value='0' />
						<Parameter Category='Built-in Parameters' Name='Update Database' Value='1' />
						<Parameter Category='Built-in Parameters' Name='Output file' Value='C:\VWorks Workspace\VWorks\Hit Picking\Output Files\HitPickFiles 6_7_2011 5_00_08 PM\HitPick1.csv' />
						<Parameter Category='Built-in Parameters' Name='Head mode' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;f3c57de56bf5d361ee4249fe09d18f71&apos; version=&apos;1.0&apos; &gt;
	&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Built-in Parameters' Name='Transfers' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;8512bcc55b5664da79922dcc19a4f489&apos; version=&apos;1.0&apos; &gt;
	&lt;CherryPickTransfers &gt;
		&lt;CherryTransfers &gt;
			&lt;CherryPickTransfer Volume=&apos;0&apos; &gt;
				&lt;SourceWell Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
				&lt;DestinationWell Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
			&lt;/CherryPickTransfer&gt;
		&lt;/CherryTransfers&gt;
	&lt;/CherryPickTransfers&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Built-in Parameters' Name='SourcePlateLabware' Value='96 Eppendorf Twin.tec PCR' />
						<Parameter Category='Built-in Parameters' Name='DestinationPlateLabware' Value='96 ABI PCR half skirt in black carrier' />
						<Parameter Category='Built-in Parameters' Name='SourceBarcodeSide' Value='None' />
						<Parameter Category='Aspirate' Name='Pre-aspirate volume' Value='2' />
						<Parameter Category='Aspirate' Name='Post-aspirate volume' Value='0' />
						<Parameter Category='Aspirate' Name='Liquid class' Value='96 disposable tip 5 - 25ul hit pick' />
						<Parameter Category='Aspirate' Name='Distance from well bottom' Value='0.5' />
						<Parameter Category='Aspirate' Name='Dynamic tip extension' Value='0' />
						<Parameter Category='Aspirate' Name='Pipette technique' Value='' />
						<Parameter Category='Aspirate' Name='Perform tip touch' Value='0' />
						<Parameter Category='Aspirate' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Aspirate' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Aspirate' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Dispense' Name='Blowout volume' Value='2' />
						<Parameter Category='Dispense' Name='Liquid class' Value='96 disposable tip 5 - 25ul hit pick' />
						<Parameter Category='Dispense' Name='Distance from well bottom' Value='0.5' />
						<Parameter Category='Dispense' Name='Dynamic tip retraction' Value='0' />
						<Parameter Category='Dispense' Name='Pipette technique' Value='' />
						<Parameter Category='Dispense' Name='Perform tip touch' Value='0' />
						<Parameter Category='Dispense' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Dispense' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Dispense' Name='Tip touch horizontal offset' Value='0' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
					<CherryRoutineWizardParams Additional_Ops='0' Auto_Skip_Headings_YesNO='1' Backfill_Destination_Plate='' Backfill_Destination_Plate_Location='' Backfill_HitPickTask='' Backfill_Source_Plate='' Backfill_Source_Plate_Location='' Backfill_Transfer_Params='' Change_Tips_When='1' Change_tip_box='0' Destination_Plate='Destination' Destination_Plate_Column='' Destination_Plate_Location='9' Destination_Well_Col='' Destination_Well_ID_YesNO='0' Destination_Well_Row='' Destination_Well_Row_Col_YesNO='0' Dual_Wash='0' Format_File='500ng transfer.xml' Hit_Pick_Transfer_Params='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;4d592ac55f2f9b0001b9d45a0641d3e5&apos; version=&apos;1.0&apos; &gt;
	&lt;ModuleObjectDescription &gt;
		&lt;Categories &gt;
			&lt;ObjectParameterCategory Description=&apos;Transfer fluid out of wells and into tips&apos; Name=&apos;Aspirate&apos; &gt;
				&lt;Parameters &gt;
					&lt;Parameter Category=&apos;Volume&apos; Description=&apos;Volume of air to be aspirated before the tips enter the plate.&apos; Name=&apos;Pre-aspirate volume&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;12&apos; Units=&apos;킠&apos; Value=&apos;2&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;0&apos; /&gt;
							&lt;Range Value=&apos;251&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Volume&apos; Description=&apos;Volume of air to be aspirated after the tips have exited the plate.&apos; Name=&apos;Post-aspirate volume&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;12&apos; Units=&apos;킠&apos; Value=&apos;0&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;0&apos; /&gt;
							&lt;Range Value=&apos;251&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Properties&apos; Description=&apos;Liquid class to use in determining pipette velocity and accelerations.&apos; Name=&apos;Liquid class&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;11&apos; Value=&apos;96 disposable tip 5 - 25ul hit pick&apos; /&gt;
					&lt;Parameter Category=&apos;Properties&apos; Description=&apos;Distance between well bottom and the pipette tips.&apos; Name=&apos;Distance from well bottom&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;12&apos; Units=&apos;mm&apos; Value=&apos;0.5&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;0&apos; /&gt;
							&lt;Range Value=&apos;100&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Properties&apos; Description=&apos;Value which determines the amount the Z-axis moves while pipetting.&apos; Name=&apos;Dynamic tip extension&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;12&apos; Units=&apos;mm/킠&apos; Value=&apos;0&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;0&apos; /&gt;
							&lt;Range Value=&apos;20&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Properties&apos; Description=&apos;Specifies an additional pipette technique.&apos; Name=&apos;Pipette technique&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;21&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range /&gt;
							&lt;Range Value=&apos;Name of new technique&apos; /&gt;
							&lt;Range Value=&apos;PIpette Technique&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Tip Touch&apos; Description=&apos;Determines whether or not a tip touch will be performed after each selection of the plate.&apos; Name=&apos;Perform tip touch&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;0&apos; Value=&apos;0&apos; /&gt;
					&lt;Parameter Category=&apos;Tip Touch&apos; Description=&apos;Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.&apos; Hide_if=&apos;Variable(Perform tip touch) == Const(0)&apos; Name=&apos;Which sides to use for tip touch&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;2&apos; Value=&apos;None&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;None&apos; /&gt;
							&lt;Range Value=&apos;South&apos; /&gt;
							&lt;Range Value=&apos;West&apos; /&gt;
							&lt;Range Value=&apos;North&apos; /&gt;
							&lt;Range Value=&apos;East&apos; /&gt;
							&lt;Range Value=&apos;South/North&apos; /&gt;
							&lt;Range Value=&apos;West/East&apos; /&gt;
							&lt;Range Value=&apos;West/East/South/North&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Tip Touch&apos; Description=&apos;Relative distance the Z-axis will move up before performing the tip touch.&apos; Hide_if=&apos;Variable(Perform tip touch) == Const(0)&apos; Name=&apos;Tip touch retract distance&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;12&apos; Units=&apos;mm&apos; Value=&apos;0&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;-20&apos; /&gt;
							&lt;Range Value=&apos;50&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Tip Touch&apos; Description=&apos;Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.&apos; Hide_if=&apos;Variable(Perform tip touch) == Const(0)&apos; Name=&apos;Tip touch horizontal offset&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;12&apos; Units=&apos;mm&apos; Value=&apos;0&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;-5&apos; /&gt;
							&lt;Range Value=&apos;5&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
				&lt;/Parameters&gt;
			&lt;/ObjectParameterCategory&gt;
			&lt;ObjectParameterCategory Description=&apos;Transfer fluid out of tips and into wells&apos; Name=&apos;Dispense&apos; &gt;
				&lt;Parameters &gt;
					&lt;Parameter Category=&apos;Volume&apos; Description=&apos;Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.&apos; Name=&apos;Blowout volume&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;12&apos; Units=&apos;킠&apos; Value=&apos;2&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;0&apos; /&gt;
							&lt;Range Value=&apos;251&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Properties&apos; Description=&apos;Liquid class to use in determining pipette velocity and accelerations.&apos; Name=&apos;Liquid class&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;11&apos; Value=&apos;96 disposable tip 5 - 25ul hit pick&apos; /&gt;
					&lt;Parameter Category=&apos;Properties&apos; Description=&apos;Distance between well bottom and the pipette tips.&apos; Name=&apos;Distance from well bottom&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;12&apos; Units=&apos;mm&apos; Value=&apos;0.5&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;0&apos; /&gt;
							&lt;Range Value=&apos;100&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Properties&apos; Description=&apos;Dynamic tip retraction&apos; Name=&apos;Dynamic tip retraction&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;12&apos; Units=&apos;mm/킠&apos; Value=&apos;0&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;0&apos; /&gt;
							&lt;Range Value=&apos;20&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Properties&apos; Description=&apos;Specifies an additional pipette technique.&apos; Name=&apos;Pipette technique&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;21&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range /&gt;
							&lt;Range Value=&apos;Name of new technique&apos; /&gt;
							&lt;Range Value=&apos;PIpette Technique&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Tip Touch&apos; Description=&apos;Determines whether or not a tip touch will be performed after each selection of the plate.&apos; Name=&apos;Perform tip touch&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;0&apos; Value=&apos;0&apos; /&gt;
					&lt;Parameter Category=&apos;Tip Touch&apos; Description=&apos;Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.&apos; Hide_if=&apos;Variable(Perform tip touch) == Const(0)&apos; Name=&apos;Which sides to use for tip touch&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;2&apos; Value=&apos;None&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;None&apos; /&gt;
							&lt;Range Value=&apos;South&apos; /&gt;
							&lt;Range Value=&apos;West&apos; /&gt;
							&lt;Range Value=&apos;North&apos; /&gt;
							&lt;Range Value=&apos;East&apos; /&gt;
							&lt;Range Value=&apos;South/North&apos; /&gt;
							&lt;Range Value=&apos;West/East&apos; /&gt;
							&lt;Range Value=&apos;West/East/South/North&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Tip Touch&apos; Description=&apos;Relative distance the Z-axis will move up before performing the tip touch.&apos; Hide_if=&apos;Variable(Perform tip touch) == Const(0)&apos; Name=&apos;Tip touch retract distance&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;12&apos; Units=&apos;mm&apos; Value=&apos;0&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;-20&apos; /&gt;
							&lt;Range Value=&apos;50&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
					&lt;Parameter Category=&apos;Tip Touch&apos; Description=&apos;Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.&apos; Hide_if=&apos;Variable(Perform tip touch) == Const(0)&apos; Name=&apos;Tip touch horizontal offset&apos; Scriptable=&apos;1&apos; Style=&apos;0&apos; Type=&apos;12&apos; Units=&apos;mm&apos; Value=&apos;0&apos; &gt;
						&lt;Ranges &gt;
							&lt;Range Value=&apos;-5&apos; /&gt;
							&lt;Range Value=&apos;5&apos; /&gt;
						&lt;/Ranges&gt;
					&lt;/Parameter&gt;
				&lt;/Parameters&gt;
			&lt;/ObjectParameterCategory&gt;
		&lt;/Categories&gt;
	&lt;/ModuleObjectDescription&gt;
&lt;/Velocity11&gt;' Input_At_Start='1' Input_File='' Num_Wash_Cycles_Every_Transfer='1' Number of Columns in the Input File='0' Skip_Heading_Lines_Num='1' Source_Plate='Source' Source_Plate_BC='None' Source_Plate_Column='1' Source_Plate_Location='5' Source_Well_Col='' Source_Well_ID_Column='2' Source_Well_ID_YesNO='1' Source_Well_Row='' Source_Well_Row_Col_YesNO='0' Start_From_Transfer_Num='1' Variable_Dilution_Factor_Column='' Variable_Transfer_Volume_Column='4' Version='1.0' Wash_When='0' Will_Mix='0' Will_Mix_Before='0' >
						<MixPreAsp >
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
						</MixPreAsp>
						<Mix_In_Reservoir >
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
						</Mix_In_Reservoir>
						<MixPostDisp >
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
							<Mix Value=' ' />
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
						</MixPostDisp>
						<Mix_In_Reservoir >
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
							<Mix Value=' ' />
							<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
									<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='251' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
									<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
										<Ranges >
											<Range Value='0' />
											<Range Value='20' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
										<Ranges >
											<Range Value='0' />
											<Range Value='100' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
										<Ranges >
											<Range Value='None' />
											<Range Value='South' />
											<Range Value='West' />
											<Range Value='North' />
											<Range Value='East' />
											<Range Value='South/North' />
											<Range Value='West/East' />
											<Range Value='West/East/South/North' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-20' />
											<Range Value='50' />
										</Ranges>
									</Parameter>
									<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
										<Ranges >
											<Range Value='-5' />
											<Range Value='5' />
										</Ranges>
									</Parameter>
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
									<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
										<Ranges >
											<Range />
											<Range Value='Name of new technique' />
											<Range Value='PIpette Technique' />
										</Ranges>
									</Parameter>
								</Parameters>
							</Command>
						</Mix_In_Reservoir>
						<Washes >
							<Wash >
								<Command Compiler='17' Description='Wash tips' Editor='4' Name='Wash Tips' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
									<Parameters >
										<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
										<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
										<Parameter Category='Volume' Description='Empty all liquid from the tips, instead of using the dispense volume.' Name='Empty tips' Scriptable='1' Style='0' Type='0' Value='0' />
										<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
											<Ranges >
												<Range Value='0' />
												<Range Value='251' />
											</Ranges>
										</Parameter>
										<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
											<Ranges >
												<Range Value='0' />
												<Range Value='251' />
											</Ranges>
										</Parameter>
										<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Hide_if='Variable(Empty tips) != Const(0)' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
											<Ranges >
												<Range Value='0' />
												<Range Value='251' />
											</Ranges>
										</Parameter>
										<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
										<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
											<Ranges >
												<Range Value='0' />
												<Range Value='100' />
											</Ranges>
										</Parameter>
										<Parameter Category='Properties' Description='Distance between well bottom and the pipette tips.' Name='Distance from well bottom' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
											<Ranges >
												<Range Value='0' />
												<Range Value='100' />
											</Ranges>
										</Parameter>
										<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
											<Ranges >
												<Range Value='0' />
												<Range Value='20' />
											</Ranges>
										</Parameter>
										<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
										<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
											<Ranges >
												<Range Value='None' />
												<Range Value='South' />
												<Range Value='West' />
												<Range Value='North' />
												<Range Value='East' />
												<Range Value='South/North' />
												<Range Value='West/East' />
												<Range Value='West/East/South/North' />
											</Ranges>
										</Parameter>
										<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
											<Ranges >
												<Range Value='-20' />
												<Range Value='50' />
											</Ranges>
										</Parameter>
										<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
											<Ranges >
												<Range Value='-5' />
												<Range Value='5' />
											</Ranges>
										</Parameter>
										<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6d9e778ac7f7235a77c7705582d38a22&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
										<Parameter Category='Pump' Description='Percentage of full speed that the inflow pump will run at during the wash.' Name='Pump fill speed' Scriptable='1' Style='0' Type='12' Units='%' Value='50' >
											<Ranges >
												<Range Value='0' />
												<Range Value='100' />
											</Ranges>
										</Parameter>
										<Parameter Category='Pump' Description='Percentage of full speed that the outflow pump will run at during the wash.' Name='Pump empty speed' Scriptable='1' Style='0' Type='12' Units='%' Value='50' >
											<Ranges >
												<Range Value='0' />
												<Range Value='100' />
											</Ranges>
										</Parameter>
										<Parameter Category='Dispense To Waste' Description='In a wash, this value determines if the dispense will occur in the waste area of the wash reservoir.' Name='Dispense to waste during wash' Scriptable='1' Style='0' Type='0' Value='0' />
										<Parameter Category='Dispense To Waste' Description='If dispensing to a waste area, this value determines the Z-axis position relative to the top of the wash chimneys.  A positive number will cause the dispense above the chimneys, a negative number will cause the dispense below the chimneys.' Hide_if='Variable(Dispense to waste during wash) == Const(0)' Name='Dispense to waste at height' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
											<Ranges >
												<Range Value='-10' />
												<Range Value='5' />
											</Ranges>
										</Parameter>
									</Parameters>
								</Command>
							</Wash>
						</Washes>
						<Wash_Mixes >
							<Wash_Mix >
								<Command Compiler='17' Description='Mix fluid in wells' DisplayName='Mix' Editor='4' Name='Mix [Dual Height]' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
									<Parameters >
										<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' />
										<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='&lt;auto-select&gt;' />
										<Parameter Category='Volume' Description='Volume to be pipetted from each selection of the plate.' Name='Volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='10' >
											<Ranges >
												<Range Value='0' />
												<Range Value='251' />
											</Ranges>
										</Parameter>
										<Parameter Category='Volume' Description='Volume of air to be aspirated before the tips enter the plate.' Name='Pre-aspirate volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
											<Ranges >
												<Range Value='0' />
												<Range Value='251' />
											</Ranges>
										</Parameter>
										<Parameter Category='Volume' Description='Additional volume to be dispensed in the final selection of the plate.  For mix or wash tasks, this will be done on the last cycle of the final selection of the plate.' Name='Blowout volume' Scriptable='1' Style='0' Type='12' Units='킠' Value='0' >
											<Ranges >
												<Range Value='0' />
												<Range Value='251' />
											</Ranges>
										</Parameter>
										<Parameter Category='Properties' Description='Liquid class to use in determining pipette velocity and accelerations.' Name='Liquid class' Scriptable='1' Style='0' Type='11' />
										<Parameter Category='Properties' Description='Number of cycles to mix or wash.  A cycle consists of an aspirate and dispense.' Name='Mix cycles' Scriptable='1' Style='0' Type='8' Value='3' >
											<Ranges >
												<Range Value='0' />
												<Range Value='100' />
											</Ranges>
										</Parameter>
										<Parameter Category='Properties' Description='Value which determines the amount the Z-axis moves while pipetting.' Name='Dynamic tip extension' Scriptable='1' Style='0' Type='12' Units='mm/킠' Value='0' >
											<Ranges >
												<Range Value='0' />
												<Range Value='20' />
											</Ranges>
										</Parameter>
										<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while aspirating.' Name='Aspirate distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
											<Ranges >
												<Range Value='0' />
												<Range Value='100' />
											</Ranges>
										</Parameter>
										<Parameter Category='Distance From Well Bottom' Description='Allows the dispense to occur at a different distance than the aspirate.  If checked, then the &quot;Dispense distance&quot; parameter will be used to specify the dispense distance from well bottom.  If not checked, then the dispense will occur at the same distance from well bottom as the aspirate.' Name='Dispense at different distance' Scriptable='1' Style='0' Type='0' Value='0' />
										<Parameter Category='Distance From Well Bottom' Description='Distance from well bottom while dispensing.' Hide_if='Variable(Dispense at different distance) == Const(0)' Name='Dispense distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='2' >
											<Ranges >
												<Range Value='0' />
												<Range Value='100' />
											</Ranges>
										</Parameter>
										<Parameter Category='Tip Touch' Description='Determines whether or not a tip touch will be performed after each selection of the plate.' Name='Perform tip touch' Scriptable='1' Style='0' Type='0' Value='0' />
										<Parameter Category='Tip Touch' Description='Which sides to use for tip touch.  If dispensing to waste in a wash task, the tips will always move in the North-West direction, regardless of the selection.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Which sides to use for tip touch' Scriptable='1' Style='0' Type='2' Value='None' >
											<Ranges >
												<Range Value='None' />
												<Range Value='South' />
												<Range Value='West' />
												<Range Value='North' />
												<Range Value='East' />
												<Range Value='South/North' />
												<Range Value='West/East' />
												<Range Value='West/East/South/North' />
											</Ranges>
										</Parameter>
										<Parameter Category='Tip Touch' Description='Relative distance the Z-axis will move up before performing the tip touch.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch retract distance' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
											<Ranges >
												<Range Value='-20' />
												<Range Value='50' />
											</Ranges>
										</Parameter>
										<Parameter Category='Tip Touch' Description='Value which combines with the well diameter to determine the horizontal distance the head moves during a tip touch.  A positive number increases the distance, a negative number reduces the distance.' Hide_if='Variable(Perform tip touch) == Const(0)' Name='Tip touch horizontal offset' Scriptable='1' Style='0' Type='12' Units='mm' Value='0' >
											<Ranges >
												<Range Value='-5' />
												<Range Value='5' />
											</Ranges>
										</Parameter>
										<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;33f6e0409b3bd968a3f00d542fa4363f&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;1&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;1&apos; IsQuadrantPattern=&apos;0&apos; LinkedText=&apos;From hit pick task&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
										<Parameter Category='Properties' Description='Specifies an additional pipette technique.' Name='Pipette technique' Scriptable='1' Style='0' Type='21' >
											<Ranges >
												<Range />
												<Range Value='Name of new technique' />
												<Range Value='PIpette Technique' />
											</Ranges>
										</Parameter>
									</Parameters>
								</Command>
							</Wash_Mix>
						</Wash_Mixes>
						<Tips_On >
							<Command Compiler='17' Description='Put tips on pipette head' Editor='4' Name='Tips On' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' Value='New tips' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='8' />
									<Parameter Category='Properties' Description='If checked, VWorks will determine what position in the tipbox to use when performing the tip operation.  If not checked, the user must specify the position of the tip operation with the &quot;well selection&quot; parameter.' Name='Allow automatic tracking of tip usage' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Hide_if='Variable(Allow automatic tracking of tip usage) != Const(0)' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;b37e670787c8474f935b41a6ceb5f9f6&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
								</Parameters>
							</Command>
						</Tips_On>
						<Tips_Off >
							<Command Compiler='17' Description='Remove tips from pipette head' Editor='4' Name='Tips Off' NextTaskToExecute='1' RequiresRefresh='0' TaskRequiresLocation='1' VisibleAvailability='1' >
								<Parameters >
									<Parameter Description='Plate to use in the pipette task.' Name='Location, plate' Scriptable='1' Style='0' Type='5' Value='Used tips' />
									<Parameter Description='Plate to use in the pipette task.' Name='Location, location' Scriptable='1' Style='0' Type='5' Value='6' />
									<Parameter Category='Properties' Description='If checked, VWorks will determine what position in the tipbox to use when performing the tip operation.  If not checked, the user must specify the position of the tip operation with the &quot;well selection&quot; parameter.' Name='Allow automatic tracking of tip usage' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Properties' Description='If checked, then the software will mark the shucked tips as being used.  If not checked, the software will treat the shucked tips as new, and can reuse the tips in subsequent tasks.' Name='Mark tips as used' Scriptable='1' Style='0' Type='0' Value='0' />
									<Parameter Category='Properties' Description='Which selections in the plate are to be pipetted.' Hide_if='Variable(Allow automatic tracking of tip usage) != Const(0)' Name='Well selection' Scriptable='1' Style='0' Type='7' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;b37e670787c8474f935b41a6ceb5f9f6&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;12&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;0&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
								</Parameters>
							</Command>
						</Tips_Off>
						<Tips_On_Column />
						<Tips_Off_Column />
					</CherryRoutineWizardParams>
				</Task>
				<Task Name='Bravo::secondary::Tips Off' Task_Type='32' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='5.0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Wellselection = well_map_96[current_tip]
print(&quot;Unloading tip number &quot;+current_tip+&quot; at &quot;+task.Wellselection)
current_tip++' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='Used tips' />
						<Parameter Category='' Name='Location, location' Value='6' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Mark tips as used' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;ab99b0c18d761e0a5915f3aaa41401fe&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;1&apos; SubsetConfig=&apos;0&apos; SubsetType=&apos;4&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Hit Pick Routine (End)' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Test' Value='Test' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='1' SubsetConfig='0' SubsetType='4' TipType='0' />
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