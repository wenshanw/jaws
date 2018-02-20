; Written by Wang, Wenshan 2018-01-27 23:13
load "$HOME/scripts/ncl_script/wenshanw.ncl"
load "$HOME/cloud/gcnet/cal_para.ncl"
;*************************************************************
; Purpose: check python SZA results
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

yr = fin->year
mth = fin->month
day = fin->day
;hr = fin->hour
;printVarSummary(time)

sza = fin->sza

a = 0
b = 23
;print(yr(a:b)+"  "+mth(a:b)+" "+day(a:b)+" "+hr(a:b)+"  "+sza(a:b))

ddd = day_of_year(yr(a),mth(a),day(a))
hr = fspan(0,23,24)
;   procedure solar_position(yr,ddd,hr,lat_deg,lon_deg,alpha,as); change alpha(/ddd,hr/),as(/ddd,hr/)

alpha = new((/1,24/),double)
as = new((/1,24/),double)

solar_position(yr(a),ddd,hr,lat,lon,alpha,as)

cossza_ncl = sin(alpha(0,:))
cossza = cos(sza(:23)/180.*pi)
print(cossza_ncl+"  "+cossza)

sza_ncl = 90-alpha(0,:)/pi*180.
print(stn+" "+yr(0)+"  "+mth(0)+" "+day(0)+" "+hr+" "+sza(:23)+"  "+sza_ncl+"  "+(sza(:23)-sza_ncl))


;txres = True
;txres@txFontHeightF = 0.005
;txres@txFont = 30
;gsn_text_ndc(wks,"script: "+script, 0.1, 0.1, txres)
end
exit
