; Written by Wang, Wenshan 2018-02-19 18:32
load "$HOME/scripts/ncl_script/wenshanw.ncl"
;*************************************************************
; Purpose: check time bounds
; Prototype:
; Format:
; Steps:
; Notes:
; Usage:
; To-do:
;*************************************************************
begin
drc = "/home/sainiak/data/jaws/"
drc_prm = drc+"promice/nc/"
drc_gc = drc+"gcnet/nc/02-19-18"

fn_prm = drc_prm+"KAN_B_hour.nc"
fn_gc = drc_gc+"gcnet_dye2_19960704_20161015.nc"

fin_prm = addfile(fn_prm,"r")
;time = fin_prm

;txres = True
;txres@txFontHeightF = 0.005
;txres@txFont = 30
;gsn_text_ndc(wks,"script: "+script, 0.1, 0.1, txres)
end
exit
