//Macros for PMP address and config registers. Insert the hierachycal signal names here:
`define PMP_CFG_REG top.core1.cs_registers_i.pmp_reg_q.pmpcfg
`define PMP_ADDR_REG top.core1.cs_registers_i.pmp_reg_q.pmpaddr

//Macros for the symbolic variables for address and register index:
`define SYMBOLIC_ADDR top.secret_addr
`define SYMBOLIC_REG_INDEX top.reg_index


//Look-up table functions for napot range calculations
function automatic logic[15:0] get_napot_mask(logic[3:0] i);
	casex(`PMP_ADDR_REG[i])
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxx0 : 	get_napot_mask = 16'b1111_1111_1111_1111;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxx01 : 	get_napot_mask = 16'b1111_1111_1111_1110;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxx011 : 	get_napot_mask = 16'b1111_1111_1111_1100;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxxx0111 : 	get_napot_mask = 16'b1111_1111_1111_1000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxx01111 : 	get_napot_mask = 16'b1111_1111_1111_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xx011111 : 	get_napot_mask = 16'b1111_1111_1110_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_x0111111 : 	get_napot_mask = 16'b1111_1111_1100_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_01111111 : 	get_napot_mask = 16'b1111_1111_1000_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxx0_11111111 : 	get_napot_mask = 16'b1111_1111_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxx01_11111111 : 	get_napot_mask = 16'b1111_1110_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxxx011_11111111 : 	get_napot_mask = 16'b1111_1100_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxx0111_11111111 : 	get_napot_mask = 16'b1111_1000_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_xxx01111_11111111 : 	get_napot_mask = 16'b1111_0000_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_xx011111_11111111 : 	get_napot_mask = 16'b1110_0000_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_x0111111_11111111 : 	get_napot_mask = 16'b1100_0000_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_01111111_11111111 : 	get_napot_mask = 16'b1000_0000_0000_0000;
		default: 									get_napot_mask = 16'b0000_0000_0000_0000;
endcase
endfunction


function automatic logic[15:0] get_napot_end(logic[3:0] i);
	casex(`PMP_ADDR_REG[i])
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxx0 : 	get_napot_end = 16'b0000_0000_0000_0001;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxx01 : 	get_napot_end = 16'b0000_0000_0000_0010;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxx011 : 	get_napot_end = 16'b0000_0000_0000_0100;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxxx0111 : 	get_napot_end = 16'b0000_0000_0000_1000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxx01111 : 	get_napot_end = 16'b0000_0000_0001_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xx011111 : 	get_napot_end = 16'b0000_0000_0010_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_x0111111 : 	get_napot_end = 16'b0000_0000_0100_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_01111111 : 	get_napot_end = 16'b0000_0000_1000_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxx0_11111111 : 	get_napot_end = 16'b0000_0001_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxx01_11111111 : 	get_napot_end = 16'b0000_0010_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxxx011_11111111 : 	get_napot_end = 16'b0000_0100_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_xxxx0111_11111111 : 	get_napot_end = 16'b0000_1000_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_xxx01111_11111111 : 	get_napot_end = 16'b0001_0000_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_xx011111_11111111 : 	get_napot_end = 16'b0010_0000_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_x0111111_11111111 : 	get_napot_end = 16'b0100_0000_0000_0000;
		32'bxxxxxxxx_xxxxxxxx_01111111_11111111 : 	get_napot_end = 16'b1000_0000_0000_0000;
		default: 									get_napot_end = 16'b0000_0000_0000_0000;
endcase
endfunction


