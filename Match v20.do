cd "/home/fscalese/Compras públicas"
use "Base final final v2.dta", clear
drop if iditem==0 | iditem==.
save "1-Base_coniditem_v20.dta", replace


** Genero una base con las observaciones sin iditem, y genero una variable adicional: "codificador", que me permitirá pegar los casos que se logren matchear
cd "/home/fscalese/Compras públicas"
use "Base final final v2.dta", clear
keep if iditem==0 | iditem==.
g item_origen=items
replace item_origen=upper(trim(item_origen))

replace item_origen=regexr(item_origen,"Á","A")
replace item_origen=regexr(item_origen,"É","E")
replace item_origen=regexr(item_origen,"Í","I")
replace item_origen=regexr(item_origen,"Ó","O")
replace item_origen=regexr(item_origen,"Ú","U")
replace item_origen=regexr(item_origen,"á","A")
replace item_origen=regexr(item_origen,"é","E")
replace item_origen=regexr(item_origen,"í","I")
replace item_origen=regexr(item_origen,"ó","O")
replace item_origen=regexr(item_origen,"ú","U")
replace item_origen=regexr(item_origen,"ñ","Ñ")
replace item_origen=regexr(item_origen,".-","")
replace item_origen=regexr(item_origen,"- ","")
replace item_origen=regexr(item_origen,"> ","")
replace item_origen=regexr(item_origen,">","")
replace item_origen=regexr(item_origen,`"""',"")
replace item_origen=regexr(item_origen,`"""',"")
replace item_origen=regexr(item_origen,`"""',"")
replace item_origen=regexr(item_origen,"-","")
replace item_origen=regexr(item_origen,"&","")
replace item_origen=regexr(item_origen,"#","")
replace item_origen=regexr(item_origen,"#","")

replace item_origen=stritrim(item_origen)
replace item_origen=strtrim(item_origen)
replace item_origen=ustrtrim(item_origen)

sort item_origen
egen codificador=group(item_origen)

cd "/home/fscalese/Compras públicas"
save "2-Base_missings_v20.dta", replace


** Genero la base auxiliar, que contiene solo tres variables: el item, el codificador y el peso (cantidad de veces que aparece)
gen peso=1
collapse (max) codificador (count) peso, by(item_origen)

cd "/home/fscalese/Compras públicas"
save "AUX_base_v20.dta", replace


** Genero la base con los codificadores a partir de lo que ya está hecho en la base original
cd "/home/fscalese/Compras públicas"
use "Base final final v2.dta", clear

keep if iditem!=0 & iditem!=. & iditem!=-1
keep iditem items
duplicates drop iditem items, force
drop if items==""

rename items item_destino
replace item_destino=upper(trim(item_destino))

replace item_destino=regexr(item_destino,"Á","A")
replace item_destino=regexr(item_destino,"É","E")
replace item_destino=regexr(item_destino,"Í","I")
replace item_destino=regexr(item_destino,"Ó","O")
replace item_destino=regexr(item_destino,"Ú","U")
replace item_destino=regexr(item_destino,"á","A")
replace item_destino=regexr(item_destino,"é","E")
replace item_destino=regexr(item_destino,"í","I")
replace item_destino=regexr(item_destino,"ó","O")
replace item_destino=regexr(item_destino,"ú","U")
replace item_destino=regexr(item_destino,"ñ","Ñ")
replace item_destino=regexr(item_destino,".-","")
replace item_destino=regexr(item_destino,"- ","")
replace item_destino=regexr(item_destino,"> ","")
replace item_destino=regexr(item_destino,">","")
replace item_destino=regexr(item_destino,`"""',"")
replace item_destino=regexr(item_destino,`"""',"")
replace item_destino=regexr(item_destino,`"""',"")
replace item_destino=regexr(item_destino,"-","")
replace item_destino=regexr(item_destino,"&","")
replace item_destino=regexr(item_destino,"#","")
replace item_destino=regexr(item_destino,"#","")

replace item_destino=stritrim(item_destino)
replace item_destino=strtrim(item_destino)
replace item_destino=ustrtrim(item_destino)

rename iditem codigo_articulo
duplicates drop codigo_articulo item_destino, force

save "AUX_parabase_v20.dta", replace


use "AUX_parabase_v20.dta", clear
keep if inrange(codigo_articulo,1,5000)
save "AUX_parabase_v20_p1.dta", replace
use "AUX_parabase_v20.dta", clear
keep if inrange(codigo_articulo,5001,10000)
save "AUX_parabase_v20_p2.dta", replace
use "AUX_parabase_v20.dta", clear
keep if inrange(codigo_articulo,10001,20000)
save "AUX_parabase_v20_p3.dta", replace
use "AUX_parabase_v20.dta", clear
keep if inrange(codigo_articulo,20001,30000)
save "AUX_parabase_v20_p4.dta", replace
use "AUX_parabase_v20.dta", clear
keep if inrange(codigo_articulo,30001,50000)
save "AUX_parabase_v20_p5.dta", replace
use "AUX_parabase_v20.dta", clear
keep if inrange(codigo_articulo,50001,70000)
save "AUX_parabase_v20_p6.dta", replace
use "AUX_parabase_v20.dta", clear
keep if codigo_articulo>70000
save "AUX_parabase_v20_p7.dta", replace




** Hago el match para cada código
cd "C:\Users\feder\OneDrive\Desktop\Compras"
use "AUX_base_v20.dta", clear
matchit codificador item_origen using "AUX_parabase_v20_p6.dta", idusing(codigo_articulo) txtusing(item_destino) threshold(.85) override // time  stopwordsauto

sort codificador
g aux1=similscore
by codificador: egen aux2=max(aux1)
g aux3= (aux1==aux2)
keep if aux3==1

keep codificador item_origen codigo_articulo item_destino similscore
save AUX_7, replace




** ver duplicados


/*
cd "/home/fscalese/Compras públicas"
save "3-Base_match_v20.dta", replace

** Pego la base generadas
cd "/home/fscalese/Compras públicas"
use "2-Base_missings_v20.dta", clear
merge m:1 codificador using "3-Base_match_v11.dta"

replace iditem= codigo_articulo if _merge==3
replace items= item_destino if _merge==3
replace item_match=1 if _merge==3

drop  similscore jaro dup item_origen codificador

cd "/home/fscalese/Compras públicas"
save "4-Base_miss-match_v20.dta", replace


cd "/home/fscalese/Compras públicas"
use "1-Base_coniditem_v20.dta", clear
append using "4-Base_miss-match_v20.dta"

save "Base final final vr.dta", replace

