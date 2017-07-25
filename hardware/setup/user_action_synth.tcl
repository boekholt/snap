#-----------------------------------------------------------
#
# Copyright 2016,2017 International Business Machines
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#-----------------------------------------------------------

set log_dir      $::env(LOGS_DIR)
set log_file     $log_dir/user_action_synth.log

#Define widths of each column
set widthCol1 31
set widthCol2 23
set widthCol3 35
set widthCol4 22

##
## open snap project
puts [format "%-*s %-*s %-*s %-*s"  $widthCol1 "" $widthCol2 "open framework project" $widthCol3 "" $widthCol4 "[clock format [clock seconds] -format %H:%M:%S]"]
open_project ../viv_project/framework.xpr >> $log_file

#puts [format "%-*s %-*s %-*s %-*s"  $widthCol1 "" $widthCol2 "start synthesis" $widthCol3 "" $widthCol4  "[clock format [clock seconds] -format %H:%M:%S]"]
#reset_run    synth_1 >> $log_file
#launch_runs  synth_1 >> $log_file
#wait_on_run  synth_1 >> $log_file
#file copy -force ../viv_project/framework.runs/synth_1/psl_fpga.dcp                       ./Checkpoints/snap_and_action_synth.dcp
#file copy -force ../viv_project/framework.runs/synth_1/psl_fpga_utilization_synth.rpt     ./Reports/snap_and_action_utilization_synth.rpt

puts [format "%-*s %-*s %-*s %-*s"  $widthCol1 "" $widthCol2 "start action synthesis" $widthCol3  "" $widthCol4  "[clock format [clock seconds] -format %H:%M:%S]"]
reset_run    user_action_synth_1 >> $log_file
launch_runs  user_action_synth_1 >> $log_file
wait_on_run  user_action_synth_1 >> $log_file
file copy -force ../viv_project/framework.runs/user_action_synth_1/action_wrapper.dcp                       ./Checkpoints/user_action_synth.dcp
file copy -force ../viv_project/framework.runs/user_action_synth_1/action_wrapper_utilization_synth.rpt     ./Reports/user_action_utilization_synth.rpt

close_project  >> $log_file