function automatic logic[4:0] get_napot_rule(logic[3:0] i);
	casex(`PMP_ADDR_REG[i])
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxx0 : 	get_napot_rule = 5'b00001;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxx01 : 	get_napot_rule = 5'b00010;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxx011 : 	get_napot_rule = 5'b00011;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxxx0111 : 	get_napot_rule = 5'b00100;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xxx01111 : 	get_napot_rule = 5'b00101;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_xx011111 : 	get_napot_rule = 5'b00110;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_x0111111 : 	get_napot_rule = 5'b00111;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxxx_01111111 : 	get_napot_rule = 5'b01000;
		32'bxxxxxxxx_xxxxxxxx_xxxxxxx0_11111111 : 	get_napot_rule = 5'b01001;
		32'bxxxxxxxx_xxxxxxxx_xxxxxx01_11111111 : 	get_napot_rule = 5'b01010;
		32'bxxxxxxxx_xxxxxxxx_xxxxx011_11111111 : 	get_napot_rule = 5'b01011;
		32'bxxxxxxxx_xxxxxxxx_xxxx0111_11111111 : 	get_napot_rule = 5'b01100;
		32'bxxxxxxxx_xxxxxxxx_xxx01111_11111111 : 	get_napot_rule = 5'b01101;
		32'bxxxxxxxx_xxxxxxxx_xx011111_11111111 : 	get_napot_rule = 5'b01110;
		32'bxxxxxxxx_xxxxxxxx_x0111111_11111111 : 	get_napot_rule = 5'b01111;
		32'bxxxxxxxx_xxxxxxxx_01111111_11111111 : 	get_napot_rule = 5'b10000;
		default: 									get_napot_rule = 5'b00000;
endcase
endfunction

//core functions
function automatic no_conflicting_entries(logic[3:0] i, logic [2:0] permissions, logic [31:0] start_address, logic [31:0] end_address);
	if (i == 0)
		begin
		no_conflicting_entries = 1'b1;
		end
	else
		begin
		logic no_conflict = 1'b1;
		for(int j=i-1;j>=0;j--)
			begin
			case (`PMP_CFG_REG[j][4:3])
				2'b10: //NA4, 4byte region
					no_conflict = no_conflict & (
						( `PMP_CFG_REG[j][2:0]	== permissions 		) ||	//same permissions
						( `PMP_ADDR_REG[j] 		<  start_address ||			//address ranges are not overlapping
						  `PMP_ADDR_REG[j] 		>= end_address		)
				  	);
				2'b01: //TOR
				begin
					logic [31:0] local_start = (j>0)?`PMP_ADDR_REG[j-1]:32'h0;
					logic [31:0] local_end   = `PMP_ADDR_REG[j];
					no_conflict = no_conflict & ( 
						( `PMP_CFG_REG[j][2:0]	== permissions ) || 	//same permissions
						( local_start < start_address ? local_end < start_address : (local_start > start_address ? local_start >= end_address : 1'b0)	)	//address ranges are not overlapping
					);
				end

				2'b11: //NAPOT
				begin
					logic [15:0] napot_mask 	= get_napot_mask(j);
					logic [31:0] local_start	= `PMP_ADDR_REG[j] & {16'hFFFF, napot_mask};
					logic [31:0] local_end		= `PMP_ADDR_REG[j] + get_napot_end(j) + 1;
					no_conflict = no_conflict & (
						( `PMP_CFG_REG[j][2:0]	== permissions ) 	||																											&&
						( 	napot_mask != 0		&&
							( local_start < start_address ? local_end < start_address : (local_start > start_address ? local_start >= end_address : 1'b0))
						)
					);
				end

				2'b00: //disabled
					no_conflict = no_conflict & 1'b1;
			endcase;
			end;
		no_conflicting_entries = no_conflict;
		end;
endfunction


//`PMP_CFG_REG format L??AAXWR | L=locking; ?=reserved; A=pmp mode bits(00=off, 01=tor, 10=1word, 11=napot);
// X=permission to execute; W=p.t. write; R=p.t. read
function automatic pmp_entry_config(logic[3:0] i, logic [31:0] address, logic [2:0] permissions);
	case (`PMP_CFG_REG[i][4:3])

		2'b10: //NA4, 4byte region
		begin
			logic [31:0] start_address	= address >> 2;
			logic [31:0] end_address	= (address >> 2) + 1; //+1?
			pmp_entry_config = (
				no_conflicting_entries(i, permissions, start_address, end_address) &&
				`PMP_CFG_REG[i]		== {3'b000, 2'b10, permissions} &&
				`PMP_ADDR_REG[i]	== address >> 2 );
		end

		2'b01: //TOR
		begin
			logic [31:0] start_address	= (i>0)?`PMP_ADDR_REG[i-1]:32'h0;
			logic [31:0] end_address	= `PMP_ADDR_REG[i];
			pmp_entry_config = (
				no_conflicting_entries(i, permissions, start_address, end_address) &&
				( (i>0)?(`PMP_CFG_REG[i-1][4:3]	== 2'b00):1'b1 ) &&
				`PMP_CFG_REG[i] 	== {3'b000, 2'b01, permissions} &&
				`PMP_ADDR_REG[i-1]	<= address >> 2 &&
				`PMP_ADDR_REG[i]	>  address >> 2 );
		end

		2'b11: //NAPOT
		begin
			logic [15:0] napot_mask 	= get_napot_mask(i);
			logic [31:0] start_address	= `PMP_ADDR_REG[i] & {16'hFFFF, napot_mask};
			logic [31:0] end_address	= `PMP_ADDR_REG[i] + get_napot_end(i) + 1;
			pmp_entry_config = (
				no_conflicting_entries(i, permissions, start_address, end_address) &&
				napot_mask != 0 &&
				`PMP_CFG_REG[i] == {3'b000, 2'b01, permissions} &&
				start_address	<= (address >> 2) &&
				end_address		>  (address >> 2)
			);
		end

		default:
			pmp_entry_config = 1'b0;
	endcase;

endfunction


//symbolic configuration with no access permissions
function automatic pmp_memory_protection_state();
	pmp_memory_protection_state = (
		pmp_entry_config(`SYMBOLIC_REG_INDEX, `SYMBOLIC_ADDR, 3'b000)
	);
endfunction
