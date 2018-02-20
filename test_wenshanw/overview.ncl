; Written by Wang, Wenshan 2017/11/16 15:13
load "$HOME/scripts/ncl_script/wenshanw.ncl"
;*************************************************************
; Purpose: dump files
; Prototype:
; Format:
; Steps:
; Notes:
; Usage:
; To-do:
;*************************************************************
begin
drc = "/data/wenshanw/gcnet/netcdf/"

stns = systemfunc("ls "+drc+"*.2008-2016.nc | cut -d '/' -f 6 | cut -d '.' -f 1")
;print(stns+"")

fns = drc+stns+".2008-2016.nc"
fins = addfiles(fns,"r")
ListSetType(fins,"join")

shgt1 = fins[:]->snow_height1
shgt2 = fins[:]->snow_height2

;printbf(shgt1)
;printbf(shgt2)

print(num(shgt1.lt.0)+" "+num(.not.ismissing(shgt1)))
print(num(shgt2.lt.0)+" "+num(.not.ismissing(shgt2)))
print(num(shgt1.gt.0)+" "+num(.not.ismissing(shgt1)))
print(num(shgt2.gt.0)+" "+num(.not.ismissing(shgt2)))

;txres = True
;txres@txFontHeightF = 0.005
;txres@txFont = 30
;gsn_text_ndc(wks,"script: "+script, 0.1, 0.1, txres)
end
exit
