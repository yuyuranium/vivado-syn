set top_module "mkStack8x16"
set fpga_part "xc7z020clg400-1"

set inc_dir [file normalize "../inc"]
set rtl_dir [file normalize "../rtl"]
set constrs_dir [file normalize "../constrs"]

add_files -fileset sources_1 "${inc_dir}" "${rtl_dir}"
add_files -fileset constrs_1 "${constrs_dir}"

# read_verilog -sv sugar.svh
# read_verilog -sv { seg7.sv counter4b.sv debounce.sv top.sv}

# read_xdc pynq_z2.xdc

synth_design -constrset constrs_1 -top "${top_module}" -part "${fpga_part}"

opt_design
place_design
route_design

write_bitstream -force "${top_module}.bit"
