set top_module "top"

open_hw_manager
connect_hw_server
current_hw_target
open_hw_target
set_property PROGRAM.FILE "${top_module}.bit" [current_hw_device]
program_hw_devices [current_hw_device]
