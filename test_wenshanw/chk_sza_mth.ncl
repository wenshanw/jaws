; Written by Wang, Wenshan 2018-02-19 17:36
load "$HOME/scripts/ncl_script/wenshanw.ncl"
load "$HOME/cloud/gcnet/cal_para.ncl"
;*************************************************************
; Purpose: check python SZA in all 12 months
; Prototype:
; Format:
; Steps:
; Notes:
; Usage:
; To-do:
;*************************************************************
begin
drc = "/home/sainiak/data/jaws/promice/nc/"
stn = "KAN_B"
fn = drc+stn+"_hour.nc"
fin = addfile(fn,"r")

lat = fin->latitude
lon = fin->longitude

yr = 2013
mb = 1
me = 12
dd = 15

year = fin->year
month = fin->month
day = fin->day
;print(year)
;print(year+" "+month+" "+day)
tm = ind(year.eq.yr.and.day.eq.dd)
;print(tm)
;exit

;time = cd_calendar(fin->time,6)
;print(time(tm,0)+"  "+time(tm,1)+"  "+time(tm,2)+"  "+time(tm,3))
;print(year(tm)+"  "+month(tm)+" "+day(tm))
;print(time(:9,0)+"  "+time(:9,1)+"  "+time(:9,2)+"  "+time(:9,3)+"  "+year(:9)+"  "+month(:9)+" "+day(:9))

sza = fin->sza(tm)
sza_py = reshape(sza,(/12,24/))
;printVarSummary(sza)

ddd = day_of_year_plus(yr,ispan(1,12,1),15)
ddd_15 = ddd(0,:,0)
delete(ddd)
ddd = day_of_year_plus(yr,ispan(1,12,1),26)
ddd_26 = ddd(0,:,0)
;print(ddd_15+"  "+ddd_26)

alpha_15 = new((/12,24/),double)
as_15 = new((/12,24/),double)
alpha_26 = alpha_15
as_26 = as_15

;hr = fspan(0.5,23.5,24)
hr = fspan(0,23,24)

solar_position(yr,ddd_15,hr,lat,lon,alpha_15,as_15)
solar_position(yr,ddd_26,hr,lat,lon,alpha_26,as_26)

sza_15 = 90.- alpha_15/pi*180.
sza_26 = 90.- alpha_26/pi*180.

;printVarSummary(sza_15)
;printVarSummary(sza)

df_15 = dim_max(sza_py-sza_15)
df_26 = dim_max(sza_py-sza_26)

print(df_15+" "+df_26)

print(sza_py+"  "+sza_15+"  "+sza_26)

;txres = True
;txres@txFontHeightF = 0.005
;txres@txFont = 30
;gsn_text_ndc(wks,"script: "+script, 0.1, 0.1, txres)
end
exit
