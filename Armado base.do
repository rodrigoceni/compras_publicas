/*
EN ESTE DO-FILE SE ACONDICIONA LA BASE ORIGINAL. LA MAYOR PARTE DE LAS
VARIABLES SE ENCONTRABAN COMO STRING, LO CUAL HACÍA QUE LA BASE PESE 
MUCHO Y QUE SEA DIFICULTOSO TRABAJAR CON LA MISMA. POR TANTO, SE ARREGLAN 
TODAS LAS VARIABLES PARA QUE SEAN FUNCIONALES PARA LAS PRÓXIMAS ETAPAS
*/

cd "C:\Users\feder\Dropbox\FMV 2021 - Contrataciones públicas\Data\Merge 2002-2020"
use "compras_a2002-2020_v2.dta", clear


******************************************************************************
******************************* VARIABLE ocid ********************************
******************************************************************************
rename ocid ocid1
split ocid1, parse("-") gen(a)
g a4=substr(a3,1,1)
replace a4="100000" if a4=="a"
replace a4="200000" if a4=="i"
g aux_a= (a4=="100000")
g aux_i= (a4=="200000")
split a3, parse("a") gen(b)
split a3, parse("i") gen(c)

g ocid=""
replace ocid=a3 if (aux_a==0 & aux_i==0)
replace ocid=a4+b2 if aux_a==1
replace ocid=a4+c2 if aux_i==1
destring ocid, replace

drop a1 a2 a3 a4 aux_a aux_i b1 b2 c1 c2


******************************************************************************
******************************** VARIABLE id *********************************
******************************************************************************
rename idy id1
split id1, parse("-") gen(a)
g a3=substr(a2,1,1)
replace a3="100000" if a3=="a"
replace a3="200000" if a3=="i"
g aux_a= (a3=="100000")
g aux_i= (a3=="200000")
split a2, parse("a") gen(b)
split a2, parse("i") gen(c)

g id=""
replace id=a2 if (aux_a==0 & aux_i==0)
replace id=a3+b2 if aux_a==1
replace id=a3+c2 if aux_i==1
destring id, replace

drop a1 a2 a3 aux_a aux_i b1 b2 c1 c2


******************************************************************************
*************************** VARIABLE codigo_fiscal ***************************
******************************************************************************
rename codigo_fiscal codigo_fiscal1
g codigo_fiscal=codigo_fiscal1


******************************************************************************
***************************** VARIABLE idlicitem *****************************
******************************************************************************
rename idlicitem idlicitem1
split idlicitem1, parse(".") gen(a)
g idlicitem=a2
destring idlicitem, replace
drop a1 a2


******************************************************************************
****************************** VARIABLE iditem *******************************
******************************************************************************








******************************************************************************
******************************* VARIABLE monto *******************************
******************************************************************************
rename monto monto1
g monto= monto1


******************************************************************************
***************************** VARIABLE cantidad ******************************
******************************************************************************
rename cantidad cantidad1
g cantidad= cantidad1


******************************************************************************
****************************** VARIABLE moneda *******************************
******************************************************************************
rename moneda moneda1
g moneda=.
replace moneda=-9 if moneda1=="NA"
replace moneda=-1 if moneda1==""
replace moneda=1  if moneda1=="UYU"
replace moneda=2  if moneda1=="UYI"
replace moneda=3  if moneda1=="USD"
replace moneda=4  if moneda1=="EUR"
replace moneda=5  if moneda1=="BRL"
replace moneda=6  if moneda1=="GBP"
replace moneda=7  if moneda1=="CAD"
replace moneda=8  if moneda1=="CHF"
replace moneda=9  if moneda1=="ZAR"

label define cat2 -9 "NA" -1 "BLANK" 1 "Peso uruguayo" 2 "Unidad indexada" 3 "Dólar americano" 4 "Euro" 5 "Real brasileño" 6 "Libra esterlina" 7 "Dólar canadiense" 8 "Franco suizo" 9 "Rand sudafricano"
label values moneda cat2


******************************************************************************
****************************** VARIABLE unidad *******************************
******************************************************************************
rename unidad unidad1







******************************************************************************
***************************** VARIABLE comprador *****************************
******************************************************************************
rename organismo comprador1
g comprador=.
qui {
replace comprador=-9  if organismoid=="NA"
replace comprador=-1  if organismoid==""

replace comprador=1   if organismoid=="1-1"
replace comprador=2   if organismoid=="1-2"
replace comprador=3   if organismoid=="1-3"

replace comprador=4   if organismoid=="2-1"
replace comprador=5   if organismoid=="2-3"
replace comprador=6   if organismoid=="2-4"
replace comprador=7   if organismoid=="2-5"
replace comprador=8   if organismoid=="2-6"
replace comprador=9   if organismoid=="2-7"
replace comprador=10  if organismoid=="2-8"
replace comprador=11  if organismoid=="2-9"
replace comprador=12  if organismoid=="2-10"
replace comprador=13  if organismoid=="2-11"

replace comprador=14  if organismoid=="3-1"
replace comprador=15  if organismoid=="3-3"
replace comprador=16  if organismoid=="3-4"
replace comprador=17  if organismoid=="3-18"
replace comprador=18  if organismoid=="3-23"
replace comprador=19  if organismoid=="3-30"
replace comprador=20  if organismoid=="3-31"
replace comprador=21  if organismoid=="3-32"
replace comprador=22  if organismoid=="3-33"
replace comprador=23  if organismoid=="3-34"
replace comprador=24  if organismoid=="3-35"
replace comprador=25  if organismoid=="3-39"
replace comprador=26  if organismoid=="3-40"
replace comprador=27  if organismoid=="3-41"

replace comprador=28  if organismoid=="4-1"
replace comprador=29  if organismoid=="4-2"
replace comprador=30  if organismoid=="4-3"
replace comprador=31  if organismoid=="4-4"
replace comprador=32  if organismoid=="4-5"
replace comprador=33  if organismoid=="4-6"
replace comprador=34  if organismoid=="4-7"
replace comprador=35  if organismoid=="4-8"
replace comprador=36  if organismoid=="4-9"
replace comprador=37  if organismoid=="4-10"
replace comprador=38  if organismoid=="4-11"
replace comprador=39  if organismoid=="4-12"
replace comprador=40  if organismoid=="4-13"
replace comprador=41  if organismoid=="4-14"
replace comprador=42  if organismoid=="4-15"
replace comprador=43  if organismoid=="4-16"
replace comprador=44  if organismoid=="4-17"
replace comprador=45  if organismoid=="4-18"
replace comprador=46  if organismoid=="4-19"
replace comprador=47  if organismoid=="4-20"
replace comprador=48  if organismoid=="4-21"
replace comprador=49  if organismoid=="4-22"
replace comprador=50  if organismoid=="4-23"
replace comprador=51  if organismoid=="4-24"
replace comprador=52  if organismoid=="4-25"
replace comprador=53  if organismoid=="4-26"
replace comprador=54  if organismoid=="4-27"
replace comprador=55  if organismoid=="4-28"
replace comprador=56  if organismoid=="4-29"
replace comprador=57  if organismoid=="4-30"
replace comprador=58  if organismoid=="4-31"
replace comprador=59  if organismoid=="4-32"
replace comprador=60  if organismoid=="4-33"
replace comprador=61  if organismoid=="4-34"
replace comprador=62  if organismoid=="4-35"

replace comprador=63  if organismoid=="5-1"
replace comprador=64  if organismoid=="5-2"
replace comprador=65  if organismoid=="5-3"
replace comprador=66  if organismoid=="5-4"
replace comprador=67  if organismoid=="5-5"
replace comprador=68  if organismoid=="5-7"
replace comprador=69  if organismoid=="5-8"
replace comprador=70  if organismoid=="5-9"
replace comprador=71  if organismoid=="5-13"
replace comprador=72  if organismoid=="5-14"

replace comprador=73  if organismoid=="6-1"

replace comprador=74  if organismoid=="7-1"
replace comprador=75  if organismoid=="7-2"
replace comprador=76  if organismoid=="7-3"
replace comprador=77  if organismoid=="7-4"
replace comprador=78  if organismoid=="7-5"
replace comprador=79  if organismoid=="7-6"
replace comprador=80  if organismoid=="7-7"
replace comprador=81  if organismoid=="7-8"
replace comprador=82  if organismoid=="7-9"

replace comprador=83  if organismoid=="8-1"
replace comprador=84  if organismoid=="8-2"
replace comprador=85  if organismoid=="8-4"
replace comprador=86  if organismoid=="8-7"
replace comprador=87  if organismoid=="8-8"
replace comprador=88  if organismoid=="8-9"
replace comprador=89  if organismoid=="8-10"
replace comprador=90  if organismoid=="8-11"

replace comprador=91  if organismoid=="9-1"
replace comprador=92  if organismoid=="9-2"
replace comprador=93  if organismoid=="9-3"

replace comprador=94  if organismoid=="10-1"
replace comprador=95  if organismoid=="10-2"
replace comprador=96  if organismoid=="10-3"
replace comprador=97  if organismoid=="10-4"
replace comprador=98  if organismoid=="10-5"
replace comprador=99  if organismoid=="10-6"
replace comprador=100 if organismoid=="10-7"

replace comprador=101 if organismoid=="11-1"
replace comprador=102 if organismoid=="11-2"
replace comprador=103 if organismoid=="11-3"
replace comprador=104 if organismoid=="11-4"
replace comprador=105 if organismoid=="11-5"
replace comprador=106 if organismoid=="11-6"
replace comprador=107 if organismoid=="11-7"
replace comprador=108 if organismoid=="11-8"
replace comprador=109 if organismoid=="11-10"
replace comprador=110 if organismoid=="11-11"
replace comprador=111 if organismoid=="11-12"
replace comprador=112 if organismoid=="11-13"
replace comprador=113 if organismoid=="11-15"
replace comprador=114 if organismoid=="11-16"
replace comprador=115 if organismoid=="11-17"
replace comprador=116 if organismoid=="11-18"
replace comprador=117 if organismoid=="11-19"
replace comprador=118 if organismoid=="11-20"
replace comprador=119 if organismoid=="11-21"
replace comprador=120 if organismoid=="11-22"
replace comprador=121 if organismoid=="11-24"

replace comprador=122 if organismoid=="12-1"
replace comprador=123 if organismoid=="12-2"
replace comprador=124 if organismoid=="12-3"
replace comprador=125 if organismoid=="12-4"
replace comprador=126 if organismoid=="12-5"
replace comprador=127 if organismoid=="12-6"
replace comprador=128 if organismoid=="12-7"
replace comprador=129 if organismoid=="12-8"
replace comprador=130 if organismoid=="12-9"
replace comprador=131 if organismoid=="12-10"
replace comprador=132 if organismoid=="12-11"
replace comprador=133 if organismoid=="12-12"
replace comprador=134 if organismoid=="12-13"
replace comprador=135 if organismoid=="12-14"
replace comprador=136 if organismoid=="12-15"
replace comprador=137 if organismoid=="12-16"
replace comprador=138 if organismoid=="12-17"
replace comprador=139 if organismoid=="12-18"
replace comprador=140 if organismoid=="12-19"
replace comprador=141 if organismoid=="12-20"
replace comprador=142 if organismoid=="12-21"
replace comprador=143 if organismoid=="12-22"
replace comprador=144 if organismoid=="12-23"
replace comprador=145 if organismoid=="12-24"
replace comprador=146 if organismoid=="12-25"
replace comprador=147 if organismoid=="12-26"
replace comprador=148 if organismoid=="12-27"
replace comprador=149 if organismoid=="12-28"
replace comprador=150 if organismoid=="12-29"
replace comprador=151 if organismoid=="12-30"
replace comprador=152 if organismoid=="12-31"
replace comprador=153 if organismoid=="12-32"
replace comprador=154 if organismoid=="12-33"
replace comprador=155 if organismoid=="12-34"
replace comprador=156 if organismoid=="12-35"
replace comprador=157 if organismoid=="12-36"
replace comprador=158 if organismoid=="12-37"
replace comprador=159 if organismoid=="12-38"
replace comprador=160 if organismoid=="12-39"
replace comprador=161 if organismoid=="12-40"
replace comprador=162 if organismoid=="12-41"
replace comprador=163 if organismoid=="12-42"
replace comprador=164 if organismoid=="12-43"
replace comprador=165 if organismoid=="12-44"
replace comprador=166 if organismoid=="12-45"
replace comprador=167 if organismoid=="12-46"
replace comprador=168 if organismoid=="12-47"
replace comprador=169 if organismoid=="12-48"
replace comprador=170 if organismoid=="12-49"
replace comprador=171 if organismoid=="12-50"
replace comprador=172 if organismoid=="12-51"
replace comprador=173 if organismoid=="12-52"
replace comprador=174 if organismoid=="12-53"
replace comprador=175 if organismoid=="12-54"
replace comprador=176 if organismoid=="12-55"
replace comprador=177 if organismoid=="12-56"
replace comprador=178 if organismoid=="12-57"
replace comprador=179 if organismoid=="12-58"
replace comprador=180 if organismoid=="12-59"
replace comprador=181 if organismoid=="12-60"
replace comprador=182 if organismoid=="12-61"
replace comprador=183 if organismoid=="12-62"
replace comprador=184 if organismoid=="12-63"
replace comprador=185 if organismoid=="12-64"
replace comprador=186 if organismoid=="12-65"
replace comprador=187 if organismoid=="12-66"
replace comprador=188 if organismoid=="12-67"
replace comprador=189 if organismoid=="12-68"
replace comprador=190 if organismoid=="12-69"
replace comprador=191 if organismoid=="12-70"
replace comprador=192 if organismoid=="12-71"
replace comprador=193 if organismoid=="12-73"
replace comprador=194 if organismoid=="12-74"
replace comprador=195 if organismoid=="12-75"
replace comprador=196 if organismoid=="12-76"
replace comprador=197 if organismoid=="12-78"
replace comprador=198 if organismoid=="12-102"
replace comprador=199 if organismoid=="12-103"
replace comprador=200 if organismoid=="12-104"
replace comprador=201 if organismoid=="12-105"
replace comprador=202 if organismoid=="12-106"

replace comprador=203 if organismoid=="13-1"
replace comprador=204 if organismoid=="13-2"
replace comprador=205 if organismoid=="13-3"
replace comprador=206 if organismoid=="13-4"
replace comprador=207 if organismoid=="13-5"
replace comprador=208 if organismoid=="13-6"
replace comprador=209 if organismoid=="13-7"

replace comprador=210 if organismoid=="14-1"
replace comprador=211 if organismoid=="14-2"
replace comprador=212 if organismoid=="14-3"
replace comprador=213 if organismoid=="14-4"
replace comprador=214 if organismoid=="14-5"

replace comprador=215 if organismoid=="15-1"
replace comprador=216 if organismoid=="15-2"
replace comprador=217 if organismoid=="15-3"

replace comprador=218 if organismoid=="16-1"
replace comprador=219 if organismoid=="16-2"
replace comprador=220 if organismoid=="16-3"
replace comprador=221 if organismoid=="16-4"
replace comprador=222 if organismoid=="16-101"

replace comprador=223 if organismoid=="17-1"

replace comprador=224 if organismoid=="18-1"

replace comprador=225 if organismoid=="19-1"

replace comprador=226 if organismoid=="24-2"
replace comprador=227 if organismoid=="24-3"
replace comprador=228 if organismoid=="24-4"
replace comprador=229 if organismoid=="24-5"
replace comprador=230 if organismoid=="24-6"
replace comprador=231 if organismoid=="24-7"
replace comprador=232 if organismoid=="24-8"
replace comprador=233 if organismoid=="24-9"
replace comprador=234 if organismoid=="24-10"
replace comprador=235 if organismoid=="24-11"
replace comprador=236 if organismoid=="24-12"
replace comprador=237 if organismoid=="24-13"
replace comprador=238 if organismoid=="24-14"
replace comprador=239 if organismoid=="24-15"
replace comprador=240 if organismoid=="24-24"
replace comprador=241 if organismoid=="24-29"
replace comprador=242 if organismoid=="24-31"

replace comprador=243 if organismoid=="25-1"
replace comprador=244 if organismoid=="25-2"
replace comprador=245 if organismoid=="25-3"
replace comprador=246 if organismoid=="25-4"
replace comprador=247 if organismoid=="25-5"

replace comprador=248 if organismoid=="26-1"
replace comprador=249 if organismoid=="26-2"
replace comprador=250 if organismoid=="26-3"
replace comprador=251 if organismoid=="26-4"
replace comprador=252 if organismoid=="26-5"
replace comprador=253 if organismoid=="26-6"
replace comprador=254 if organismoid=="26-7"
replace comprador=255 if organismoid=="26-8"
replace comprador=256 if organismoid=="26-9"
replace comprador=257 if organismoid=="26-10"
replace comprador=258 if organismoid=="26-11"
replace comprador=259 if organismoid=="26-12"
replace comprador=260 if organismoid=="26-13"
replace comprador=261 if organismoid=="26-14"
replace comprador=262 if organismoid=="26-15"
replace comprador=263 if organismoid=="26-16"
replace comprador=264 if organismoid=="26-17"
replace comprador=265 if organismoid=="26-18"
replace comprador=266 if organismoid=="26-19"
replace comprador=267 if organismoid=="26-20"
replace comprador=268 if organismoid=="26-21"
replace comprador=269 if organismoid=="26-22"
replace comprador=270 if organismoid=="26-23"
replace comprador=271 if organismoid=="26-24"
replace comprador=272 if organismoid=="26-25"
replace comprador=273 if organismoid=="26-30"
replace comprador=274 if organismoid=="26-31"
replace comprador=275 if organismoid=="26-50"

replace comprador=276 if organismoid=="27-1"

replace comprador=277 if organismoid=="28-1"

replace comprador=278 if organismoid=="29-2"
replace comprador=279 if organismoid=="29-3"
replace comprador=280 if organismoid=="29-4"
replace comprador=281 if organismoid=="29-5"
replace comprador=282 if organismoid=="29-6"
replace comprador=283 if organismoid=="29-7"
replace comprador=284 if organismoid=="29-8"
replace comprador=285 if organismoid=="29-9"
replace comprador=286 if organismoid=="29-10"
replace comprador=287 if organismoid=="29-11"
replace comprador=288 if organismoid=="29-12"
replace comprador=289 if organismoid=="29-13"
replace comprador=290 if organismoid=="29-14"
replace comprador=291 if organismoid=="29-15"
replace comprador=292 if organismoid=="29-16"
replace comprador=293 if organismoid=="29-17"
replace comprador=294 if organismoid=="29-18"
replace comprador=295 if organismoid=="29-19"
replace comprador=296 if organismoid=="29-20"
replace comprador=297 if organismoid=="29-21"
replace comprador=298 if organismoid=="29-22"
replace comprador=299 if organismoid=="29-23"
replace comprador=300 if organismoid=="29-24"
replace comprador=301 if organismoid=="29-25"
replace comprador=302 if organismoid=="29-26"
replace comprador=303 if organismoid=="29-27"
replace comprador=304 if organismoid=="29-28"
replace comprador=305 if organismoid=="29-29"
replace comprador=306 if organismoid=="29-30"
replace comprador=307 if organismoid=="29-31"
replace comprador=308 if organismoid=="29-32"
replace comprador=309 if organismoid=="29-33"
replace comprador=310 if organismoid=="29-34"
replace comprador=311 if organismoid=="29-35"
replace comprador=312 if organismoid=="29-36"
replace comprador=313 if organismoid=="29-37"
replace comprador=314 if organismoid=="29-38"
replace comprador=315 if organismoid=="29-39"
replace comprador=316 if organismoid=="29-40"
replace comprador=317 if organismoid=="29-41"
replace comprador=318 if organismoid=="29-42"
replace comprador=319 if organismoid=="29-43"
replace comprador=320 if organismoid=="29-44"
replace comprador=321 if organismoid=="29-45"
replace comprador=322 if organismoid=="29-46"
replace comprador=323 if organismoid=="29-47"
replace comprador=324 if organismoid=="29-48"
replace comprador=325 if organismoid=="29-49"
replace comprador=326 if organismoid=="29-50"
replace comprador=327 if organismoid=="29-51"
replace comprador=328 if organismoid=="29-52"
replace comprador=329 if organismoid=="29-53"
replace comprador=330 if organismoid=="29-54"
replace comprador=331 if organismoid=="29-55"
replace comprador=332 if organismoid=="29-56"
replace comprador=333 if organismoid=="29-57"
replace comprador=334 if organismoid=="29-58"
replace comprador=335 if organismoid=="29-59"
replace comprador=336 if organismoid=="29-60"
replace comprador=337 if organismoid=="29-61"
replace comprador=338 if organismoid=="29-62"
replace comprador=339 if organismoid=="29-63"
replace comprador=340 if organismoid=="29-64"
replace comprador=341 if organismoid=="29-65"
replace comprador=342 if organismoid=="29-66"
replace comprador=343 if organismoid=="29-67"
replace comprador=344 if organismoid=="29-68"
replace comprador=345 if organismoid=="29-69"
replace comprador=346 if organismoid=="29-71"
replace comprador=347 if organismoid=="29-73"
replace comprador=348 if organismoid=="29-74"
replace comprador=349 if organismoid=="29-75"
replace comprador=350 if organismoid=="29-76"
replace comprador=351 if organismoid=="29-78"
replace comprador=352 if organismoid=="29-79"
replace comprador=353 if organismoid=="29-80"
replace comprador=354 if organismoid=="29-81"
replace comprador=355 if organismoid=="29-82"
replace comprador=356 if organismoid=="29-83"
replace comprador=357 if organismoid=="29-84"
replace comprador=358 if organismoid=="29-86"
replace comprador=359 if organismoid=="29-87"
replace comprador=360 if organismoid=="29-88"
replace comprador=361 if organismoid=="29-101"
replace comprador=362 if organismoid=="29-102"
replace comprador=363 if organismoid=="29-103"
replace comprador=364 if organismoid=="29-105"

replace comprador=365 if organismoid=="31-1"

replace comprador=366 if organismoid=="32-1"

replace comprador=367 if organismoid=="33-1"

replace comprador=368 if organismoid=="34-1"

replace comprador=369 if organismoid=="35-1"

replace comprador=370 if organismoid=="36-1"
replace comprador=371 if organismoid=="36-2"
replace comprador=372 if organismoid=="36-3"
replace comprador=373 if organismoid=="36-4"
replace comprador=374 if organismoid=="36-5"

replace comprador=375 if organismoid=="40-4"
replace comprador=376 if organismoid=="40-11"
replace comprador=377 if organismoid=="40-13"
replace comprador=378 if organismoid=="40-15"
replace comprador=379 if organismoid=="40-18"
replace comprador=380 if organismoid=="40-19"
replace comprador=381 if organismoid=="40-26"
replace comprador=382 if organismoid=="40-34"

replace comprador=383 if organismoid=="50-1"
replace comprador=384 if organismoid=="51-1"
replace comprador=385 if organismoid=="52-1"
replace comprador=386 if organismoid=="53-1"
replace comprador=387 if organismoid=="60-1"
replace comprador=388 if organismoid=="61-1"
replace comprador=389 if organismoid=="62-1"
replace comprador=390 if organismoid=="63-1"
replace comprador=391 if organismoid=="64-1"
replace comprador=392 if organismoid=="65-1"
replace comprador=393 if organismoid=="66-1"
replace comprador=394 if organismoid=="67-1"
replace comprador=395 if organismoid=="68-1"
replace comprador=396 if organismoid=="69-1"
replace comprador=397 if organismoid=="70-1"
replace comprador=398 if organismoid=="71-1"

replace comprador=399 if organismoid=="80-1"
replace comprador=400 if organismoid=="80-2"
replace comprador=401 if organismoid=="81-1"
replace comprador=402 if organismoid=="81-2"
replace comprador=403 if organismoid=="82-1"
replace comprador=404 if organismoid=="82-2"
replace comprador=405 if organismoid=="83-1"
replace comprador=406 if organismoid=="83-2"
replace comprador=407 if organismoid=="84-1"
replace comprador=408 if organismoid=="84-2"
replace comprador=409 if organismoid=="85-1"
replace comprador=410 if organismoid=="85-2"
replace comprador=411 if organismoid=="86-1"
replace comprador=412 if organismoid=="86-2"
replace comprador=413 if organismoid=="87-1"
replace comprador=414 if organismoid=="87-2"
replace comprador=415 if organismoid=="88-1"
replace comprador=416 if organismoid=="88-2"
replace comprador=417 if organismoid=="89-1"
replace comprador=418 if organismoid=="89-2"
replace comprador=419 if organismoid=="90-1"
replace comprador=420 if organismoid=="90-2"
replace comprador=421 if organismoid=="91-1"
replace comprador=422 if organismoid=="91-2"
replace comprador=423 if organismoid=="92-1"
replace comprador=424 if organismoid=="92-2"
replace comprador=425 if organismoid=="93-1"
replace comprador=426 if organismoid=="93-2"
replace comprador=427 if organismoid=="94-1"
replace comprador=428 if organismoid=="94-2"
replace comprador=429 if organismoid=="95-1"
replace comprador=430 if organismoid=="95-2"
replace comprador=431 if organismoid=="96-1"
replace comprador=432 if organismoid=="96-2"
replace comprador=433 if organismoid=="97-1"
replace comprador=434 if organismoid=="97-2"
replace comprador=435 if organismoid=="98-1"
replace comprador=436 if organismoid=="98-2"
replace comprador=437 if organismoid=="99-1"


label define cat4 -9 "NA" -1 "BLANK" 1 "Cámara de Senadores" 2 "Cámara de Representantes" 3 "Comisión Administrativa del Poder Legislativo" 4 "Presidencia de la República y Oficinas Dependientes" 5 "Casa Militar" 6 "Oficina de Planeamiento y Presupuesto" 7 "NO VIGENTE - Dirección de Proyectos de Desarrollo" 8 "Unidad Reguladora de Servicio de Energía y Agua - URSEA" 9 "Instituto Nacional de Estadística" 10 "Oficina Nacional del Servicio Civil" 11 "Unidad Reguladora de Servicio de Comunicaciones - URSEC" 12 "AGESIC" 13 "Secretaría Nacional del Deporte" 14 "Dirección General de Secretaría - MDN" 15 "Estado Mayor de la Defensa" 16 "Comando General del Ejército" 17 "Comando General de la Armada" 18 "Comando General de la Fuerza Aérea" 19 "Ex-Dirección Nacional Aviación Civil e Infraestructura Aeronáutica" 20 "Ex-Dirección General de Aviación Civil" 21 "Ex-Dirección General Infraestructura Aeronáutica" 22 "Dirección Nacional de Sanidad de las Fuerzas Armadas" 23 "Dirección General de los Servicios" 24 "Servicio de Retiros y Pensiones de las Fuerzas Armadas" 25 "Dirección Nacional de Meteorología" 26 "Ex-Dirección Nacional de Comunicaciones" 27 "Dirección Nacional Aviación Civil e Infraestructura Aeronáutica" 28 "Dirección General de Secretaría - MI" 29 "Dirección Nacional de Migración" 30 "NO VIGENTE - Ex-Intendencia General de Policía" 31 "Jefatura de Policía de Montevideo" 32 "Jefatura de Policía de Artigas" 33 "Jefatura de Policía de Canelones" 34 "Jefatura de Policía de Cerro Largo" 35 "Jefatura de Policía de Colonia" 36 "Jefatura de Policía de Durazno" 37 "Jefatura de Policía de Flores" 38 "Jefatura de Policía de Florida" 39 "Jefatura de Policía de Lavalleja" 40 "Jefatura de Policía de Maldonado" 41 "Jefatura de Policía de Paysandú" 42 "Jefatura de Policía de Río Negro" 43 "Jefatura de Policía de Rivera" 44 "Jefatura de Policía de Rocha" 45 "Jefatura de Policía de Salto" 46 "Jefatura de Policía de San José" 47 "Jefatura de Policía de Soriano" 48 "Jefatura de Policía de Tacuarembó" 49 "Jefatura de Policía de Treinta y Tres" 50 "Dirección Nacional de Policía de Tránsito" 51 "Dirección Nacional de Bomberos" 52 "Dirección Nacional de Asistencia Social Policial" 53 "Dirección Nacional de Cárceles, Penitenciarías y Centros de Recuperación" 54 "Dirección Nacional de Información e Inteligencia" 55 "Dirección Nacional de Policía Científica" 56 "Escuela Nacional de Policía" 57 "Dirección Nacional de Sanidad Policial" 58 "Dirección Nacional de Identificación Civil" 59 "Dirección Nacional de Prevención Social del Delito" 60 "Guardia Republicana" 61 "Dirección Nacional de Asuntos Sociales" 62 "Dirección Nacional de la Seguridad Rural" 63 "Dirección General de Secretaría - MEF" 64 "Contaduría General de la Nación" 65 "Auditoría Interna de la Nación" 66 "Tesorería General de la Nación" 67 "Dirección General Impositiva" 68 "Dirección Nacional de Aduanas" 69 "Dirección Nacional de Loterías y Quinielas" 70 "Dirección Nacional de Catastro" 71 "Dirección General de Casinos" 72 "Dirección General de Comercio" 73 "Dirección General de Secretaría - MRE" 74 "Dirección General de Secretaría - MGAP" 75 "Dirección Nacional de Recursos Acuáticos (Ex-INAPE)" 76 "Dirección General de Recursos Naturales Renovables" 77 "Dirección General de Servicios Agrícolas" 78 "Dirección General de Servicios Ganaderos" 79 "Junta Nacional de la Granja" 80 "Dirección General de Desarrollo Rural" 81 "Dirección General Forestal" 82 "Dirección General de Control de Inocuidad Alimentaria" 83 "Dirección General de Secretaría - MIEM" 84 "Dirección Nacional de Industrias" 85 "Dirección Nacional de la Propiedad Industrial" 86 "Dirección Nacional de Minería y Geología" 87 "Dirección Nacional de Energía" 88 "Dirección Nacional de Artesanías y Pequeñas y Medianas Empresas" 89 "Dirección Nacional de Telecomunicaciones" 90 "Autoridad Reguladora Nacional en Radioprotección" 91 "Dirección General de Secretaría - MT" 92 "Dirección Nacional de Deporte" 93 "Dirección Nacional de Turismo" 94 "Dirección General de Secretaría - MTOP" 95 "Registro Nacional de Empresas de Obras Públicas" 96 "Dirección Nacional de Vialidad" 97 "Dirección Nacional de Hidrografía" 98 "Dirección Nacional de Arquitectura" 99 "Dirección Nacional de Topografía" 100 "Dirección Nacional de Transporte" 101 "Dirección General de Secretaría - MEC" 102 "Dirección de Educación" 103 "Dirección Nacional de Cultura" 104 "Museo Histórico Nacional" 105 "Dirección Centros MEC" 106 "Museo Nacional de Historia Natural y Antropología" 107 "Archivo General de la Nación" 108 "Comisión del Patrimonio Cultural de la Nación" 109 "Museo Nacional de Artes Visuales" 110 "Instituto de Investigaciones Biológicas Clemente Estable" 111 "Dirección para el Desarrollo de la Ciencia y el Conocimiento" 112 "NO VIGENTE - Ex-Comisión Nacional de Educación Física" 113 "Dirección General de la Biblioteca Nacional" 114 "Servicio Oficial de Difusión, Radiotelevisión, Espectáculos" 115 "Fiscalías de Gobierno de Primer y Segundo Turno" 116 "Dirección General de Registros" 117 "Fiscalía de Corte, Procuraduría General de la Nación" 118 "Procuraduría Estado en Contencioso-Administrativo" 119 "Dirección General del Registro de Estado Civil" 120 "Junta de Transparencia y Ética Pública - JUTEP" 121 "Canal 5 - Servicio de televisión Nacional" 122 "Dirección General de Secretaría - MSP" 123 "NO VIGENTE - Red de Atención de 1er nivel ASSE" 124 "NO VIGENTE - Unidad de Atención Cardio-Respiratoria" 125 "NO VIGENTE - Centro Hospitalario Pereira Rossell" 126 "NO VIGENTE - Hospital Maciel" 127 "NO VIGENTE - Hospital Pasteur" 128 "NO VIGENTE - Hospital Vilardebó" 129 "NO VIGENTE - Instituto Nacional del Cáncer" 130 "NO VIGENTE - Servicio Nacional de Ortopedia y Traumatología" 131 "NO VIGENTE - Instituto Nacional de Reumatología Prof. Dr. Moisés Mizraji" 132 "NO VIGENTE - Ex-Instituto Hanseniano" 133 "NO VIGENTE - Hospital Dr. Gustavo Saint Bois" 134 "NO VIGENTE - Colonia Siquiátrica Dr. Bernardo Etchepare" 135 "NO VIGENTE - Ex-Hospital Siquiátrico" 136 "NO VIGENTE - Centro Departamental de Artigas" 137 "NO VIGENTE - Centro Departamental de Canelones" 138 "NO VIGENTE - Centro Departamental de Cerro Largo" 139 "NO VIGENTE - Centro Departamental de Salud Pública de Colonia" 140 "NO VIGENTE - Centro Departamental de Durazno" 141 "NO VIGENTE - Centro Departamental de Flores" 142 "NO VIGENTE - Centro Departamental de Florida" 143 "NO VIGENTE - Centro Departamental de Lavalleja" 144 "NO VIGENTE - Centro Departamental de Maldonado" 145 "NO VIGENTE - Centro Departamental de Paysandú" 146 "NO VIGENTE - Centro Departamental de Rivera" 147 "NO VIGENTE - Centro Departamental de Río Negro" 148 "NO VIGENTE - Centro Departamental de Rocha" 149 "NO VIGENTE - Centro Departamental de Salto" 150 "NO VIGENTE - Centro Departamental de San José" 151 "NO VIGENTE - Centro Departamental de Soriano" 152 "NO VIGENTE - Centro Departamental de Tacuarembó" 153 "NO VIGENTE - Centro Departamental de Treinta y Tres" 154 "NO VIGENTE - Centro Auxiliar de Aiguá" 155 "NO VIGENTE - Centro Auxiliar de Bella Unión" 156 "NO VIGENTE - Centro Auxiliar de Cardona y Florencio Sánchez" 157 "NO VIGENTE - Centro Auxiliar de Carmelo" 158 "NO VIGENTE - Centro Auxiliar de Castillos" 159 "NO VIGENTE - Centro Auxiliar de Cerro Chato" 160 "NO VIGENTE - Centro Auxiliar de Dolores" 161 "NO VIGENTE - Centro Auxiliar de Young" 162 "NO VIGENTE - Centro Auxiliar de Guichón" 163 "NO VIGENTE - Centro Auxiliar de José Batlle y Ordoñez" 164 "NO VIGENTE - Centro Auxiliar de Juan Lacaze" 165 "NO VIGENTE - Centro Auxiliar de Lascano" 166 "NO VIGENTE - Centro Auxiliar de Libertad" 167 "NO VIGENTE - Centro Auxiliar de Minas Corrales" 168 "NO VIGENTE - Centro Auxiliar de Nueva Helvecia" 169 "NO VIGENTE - Centro Auxiliar de Nueva Palmira" 170 "NO VIGENTE - Centro Auxiliar de Pan De Azúcar" 171 "NO VIGENTE - Centro Auxiliar de Pando" 172 "NO VIGENTE - Centro Auxiliar de Paso de los Toros" 173 "NO VIGENTE - Centro Auxiliar de Río Branco" 174 "NO VIGENTE - Centro Auxiliar de Rosario" 175 "NO VIGENTE - Centro Auxiliar de San Carlos" 176 "NO VIGENTE - Centro Auxiliar de San Gregorio Polanco" 177 "NO VIGENTE - Centro Auxiliar de San Ramón" 178 "NO VIGENTE - Centro Auxiliar de Santa Lucía" 179 "NO VIGENTE - Centro Auxiliar de Sarandí Grande" 180 "NO VIGENTE - Centro Auxiliar de Sarandí Del Yí" 181 "NO VIGENTE - Centro Auxiliar de Tala" 182 "NO VIGENTE - Centro Auxiliar de Vergara" 183 "NO VIGENTE - Centro Auxiliar de las Piedras" 184 "NO VIGENTE - Hospital Centro Geriátrico Dr. Luis Piñeiro del Campo" 185 "NO VIGENTE - Laboratorio Químico Industrial Francisco Dorrego" 186 "NO VIGENTE - Ex-Comisión Honoraria de Lucha contra la Hidatidosis" 187 "NO VIGENTE - Servicio Nacional de Sangre" 188 "NO VIGENTE - Escuela de Sanidad Dr. José Scosería" 189 "NO VIGENTE - Administración de Servicios de Salud del Estado" 190 "NO VIGENTE - Colonia Dr. Santín Carlos Rossi" 191 "NO VIGENTE - Dirección General de la Salud" 192 "NO VIGENTE - Instituto Nacional de Donación y Trasplante de Células, Tejidos y Órganos" 193 "NO VIGENTE - Centro Auxiliar Chuy" 194 "NO VIGENTE - Centro Auxiliar Rincón de la Bolsa" 195 "NO VIGENTE - Centro Auxiliar Ciudad de la Costa" 196 "NO VIGENTE - Hospital Español" 197 "NO VIGENTE - Centro Nacional de Información y Referencia de la Red de Drogas" 198 "Junta Nacional de Salud" 199 "Dirección General de la Salud" 200 "Instituto Nacional de Donación y Trasplante de Células, Tejidos y Órganos" 201 "Dirección General del Sistema Nacional Integrado Salud" 202 "Dirección General de Coordinación" 203 "Dirección General de Secretaría - MTSS" 204 "Dirección Nacional de Trabajo" 205 "Dirección Nacional de Empleo" 206 "Dirección Nacional de Coordinación en el Interior" 207 "Dirección Nacional de Seguridad Social" 208 "Instituto Nacional de Alimentación" 209 "Inspección General del Trabajo y de la Seguridad Social" 210 "Dirección General de Secretaría - MVOTMA" 211 "Dirección Nacional de Vivienda" 212 "Dirección Nacional de Ordenamiento Territorial" 213 "Dirección Nacional de Medio Ambiente" 214 "Dirección Nacional de Aguas y Saneamiento" 215 "Dirección General de Secretaría - MIDES" 216 "Dirección de Desarrollo Social" 217 "Instituto Nacional de Alimentación" 218 "NO VIGENTE - Suprema Corte de Justicia" 219 "NO VIGENTE - Trib.Apel.Civ.Pen., Trab.Juz.Let.Fam.Men.Ad.Penal" 220 "NO VIGENTE - Juzg.Letrad, Primera Inst. Interior Juz.Paz Int." 221 "NO VIGENTE - Inst.TForense,Serv.Asis.Pro Soc,Of.Notif,Dep.Jud" 222 "Poder Judicial" 223 "Tribunal de Cuentas" 224 "Corte Electoral" 225 "Tribunal de lo Contencioso Administrativo" 226 "Presidencia de la República" 227 "Ministerio de Defensa Nacional" 228 "Ministerio del Interior" 229 "Ministerio de Economía y Finanzas" 230 "Ministerio de Relaciones Exteriores" 231 "Ministerio de Agricultura y Pesca" 232 "Ministerio de Industria y Energía" 233 "Ministerio de Turismo" 234 "Ministerio de Transporte y Obras Públicas" 235 "Ministerio de Educación y Cultura" 236 "Ministerio de Salud Pública" 237 "Ministerio de Trabajo y Seguridad Social" 238 "Ministerio de Vivienda, Ordenamiento Territorial y Medio Ambiente" 239 "Ministerio de Deporte y Juventud" 240 "Ministerio de Economía y Finanzas" 241 "ASSE" 242 "Universidad Tecnológica del Uruguay" 243 "Consejo Directivo Central" 244 "Consejo de Educación Primaria" 245 "Consejo de Educación Secundaria" 246 "Consejo de Educación Técnico-Profesional" 247 "Consejo de Formación en Educación" 248 "Oficinas Centrales y Escuelas Dependientes de Rectorado" 249 "Facultad de Agronomía" 250 "Facultad de Arquitectura" 251 "Facultad de Ciencias Económicas y de Administración" 252 "Facultad de Derecho" 253 "Facultad de Ingeniería" 254 "Facultad de Medicina" 255 "Instituto de Higiene" 256 "Facultad de Odontología" 257 "Facultad de Química" 258 "Facultad de Veterinaria" 259 "Facultad de Humanidades y Ciencias de la Educación" 260 "Regional Norte" 261 "UNI-BID" 262 "Hospital de Clínicas" 263 "IEMBA y EUM (Bellas Artes y Música)" 264 "Centro de Investigaciones Nucleares" 265 "Escuela Universitaria de Servicio Social" 266 "Facultad de Psicología" 267 "Facultad de Bibliotecología" 268 "Conservatorio Universitario de Música" 269 "Facultad de Enfermería" 270 "Facultad de Ciencias Sociales" 271 "Facultad de Ciencias" 272 "Facultad de Información y Comunicación" 273 "Centro Universitario Regional Este" 274 "Centro Universitario Regional Litoral Norte" 275 "Unidad Central" 276 "Instituto del Niño y Adolescente del Uruguay INAU-INAME)" 277 "Banco de Previsión Social" 278 "Red de Atención Primaria Área Metropolitana" 279 "Unidad de Atención Cardio - Respiratoria" 280 "Centro Hospitalario Pereira Rossell" 281 "Hospital Maciel" 282 "Hospital Pasteur" 283 "Hospital Vilardebó" 284 "Instituto Nacional del Cáncer" 285 "Servicio Nacional de Ortopedia y Traumatología" 286 "Instituto Nacional de Reumatología Prof. Dr. Moisés Mizraji" 287 "NO VIGENTE - Ex-Instituto Hanseniano" 288 "Hospital Dr. Gustavo Saint Bois" 289 "Colonia Siquiátrica Dr. Bernardo Etchepare" 290 "NO VIGENTE - Ex-Hospital Siquiátrico" 291 "Centro Departamental de Artigas" 292 "Centro Departamental de Canelones" 293 "Centro Departamental de Cerro Largo" 294 "Centro Departamental de Salud Pública de Colonia" 295 "Centro Departamental de Durazno" 296 "Centro Departamental de Flores" 297 "Centro Departamental de Florida" 298 "Centro Departamental de Lavalleja" 299 "Centro Departamental de Maldonado" 300 "Centro Departamental de Paysandú" 301 "Centro Departamental de Rivera" 302 "Centro Departamental de Río Negro" 303 "Centro Departamental de Rocha" 304 "Centro Departamental de Salto" 305 "Centro Departamental de San José" 306 "Centro Departamental de Soriano" 307 "Centro Departamental de Tacuarembó" 308 "Centro Departamental de Treinta y Tres" 309 "NO VIGENTE - Centro Auxiliar de Aiguá" 310 "Centro Auxiliar de Bella Unión" 311 "Centro Auxiliar de Cardona y Florencio Sánchez" 312 "Centro Auxiliar de Carmelo" 313 "Centro Auxiliar de Castillos" 314 "NO VIGENTE - Centro Auxiliar de Cerro Chato" 315 "Centro Auxiliar de Dolores" 316 "Centro Auxiliar de Young" 317 "Red de Atención Primaria de Paysandú" 318 "Red de Atención Primaria de Lavalleja" 319 "Centro Auxiliar de Juan Lacaze" 320 "Red de Atención Primaria de Rocha" 321 "Red de Atención Primaria de San José" 322 "Red de Atención Primaria de Rivera" 323 "NO VIGENTE - Centro Auxiliar de Nueva Helvecia" 324 "Red de Atención Primaria de Colonia" 325 "Red de Atención Primaria de Maldonado" 326 "Centro Auxiliar de Pando" 327 "Centro Auxiliar de Paso de los Toros" 328 "Centro Auxiliar de Río Branco" 329 "Centro Auxiliar de Rosario" 330 "Centro Auxiliar de San Carlos" 331 "Red de Atención Primaria de Tacuarembó" 332 "NO VIGENTE - Centro Auxiliar de San Ramón" 333 "Red de Atención Primaria de Canelones" 334 "Red de Atención Primaria de Florida" 335 "Red de Atención Primaria de Durazno" 336 "NO VIGENTE - Centro Auxiliar de Tala" 337 "Red de Atención Primaria de Treinta y Tres" 338 "Centro Auxiliar de las Piedras" 339 "Hospital - Centro Geriátrico Dr. Luis Piñeiro del Campo" 340 "Laboratorio Químico Industrial Francisco Dorrego" 341 "NO VIGENTE - Ex-Comisión Honoraria de Lucha contra la Hidatidosis" 342 "Servicio Nacional de Sangre" 343 "SUPRESIÓN - Escuela de Sanidad Dr. José Scosería" 344 "Administración de Servicios de Salud del Estado" 345 "Colonia Dr. Santín Carlos Rossi" 346 "Instituto Nacional de Donación y Trasplante de Células, Tejidos y Órganos" 347 "Centro Auxiliar Chuy" 348 "NO VIGENTE - Centro Auxiliar Ciudad del Plata" 349 "NO - VIGENTE Centro Auxiliar Ciudad de la Costa" 350 "Hospital Español" 351 "Centro Nacional de Información y Referencia de la Red de Drogas" 352 "Red de Atención Primaria de Artigas" 353 "Red de Atención Primaria de Cerro Largo" 354 "Red de Atención Primaria de Flores" 355 "Red de Atención Primaria de Río Negro" 356 "Red de Atención Primaria de Soriano" 357 "Red de Atención Primaria de Salto" 358 "Dirección Sistema de Atención Integral Personas Privadas de Libertad" 359 "Asistencia Integral" 360 "Hospital Especializado de Ojos" 361 "Centro Hospitalario Libertad" 362 "Centro Hospitalario Maldonado-San Carlos" 363 "Centro de Rehabilitación Médico Ocupacional y Sicosocial" 364 "Atención de Urgencia Emergencia Prehospitalaria y Traslado" 365 "Universidad Tecnológica del Uruguay" 366 "Instituto Uruguayo de Meteorología INUMET" 367 "Fiscalía General de la Nación" 368 "Junta de Transparencia y Ética Publica" 369 "Instituto Nacional de Inclusión Social Adolescente" 370 "Dirección General de Secretaría - MMA" 371 "Dirección Nacional de Calidad y Evaluación Ambiental" 372 "Dirección Nacional de Aguas (DINAGUA)" 373 "Dirección Nacional de Biodiversidad y Servicios Ecosistémico" 374 "Dirección Nacional de Cambio Climático" 375 "Comisión Honoraria para la Lucha Antituberculosa y Enfermedades Prevalentes" 376 "Comisión Nacional Honoraria para la Lucha Contra la Hidatidosis" 377 "URUGUAY XXI" 378 "Impresiones y Publicaciones Oficiales (IMPO)" 379 "Administración del Mercado Eléctrico (ADME)" 380 "LATU - Laboratorio Tecnológico del Uruguay" 381 "ANII - Agencia Nacional de Investigación e Innovación" 382 "Centro Ceibal para el Apoyo a la Educación de Niñez y Adolescente" 383 "Banco Central del Uruguay" 384 "Banco de la República del Uruguay" 385 "Banco Hipotecario del Uruguay" 386 "Banco de Seguros del Estado" 387 "Administración Nacional de Combustible, Alcohol y Portland" 388 "Administración Nacional de Usinas y Trasmisiones Eléctricas" 389 "Administración de los Ferrocarriles del Estado" 390 "Primeras Líneas Uruguayas de Navegación Aérea" 391 "Administración Nacional de Puertos" 392 "Administración Nacional de Telecomunicaciones" 393 "Administración de las Obras Sanitarias del Estado" 394 "Administración Nacional de Correos" 395 "Agencia Nacional de Vivienda" 396 "Unidad Reguladora de Servicios de Energía y Agua" 397 "Instituto Nacional de Colonización" 398 "Unidad Reguladora de Servicios de Comunicaciones" 399 "Intendencia de Artigas" 400 "Junta Departamental de Artigas" 401 "Intendencia de Canelones" 402 "Junta Departamental de Canelones" 403 "Intendencia de Cerro Largo" 404 "Junta Departamental de Cerro Largo" 405 "Intendencia de Colonia" 406 "Junta Departamental de Colonia" 407 "Intendencia de Durazno" 408 "Junta Departamental de Durazno" 409 "Intendencia de Flores" 410 "Junta Departamental de Flores" 411 "Intendencia de Florida" 412 "Junta Departamental de Florida" 413 "Intendencia de Lavalleja" 414 "Junta Departamental de Lavalleja" 415 "Intendencia de Maldonado" 416 "Junta Departamental de Maldonado" 417 "Intendencia de Paysandú" 418 "Junta Departamental de Paysandú" 419 "Intendencia de Río Negro" 420 "Junta Departamental de Río Negro" 421 "Intendencia de Rivera" 422 "Junta Departamental de Rivera" 423 "Intendencia de Rocha" 424 "Junta Departamental de Rocha" 425 "Intendencia de Salto" 426 "Junta Departamental de Salto" 427 "Intendencia de San José" 428 "Junta Departamental de San José" 429 "Intendencia de Soriano" 430 "Junta Departamental de Soriano" 431 "Intendencia de Tacuarembó" 432 "Junta Departamental de Tacuarembó" 433 "Intendencia de Treinta y Tres" 434 "Junta Departamental de Treinta y Tres" 435 "Intendencia de Montevideo" 436 "Junta Departamental de Montevideo" 437 "Congreso de Intendentes"
label values comprador cat4
}


g comprador2=.
qui {
replace comprador2=-9  if comprador1=="NA"
replace comprador2=-1  if comprador1==""
replace comprador2=1   if comprador1=="AdministraciÃ³n de las Obras Sanitarias del Estado"
replace comprador2=2   if comprador1=="AdministraciÃ³n de los Ferrocarriles del Estado"
replace comprador2=3   if comprador1=="AdministraciÃ³n de Servicios de Salud del Estado"
replace comprador2=3   if comprador1=="ASSE"
replace comprador2=4   if comprador1=="AdministraciÃ³n Nacional de Combustible, Alcohol y Portland"
replace comprador2=5   if comprador1=="AdminstraciÃ³n Nacional de Correos"
replace comprador2=6   if comprador1=="AdministraciÃ³n Nacional de Puertos"
replace comprador2=7   if comprador1=="AdministraciÃ³n Nacional de Telecomunicaciones"
replace comprador2=8   if comprador1=="AdministraciÃ³n Nacional de Usinas y Trasmisiones ElÃ©ctricas"
replace comprador2=9   if comprador1=="Agencia Nacional de Vivienda"
replace comprador2=10  if comprador1=="AGESIC"
replace comprador2=11  if comprador1=="Archivo General de la NaciÃ³n"
replace comprador2=12  if comprador1=="Asistencia Integral"
replace comprador2=13  if comprador1=="Atencion de Urgencia Emergencia Prehospitalaria y Traslado."
replace comprador2=14  if comprador1=="AuditorÃ­a Interna de la NaciÃ³n"
replace comprador2=15  if comprador1=="Autoridad Reguladora Nacional en RadioprotecciÃ³n"
replace comprador2=16  if comprador1=="Banco Central del Uruguay"
replace comprador2=17  if comprador1=="Banco de la RepÃºblica del Uruguay"
replace comprador2=18  if comprador1=="Banco de PrevisiÃ³n Social"
replace comprador2=19  if comprador1=="Banco de Seguros del Estado"
replace comprador2=20  if comprador1=="Banco Hipotecario del Uruguay"
replace comprador2=21  if comprador1=="CÃ¡mara de Representantes"
replace comprador2=22  if comprador1=="CÃ¡mara de Senadores"
replace comprador2=23  if comprador1=="Canal 5 - Servicio de televisiÃ³n Nacional"
replace comprador2=24  if comprador1=="Casa Militar"
replace comprador2=25  if comprador1=="Centro Aux. de Cardona y Florencio SÃ¡nchez"
replace comprador2=26  if comprador1=="Centro Auxiliar Chuy"
replace comprador2=27  if comprador1=="Centro Auxiliar de Bella UniÃ³n"
replace comprador2=28  if comprador1=="Centro Auxiliar de Carmelo"
replace comprador2=29  if comprador1=="Centro Auxiliar de Castillos"
replace comprador2=30  if comprador1=="Centro Auxiliar de Dolores"
replace comprador2=31  if comprador1=="Centro Auxiliar de Juan Lacaze"
replace comprador2=32  if comprador1=="Centro Auxiliar de las Piedras"
replace comprador2=33  if comprador1=="Centro Auxiliar de Pando"
replace comprador2=34  if comprador1=="Centro Auxiliar de Paso de los Toros"
replace comprador2=35  if comprador1=="Centro Auxiliar de RÃ­o Branco"
replace comprador2=36  if comprador1=="Centro Auxiliar de Rosario"
replace comprador2=37  if comprador1=="Centro Auxiliar de San Carlos"
replace comprador2=38  if comprador1=="Centro Auxiliar de Young"
replace comprador2=39  if comprador1=="Ctro Inf.y Ref.Nal de Red Drogas"
replace comprador2=40  if comprador1=="Centro de RehabilitaciÃ³n MÃ©dico Ocupacional y Sicosocial"
replace comprador2=41  if comprador1=="Centro Departamental de Artigas"
replace comprador2=42  if comprador1=="Centro Departamental de Canelones"
replace comprador2=43  if comprador1=="Centro Departamental de Cerro Largo"
replace comprador2=44  if comprador1=="Centro Departamental de Durazno"
replace comprador2=45  if comprador1=="Centro Departamental de Flores"
replace comprador2=46  if comprador1=="Centro Departamental de Florida"
replace comprador2=47  if comprador1=="Centro Departamental de Lavalleja"
replace comprador2=48  if comprador1=="Centro Departamental de Maldonado"
replace comprador2=49  if comprador1=="Centro Departamental de PaysandÃº"
replace comprador2=50  if comprador1=="Centro Departamental de RÃ­o Negro"
replace comprador2=51  if comprador1=="Centro Departamental de Rivera"
replace comprador2=52  if comprador1=="Centro Departamental de Rocha"
replace comprador2=53  if comprador1=="Centro Departamental de Salto"
replace comprador2=54  if comprador1=="Centro Departamental de Salud PÃºblica de Colonia"
replace comprador2=55  if comprador1=="Centro Departamental de San JosÃ©"
replace comprador2=56  if comprador1=="Centro Departamental de Soriano"
replace comprador2=57  if comprador1=="Centro Departamental de TacuarembÃ³"
replace comprador2=58  if comprador1=="Centro Departamental de Treinta y Tres"
replace comprador2=59  if comprador1=="Centro Hospitalario  Pereira Rossell"
replace comprador2=60  if comprador1=="Centro Hospitalario Maldonado-San Carlos"
replace comprador2=61  if comprador1=="Centro Universitario Regional Este"
replace comprador2=62  if comprador1=="Centro Universitario Regional Litoral Norte"
replace comprador2=63  if comprador1=="Colonia Dr.SantÃ­n Carlos Rossi"      
replace comprador2=64  if comprador1=="Colonia SiquiÃ¡trica Dr. Bernardo Etchepare"
replace comprador2=65  if comprador1=="Comando General de la Armada"     
replace comprador2=66  if comprador1=="Comando General de la Fuerza AÃ©rea"    
replace comprador2=67  if comprador1=="Comando General del EjÃ©rcito"      
replace comprador2=68  if comprador1=="ComisiÃ³n Administrativa del Poder Legislativo"
replace comprador2=69  if comprador1=="ComisiÃ³n del Patrimonio Cultural de la NaciÃ³n"
replace comprador2=70  if comprador1=="Comis.Hon.para la Lucha Antituberc.y Enferm. Prevalentes"
replace comprador2=71  if comprador1=="Com.N.H.LuchaContraHidatidÃ³sis"
replace comprador2=72  if comprador1=="Consejo de EducaciÃ³n Primaria"
replace comprador2=73  if comprador1=="Consejo de EducaciÃ³n Secundaria"
replace comprador2=74  if comprador1=="Consejo de EducaciÃ³n TÃ©cnico-Profesional"
replace comprador2=75  if comprador1=="Consejo de FormaciÃ³n en EducaciÃ³n"
replace comprador2=76  if comprador1=="Consejo Directivo Central"
replace comprador2=77  if comprador1=="ContadurÃ­a General de la NaciÃ³n"
replace comprador2=78  if comprador1=="Corte Electoral"
replace comprador2=79  if comprador1=="Despacho de la SecretarÃ­a  Estado y Oficinas Dependientes"
replace comprador2=80  if comprador1=="DirecciÃ³n Centros MEC"
replace comprador2=81  if comprador1=="DirecciÃ³n de Desarrollo Social"
replace comprador2=82  if comprador1=="DirecciÃ³n de EducaciÃ³n"
replace comprador2=83  if comprador1=="DirecciÃ³n General de Casinos"
replace comprador2=84  if comprador1=="DirecciÃ³n General de Comercio"
replace comprador2=85  if comprador1=="DirecciÃ³n General de Control de Inocuidad Alimentaria"
replace comprador2=86  if comprador1=="DirecciÃ³n General de CoordinaciÃ³n"
replace comprador2=87  if comprador1=="DirecciÃ³n Gral .Desarr.Rural"
replace comprador2=88  if comprador1=="DirecciÃ³n General de Recursos Naturales Renovables"
replace comprador2=89  if comprador1=="DirecciÃ³n General de Registros"
replace comprador2=90  if comprador1=="DirecciÃ³n General de SecretarÃ­a"
replace comprador2=91  if comprador1=="DirecciÃ³n General de SecretarÃ­a de Estado"
replace comprador2=92  if comprador1=="Dir. Gral. SecretarÃ­a del  Mrio. de EconomÃ­a y Finanzas"
replace comprador2=93  if comprador1=="Dir. Gral. de SecretarÃ­a (M.E.F.)"
replace comprador2=94  if comprador1=="DirecciÃ³n General de Servicios AgrÃ­colas"
replace comprador2=95  if comprador1=="DirecciÃ³n General de Servicios Ganaderos"
replace comprador2=96  if comprador1=="DirecciÃ³n General de la Biblioteca Nacional"
replace comprador2=97  if comprador1=="DirecciÃ³n General de la Salud"
replace comprador2=98  if comprador1=="DirecciÃ³n General de los Servicios"
replace comprador2=99  if comprador1=="DirecciÃ³n General del Registro de Estado Civil"
replace comprador2=100 if comprador1=="Dir.Gral.Sist.Nal.Integrado Salud"
replace comprador2=101 if comprador1=="DirecciÃ³n General Forestal"
replace comprador2=102 if comprador1=="DirecciÃ³n General Impositiva"
replace comprador2=103 if comprador1=="DirecciÃ³n Nacional de Aduanas"
replace comprador2=104 if comprador1=="DirecciÃ³n Nacional de Aguas y Saneamiento"
replace comprador2=105 if comprador1=="DirecciÃ³n Nacional de Arquitectura"
replace comprador2=106 if comprador1=="DirecciÃ³n Nacional de ArtesanÃ­as y PequeÃ±as y Medianas Empre"
replace comprador2=107 if comprador1=="DirecciÃ³n Nacional de Asistencia Social Policial"
replace comprador2=108 if comprador1=="DirecciÃ³n Nacional de Asuntos Sociales"
replace comprador2=109 if comprador1=="DirecciÃ³n Nacional AviaciÃ³n Civil e Infraestructura AeronÃ¡ut"
replace comprador2=110 if comprador1=="DirecciÃ³n Nacional de Bomberos"
replace comprador2=111 if comprador1=="Dir.Nac.CÃ¡rceles,PenitenciarÃ­as y Centros de RecuperaciÃ³n"
replace comprador2=112 if comprador1=="DirecciÃ³n Nacional de Catastro"
replace comprador2=113 if comprador1=="DirecciÃ³n Nacional de CoordinaciÃ³n en el Interior"
replace comprador2=114 if comprador1=="DirecciÃ³n Nacional de Cultura"
replace comprador2=115 if comprador1=="DirecciÃ³n Nacional de Deporte"
replace comprador2=116 if comprador1=="DirecciÃ³n Nacional de Empleo"
replace comprador2=117 if comprador1=="DirecciÃ³n Nacional de EnergÃ­a"
replace comprador2=118 if comprador1=="DirecciÃ³n Nacional de HidrografÃ­a"
replace comprador2=119 if comprador1=="DirecciÃ³n Nacional de Industrias"
replace comprador2=120 if comprador1=="DirecciÃ³n Nacional de IdentificaciÃ³n Civil"
replace comprador2=121 if comprador1=="DirecciÃ³n Nacional de InformaciÃ³n e Inteligencia"
replace comprador2=122 if comprador1=="DirecciÃ³n Nacional de la Propiedad Industrial"
replace comprador2=123 if comprador1=="DirecciÃ³n Nacional de LoterÃ­as y Quinielas"
replace comprador2=124 if comprador1=="DirecciÃ³n Nacional de Medio Ambiente"
replace comprador2=125 if comprador1=="DirecciÃ³n Nacional de MeteorologÃ­a"
replace comprador2=126 if comprador1=="DirecciÃ³n Nacional de MigraciÃ³n"
replace comprador2=127 if comprador1=="DirecciÃ³n Nacional de MinerÃ­a y GeologÃ­a"
replace comprador2=128 if comprador1=="DirecciÃ³n Nacional de Ordenamiento Territorial"
replace comprador2=129 if comprador1=="DirecciÃ³n Nacional de Policia Cientifica"
replace comprador2=130 if comprador1=="DirecciÃ³n Nacional de PolicÃ­a de TrÃ¡nsito"
replace comprador2=131 if comprador1=="DirecciÃ³n Nacional de PrevenciÃ³n Social del Delito"
replace comprador2=132 if comprador1=="Dir.Nal. de Rec.AcuÃ¡ticos(Ex-INAPE)"
replace comprador2=133 if comprador1=="DirecciÃ³n Nacional de Sanidad de las Fuerzas Armadas"
replace comprador2=134 if comprador1=="DirecciÃ³n Nacional de Sanidad Policial"
replace comprador2=135 if comprador1=="Direc.Nal de Seg.Social"
replace comprador2=136 if comprador1=="DirecciÃ³n Nacional de Telecomunicaciones"
replace comprador2=137 if comprador1=="DirecciÃ³n Nacional de TopografÃ­a"
replace comprador2=138 if comprador1=="DirecciÃ³n Nacional de Trabajo"
replace comprador2=139 if comprador1=="DirecciÃ³n Nacional de Transporte"
replace comprador2=140 if comprador1=="DirecciÃ³n Nacional de Turismo"
replace comprador2=141 if comprador1=="DirecciÃ³n Nacional de Vialidad"
replace comprador2=142 if comprador1=="DirecciÃ³n Nacional de Vivienda"
replace comprador2=143 if comprador1=="DirecciÃ³n para el Desarrollo de la Ciencia y el Conocimiento"
replace comprador2=144 if comprador1=="Direc.Sistema de AtenciÃ²n Integral Personas Privad. Libertad"
replace comprador2=145 if comprador1=="Escuela Nacional de PolicÃ­a"
replace comprador2=146 if comprador1=="Estado Mayor de la Defensa"
replace comprador2=147 if comprador1=="Ex-Adm.Gral- Dir. General Secret."
replace comprador2=148 if comprador1=="Ex-DirecciÃ³n General Infraestructura AeronÃ¡utica"
replace comprador2=149 if comprador1=="Ex-DirecciÃ³n Nacional AviaciÃ³n Civil e Infraestr. Aeronau."
replace comprador2=150 if comprador1=="Facultad de AgronomÃ­a"
replace comprador2=151 if comprador1=="Facultad de Arquitectura"
replace comprador2=152 if comprador1=="Facultad de Ciencias"
replace comprador2=153 if comprador1=="Facultad de Ciencias EconÃ³micas y de AdministraciÃ³n"
replace comprador2=154 if comprador1=="Facultad de Ciencias Sociales"
replace comprador2=155 if comprador1=="Facultad de Derecho"
replace comprador2=156 if comprador1=="Facultad de EnfermerÃ­a"
replace comprador2=157 if comprador1=="Facultad de Humanidades y Ciencias de la EducaciÃ³n"
replace comprador2=158 if comprador1=="Facultad de InformaciÃ³n y ComunicaciÃ³n"
replace comprador2=159 if comprador1=="Facultad de Ingenieria"
replace comprador2=160 if comprador1=="Facultad de Medicina"
replace comprador2=161 if comprador1=="Facultad de Medicina"
replace comprador2=162 if comprador1=="Facultad de OdontologÃ­a"
replace comprador2=163 if comprador1=="Facultad de PsicologÃ­a"
replace comprador2=164 if comprador1=="Facultad de QuÃ­mica"
replace comprador2=165 if comprador1=="Facultad de Veterinaria"
replace comprador2=166 if comprador1=="FiscalÃ­a de Corte, ProcuradurÃ­a General de la NaciÃ³n"
replace comprador2=167 if comprador1=="Fiscalia General de la NaciÃ³n"
replace comprador2=168 if comprador1=="FiscalÃ­as de Gobierno de Primer y Segundo Turno"
replace comprador2=169 if comprador1=="Guardia Republicana"
replace comprador2=170 if comprador1=="Hospital -Centro GeriÃ¡trico Dr. Luis PiÃ±eiro del Campo"
replace comprador2=171 if comprador1=="Hospital de ClÃ­nicas"
replace comprador2=172 if comprador1=="Hospital Dr. Gustavo Saint Bois"
replace comprador2=173 if comprador1=="Hospital EspaÃ±ol"
replace comprador2=174 if comprador1=="Hospital Maciel"
replace comprador2=175 if comprador1=="Hospital Pasteur"
replace comprador2=176 if comprador1=="Hospital VilardebÃ³"
replace comprador2=177 if comprador1=="IEMBAyEUM(Bellas Artes y MÃºsica)"
replace comprador2=178 if comprador1=="InspecciÃ³n General del Trabajo y de la Seguridad Social"
replace comprador2=179 if comprador1=="Instituto de Higiene"
replace comprador2=180 if comprador1=="Instituto de Investigaciones BiolÃ³gicas Clemente Estable"
replace comprador2=181 if comprador1=="Instituto del NiÃ±o y Adolescente del Uruguay INAU-INAME)"
replace comprador2=182 if comprador1=="Instituto Nacional de AlimentaciÃ³n"
replace comprador2=183 if comprador1=="Inst.Nal.Don.yTransp.CÃ©l.Tej.Or"
replace comprador2=183 if comprador1=="Inst.Nal.Donac.yTrasp.CÃ©lulas,Tej.y Organos"
replace comprador2=184 if comprador1=="Instituto Nacional de ColonizaciÃ³n"
replace comprador2=185 if comprador1=="Instituto Nacional de EstadÃ­stica"
replace comprador2=186 if comprador1=="Instituto Nacional de Inclusion Social Adolescente"
replace comprador2=187 if comprador1=="Instituto Nal.de ReumatalogÃ­a Prof.Dr. MoisÃ©s Mizraji"
replace comprador2=188 if comprador1=="Instituto Nacional del CÃ¡ncer"
replace comprador2=189 if comprador1=="Instituto Uruguayo de Meteorologia INUMET"
replace comprador2=190 if comprador1=="Intendencia de Artigas"
replace comprador2=191 if comprador1=="Intendencia de Canelones"
replace comprador2=192 if comprador1=="Intendencia de Cerro Largo"
replace comprador2=193 if comprador1=="Intendencia de Colonia"
replace comprador2=194 if comprador1=="Intendencia de Durazno"
replace comprador2=195 if comprador1=="Intendencia de Flores"
replace comprador2=196 if comprador1=="Intendencia de Florida"
replace comprador2=197 if comprador1=="Intendencia de Lavalleja"
replace comprador2=198 if comprador1=="Intendencia de Maldonado"
replace comprador2=199 if comprador1=="Intendencia de Montevideo"
replace comprador2=200 if comprador1=="Intendencia de PaysandÃº"
replace comprador2=201 if comprador1=="Intendencia de RÃ­o Negro"
replace comprador2=202 if comprador1=="Intendencia de Rivera"
replace comprador2=203 if comprador1=="Intendencia de Rocha"
replace comprador2=204 if comprador1=="Intendencia de Salto"
replace comprador2=205 if comprador1=="Intendencia de San JosÃ©"
replace comprador2=206 if comprador1=="Intendencia de TacuarembÃ³"
replace comprador2=207 if comprador1=="Intendencia de Treinta y Tres"
replace comprador2=208 if comprador1=="Jefatura de PolicÃ­a de Artigas"
replace comprador2=209 if comprador1=="Jefatura de PolicÃ­a de Canelones"
replace comprador2=210 if comprador1=="Jefatura de PolicÃ­a de Cerro Largo"
replace comprador2=211 if comprador1=="Jefatura de PolicÃ­a de Colonia"
replace comprador2=212 if comprador1=="Jefatura de PolicÃ­a de Durazno"
replace comprador2=213 if comprador1=="Jefatura de PolicÃ­a de Flores"
replace comprador2=214 if comprador1=="Jefatura de PolicÃ­a de Florida"
replace comprador2=215 if comprador1=="Jefatura de PolicÃ­a de Lavalleja"
replace comprador2=216 if comprador1=="Jefatura de PolicÃ­a de Maldonado"
replace comprador2=217 if comprador1=="Jefatura de PolicÃ­a de Montevideo"
replace comprador2=218 if comprador1=="Jefatura de PolicÃ­a de PaysandÃº"
replace comprador2=219 if comprador1=="Jefatura de PolicÃ­a de RÃ­o Negro"
replace comprador2=220 if comprador1=="Jefatura de PolicÃ­a de Rivera"
replace comprador2=221 if comprador1=="Jefatura de PolicÃ­a de Rocha"
replace comprador2=222 if comprador1=="Jefatura de PolicÃ­a de Salto"
replace comprador2=223 if comprador1=="Jefatura de PolicÃ­a de San JosÃ©"
replace comprador2=224 if comprador1=="Jefatura de PolicÃ­a de Soriano"
replace comprador2=225 if comprador1=="Jefatura de PolicÃ­a de TacuarembÃ³"
replace comprador2=226 if comprador1=="Jefatura de PolicÃ­a de Teinta y Tres"
replace comprador2=227 if comprador1=="Junta de Transparencia y Etica Publica"
replace comprador2=228 if comprador1=="Junta de Transparencia y Etica PÃºblica-JUTEP"
replace comprador2=229 if comprador1=="Junta Departamental de Artigas"
replace comprador2=230 if comprador1=="Junta Departamental de Canelones"
replace comprador2=231 if comprador1=="Junta Departamental de Cerro Largo"
replace comprador2=232 if comprador1=="Junta Departamental de Colonia"
replace comprador2=233 if comprador1=="Junta Departamental de Durazno"
replace comprador2=234 if comprador1=="Junta Departamental de Flores"
replace comprador2=235 if comprador1=="Junta Departamental de Florida"
replace comprador2=236 if comprador1=="Junta Departamental de Lavalleja"
replace comprador2=237 if comprador1=="Junta Departamental de Maldonado"
replace comprador2=238 if comprador1=="Junta Departamental de Montevideo"
replace comprador2=239 if comprador1=="Junta Departamental de PaysandÃº"
replace comprador2=240 if comprador1=="Junta Departamental de RÃ­o Negro"
replace comprador2=241 if comprador1=="Junta Departamental de Rivera"
replace comprador2=242 if comprador1=="Junta Departamental de Rocha"
replace comprador2=243 if comprador1=="Junta Departamental de Salto"
replace comprador2=244 if comprador1=="Junta Departamental de San JosÃ©"
replace comprador2=245 if comprador1=="Junta  Departamental de Soriano"
replace comprador2=246 if comprador1=="Junta Departamental de TacuarembÃ³"
replace comprador2=247 if comprador1=="Junta Departamental de Treinta y Tres"
replace comprador2=248 if comprador1=="Junta Nacional de la Granja"
replace comprador2=249 if comprador1=="Junta Nacional de Salud"
replace comprador2=250 if comprador1=="Laboratorio QuÃ­mico Industrial Francisco Dorrego"
replace comprador2=251 if comprador1=="Ministerio de Agricultura y Pesca"
replace comprador2=252 if comprador1=="Ministerio de Defensa Nacional"
replace comprador2=253 if comprador1=="Ministerio de Deporte y Juventud"
replace comprador2=254 if comprador1=="Ministerio de EconomÃ­a y Finanzas"
replace comprador2=255 if comprador1=="Ministerio de Relaciones Exteriores"
replace comprador2=256 if comprador1=="Ministerio de Salud PÃºblica"
replace comprador2=257 if comprador1=="Museo HistÃ³rico Nacional"
replace comprador2=258 if comprador1=="Museo Nacional de Artes Visuales"
replace comprador2=259 if comprador1=="Museo Nacional de Historia Natural y AntropologÃ­a"
replace comprador2=260 if comprador1=="NO VIGENTE Adm.de Servicios de Salud del Estado"
replace comprador2=261 if comprador1=="NO VIGENTE Centro Auxiliar de AiguÃ¡"
replace comprador2=262 if comprador1=="NO VIGENTE Centro Auxiliar de Bella UniÃ³n"
replace comprador2=263 if comprador1=="NO VIGENTE Centro Aux.de Cardona y Florencio SÃ¡nchez"
replace comprador2=264 if comprador1=="NO VIGENTE Centro Auxiliar de Carmelo"
replace comprador2=265 if comprador1=="NO VIGENTE Centro Auxiliar de Castillos"
replace comprador2=266 if comprador1=="NO VIGENTE Centro Auxiliar  de Cerro Chato"
replace comprador2=267 if comprador1=="NO VIGENTE Centro Auxiliar Chuy"
replace comprador2=268 if comprador1=="NO VIGENTE Centro Auxiliar Ciudad de la Costa"
replace comprador2=269 if comprador1=="NO VIGENTE Centro Auxiliar Ciudad del Plata"
replace comprador2=270 if comprador1=="NO VIGENTE Centro Auxiliar de Dolores"
replace comprador2=271 if comprador1=="NO VIGENTE Centro Auxiliar de GuichÃ³n"
replace comprador2=272 if comprador1=="NO VIGENTE Centro Auxiliar de JosÃ© Batlle y  OrdoÃ±ez"
replace comprador2=273 if comprador1=="NO VIGENTE Centro Auxiliar de Juan Lacaze"
replace comprador2=274 if comprador1=="NO VIGENTE Centro Auxiliar de las Piedras"
replace comprador2=275 if comprador1=="NO VIGENTE Centro Auxiliar de Lascano"
replace comprador2=276 if comprador1=="NO VIGENTE Centro Auxiliar de Libertad"
replace comprador2=277 if comprador1=="NO VIGENTE Centro Auxiliar de Minas Corrales"
replace comprador2=278 if comprador1=="NO VIGENTE - Centro Auxiliar de Nueva Helvecia"
replace comprador2=278 if comprador1=="NO VIGENTE Centro Auxiliar de Nueva Helvecia"
replace comprador2=279 if comprador1=="NO VIGENTE Centro Auxiliar de Nueva Palmira"
replace comprador2=280 if comprador1=="NO VIGENTE Centro Auxiliar de Pan De AzÃºcar"
replace comprador2=281 if comprador1=="NO VIGENTE Centro Auxiliar de Pando"
replace comprador2=282 if comprador1=="NO VIGENTE Centro Auxiliar de Paso de los Toros"
replace comprador2=283 if comprador1=="NO VIGENTE Centro Auxiliar RincÃ³n de la Bolsa"
replace comprador2=284 if comprador1=="NO VIGENTE Centro Auxiliar de RÃ­o Branco"
replace comprador2=285 if comprador1=="NO VIGENTE Centro Auxiliar de Rosario"
replace comprador2=286 if comprador1=="NO VIGENTE Centro Auxiliar de San Carlos"
replace comprador2=287 if comprador1=="NO VIGENTE Centro Auxiliar de San Gregorio Polanco"
replace comprador2=288 if comprador1=="NO VIGENTE Centro Auxiliar de San RamÃ³n"
replace comprador2=289 if comprador1=="NO VIGENTE Centro Auxiliar de Santa LucÃ­a"
replace comprador2=290 if comprador1=="NO VIGENTE Centro Auxiliar de SarandÃ­ Del YÃ­"
replace comprador2=291 if comprador1=="NO VIGENTE Centro Auxiliar de SarandÃ­ Grande"
replace comprador2=292 if comprador1=="NO VIGENTE Centro Auxiliar de Tala"
replace comprador2=293 if comprador1=="NO VIGENTE Centro Auxiliar de Vergara"
replace comprador2=294 if comprador1=="NO VIGENTE Centro Auxiliar de Young"
replace comprador2=295 if comprador1=="NO VIGENTE Centro Departamental de Artigas"
replace comprador2=296 if comprador1=="NO VIGENTE Centro Departamental de Canelones"
replace comprador2=297 if comprador1=="NO VIGENTE Centro Departamental de Cerro Largo"
replace comprador2=298 if comprador1=="NO VIGENTE Centro Departamental de Durazno"
replace comprador2=299 if comprador1=="NO VIGENTE Centro Departamental de Flores"
replace comprador2=300 if comprador1=="NO VIGENTE Centro Departamental de Florida"
replace comprador2=301 if comprador1=="NO VIGENTE Centro Departamental de Lavalleja"
replace comprador2=302 if comprador1=="NO VIGENTE Centro Departamental de Maldonado"
replace comprador2=303 if comprador1=="NO VIGENTE Centro Departamental de PaysandÃº"
replace comprador2=304 if comprador1=="NO VIGENTE Centro Departamental de RÃ­o Negro"
replace comprador2=305 if comprador1=="NO VIGENTE Centro Departamental de Rivera"
replace comprador2=306 if comprador1=="NO VIGENTE Centro Departamental de Rocha"
replace comprador2=307 if comprador1=="NO VIGENTE Centro Departamental de Salto"
replace comprador2=308 if comprador1=="NO VIGENTE Centro Departamental de Sal.PÃºb.de Colonia"
replace comprador2=309 if comprador1=="NO VIGENTE Centro Departamental de San JosÃ©"
replace comprador2=310 if comprador1=="NO VIGENTE Centro Departamental de Soriano"
replace comprador2=311 if comprador1=="NO VIGENTE Centro Departamental de TacuarembÃ³"
replace comprador2=312 if comprador1=="NO VIGENTE Centro Departamental de Treinta y Tres"
replace comprador2=313 if comprador1=="NO VIGENTE Centro Hospitalario Pereira Rossell"
replace comprador2=314 if comprador1=="NO VIGENTE Colonia Dr.SantÃ­n Carlos Rossi"
replace comprador2=315 if comprador1=="NO VIGENTE Colonia SiquiÃ¡trica Dr. Bernardo Etchepare"
replace comprador2=316 if comprador1=="NO VIGENTE - DirecciÃ³n de Proyectos de Desarrollo"
replace comprador2=317 if comprador1=="NO VIGENTE DirecciÃ³n General de la Salud"
replace comprador2=318 if comprador1=="NO VIGENTE Escuela de Sanidad Dr.JosÃ© ScoserÃ­a"
replace comprador2=319 if comprador1=="NO VIGENTE Hosp-CTro GeriÃ¡trico Dr. Luis PiÃ±eiro del Campo"
replace comprador2=320 if comprador1=="NO VIGENTE Hospital Dr. Gustavo Saint Bois"
replace comprador2=321 if comprador1=="NO VIGENTE Hospital EspaÃ±ol"
replace comprador2=322 if comprador1=="NO VIGENTE Hospital Maciel"
replace comprador2=323 if comprador1=="NO VIGENTE Hospital Pasteur"
replace comprador2=324 if comprador1=="NO VIGENTE Hospital VilardebÃ³"
replace comprador2=325 if comprador1=="NO VIGENTE Inst.Nal.Don.yTransp.CÃ©l.Tej.Or"
replace comprador2=326 if comprador1=="NO VIGENTE Inst.Nal.de Reumat.Prof.Dr. MoisÃ©s Mizraji"
replace comprador2=327 if comprador1=="NO VIGENTE Instituto Nacional del CÃ¡ncer"
replace comprador2=328 if comprador1=="NO VIGENTE Laboratorio QuÃ­mico IndusT.Francisco Dorrego"
replace comprador2=329 if comprador1=="NO VIGENTE Red de Atenc.1er.nivel ASSE"
replace comprador2=330 if comprador1=="NO VIGENTE Serv. Nal de Ortopedia y TraumatologÃ­a"
replace comprador2=331 if comprador1=="NO VIGENTE Servicio Nacional de Sangre"
replace comprador2=332 if comprador1=="Oficinas Centrales y Escuelas Dependientes de Rectorado"
replace comprador2=333 if comprador1=="Oficina de Planeamiento y Presupuesto"
replace comprador2=334 if comprador1=="Oficina Nacional del Servicio Civil"
replace comprador2=335 if comprador1=="Poder Judicial"
replace comprador2=336 if comprador1=="Presidencia de la RepÃºblica"
replace comprador2=337 if comprador1=="Presidencia  de la RepÃºblica y Oficinas Dependientes"
replace comprador2=338 if comprador1=="Primeras LÃ­neas Uruguayas de NavegaciÃ³n AÃ©rea"
replace comprador2=339 if comprador1=="ProcuradurÃ­a Estado en Contencioso-Administrativo"
replace comprador2=340 if comprador1=="Red de AtenciÃ³n Primaria Area Metropolitana"
replace comprador2=341 if comprador1=="Red de AtenciÃ³n Primaria de Artigas"
replace comprador2=342 if comprador1=="Red de AtenciÃ³n Primaria de Canelones"
replace comprador2=343 if comprador1=="Red de AtenciÃ³n Primaria de Cerro Largo"
replace comprador2=344 if comprador1=="Red de AtenciÃ³n Primaria de Colonia"
replace comprador2=345 if comprador1=="Red de AtenciÃ³n Primaria de Durazno"
replace comprador2=346 if comprador1=="Red de AtenciÃ³n Primaria de Flores"
replace comprador2=347 if comprador1=="Red de AtenciÃ³n Primaria de Florida"
replace comprador2=348 if comprador1=="Red de AtenciÃ³n Primaria de Lavalleja"
replace comprador2=349 if comprador1=="Red de AtenciÃ³n Primaria de Maldonado"
replace comprador2=350 if comprador1=="Red de AtenciÃ³n Primaria de PaysandÃº"
replace comprador2=351 if comprador1=="Red de AtenciÃ³n Primaria de RÃ­o Negro"
replace comprador2=352 if comprador1=="Red de AtenciÃ³n Primaria de Rivera"
replace comprador2=353 if comprador1=="Red de AtenciÃ³n Primaria de Rocha"
replace comprador2=354 if comprador1=="Red de AtenciÃ³n Primaria de Salto"
replace comprador2=355 if comprador1=="Red de AtenciÃ³n Primaria de San JosÃ©"
replace comprador2=356 if comprador1=="Red de AtenciÃ³n Primaria de Soriano"
replace comprador2=357 if comprador1=="Red de AtenciÃ³n Primaria de TacuarembÃ³"
replace comprador2=358 if comprador1=="Red de AtenciÃ³n Primaria de Treinta y Tres"
replace comprador2=359 if comprador1=="Regional Norte"
replace comprador2=360 if comprador1=="SecretarÃ­a del Ministerio del Interior"
replace comprador2=361 if comprador1=="SecretarÃ­a  Nacional del Deporte"
replace comprador2=362 if comprador1=="Servicio de Retiros y Pensiones de las Fuerzas Armadas"
replace comprador2=363 if comprador1=="Servicio Nacional de Ortopedia y TraumatologÃ­a"
replace comprador2=364 if comprador1=="Servicio Nacional de Sangre"
replace comprador2=365 if comprador1=="Serv. Oficial DifusiÃ³n, RadiotelevisiÃ³n, EspectÃ¡culos"
replace comprador2=366 if comprador1=="TesorerÃ­a General de la NaciÃ³n"
replace comprador2=367 if comprador1=="Tribunal de Cuentas"
replace comprador2=368 if comprador1=="Tribunal de lo Contencioso Administrativo"
replace comprador2=369 if comprador1=="Unidad Reguladora de Servic.de Comunicaciones-URSEC"
replace comprador2=370 if comprador1=="Unidad Reguladora de Serv. de EnergÃ­a y Agua-URSEA"
replace comprador2=371 if comprador1=="Universidad TecnolÃ³gica del Uruguay"

label define cat5 -9 "NA" -1 "BLANK" 1 "Administración de las Obras Sanitarias del Estado" 2 "Administración de los Ferrocarriles del Estado" 3 "Administración de Servicios de Salud del Estado" 4 "Administración Nacional de Combustible, Alcohol y Portland" 5 "Administración Nacional de Correos" 6 "Administración Nacional de Puertos" 7 "Administración Nacional de Telecomunicaciones" 8 "Administración Nacional de Usinas y Trasmisiones Eléctricas" 9 "Agencia Nacional de Vivienda" 10   "AGESIC" 11 "Archivo General de la Nación" 12 "Asistencia Integral" 13 "Atención de Urgencia Emergencia Prehospitalaria y Traslado" 14 "Auditoría Interna de la Nación" 15 "Autoridad Reguladora Nacional en Radioprotección" 16 "Banco Central del Uruguay" 17 "Banco de la República del Uruguay" 18 "Banco de Previsión Social" 19 "Banco de Seguros del Estado" 20 "Banco Hipotecario del Uruguay" 21 "Cámara de Representantes" 22 "Cámara de Senadores" 23 "Canal 5 - Servicio de televisión Nacional" 24 "Casa Militar" 25 "Centro Auxiliar de Cardona y Florencio Sánchez" 26 "Centro Auxiliar de Chuy" 27 "Centro Auxiliar de Bella Unión" 28 "Centro Auxiliar de Carmelo" 29 "Centro Auxiliar de Castillos" 30 "Centro Auxiliar de Dolores" 31 "Centro Auxiliar de Juan Lacaze"  32 "Centro Auxiliar de Las Piedras" 33 "Centro Auxiliar de Pando" 34 "Centro Auxiliar de Paso de los Toros" 35 "Centro Auxiliar de Río Branco" 36 "Centro Auxiliar de Rosario" 37 "Centro Auxiliar de San Carlos" 38 "Centro Auxiliar de Young" 39 "Centro Información y Referencia de la Red de Drogas" 40 "Centro de Rehabilitación Médico Ocupacional y Sicosocial" 41 "Centro Departamental de Artigas" 42 "Centro Departamental de Canelones" 43 "Centro Departamental de Cerro Largo" 44 "Centro Departamental de Durazno" 45 "Centro Departamental de Flores" 46 "Centro Departamental de Florida" 47 "Centro Departamental de Lavalleja" 48 "Centro Departamental de Maldonado" 49 "Centro Departamental de Paysandú" 50 "Centro Departamental de Río Negro" 51 "Centro Departamental de Rivera" 52 "Centro Departamental de Rocha" 53 "Centro Departamental de Salto" 54 "Centro Departamental de Salud Pública de Colonia" 55 "Centro Departamental de San José" 56 "Centro Departamental de Soriano" 57 "Centro Departamental de Tacuarembó" 58 "Centro Departamental de Treinta y Tres" 59 "Centro Hospitalario Pereira Rossell" 60 "Centro Hospitalario Maldonado-San Carlos" 61 "Centro Universitario Regional Este" 62 "Centro Universitario Regional Litoral Norte" 63 "Colonia Dr. Santín Carlos Rossi" 64 "Colonia Siquiátrica Dr. Bernardo Etchepare" 65 "Comando General de la Armada" 66 "Comando General de la Fuerza Aérea" 67 "Comando General del Ejército" 68 "Comisión Administrativa del Poder Legislativo" 69 "Comisión del Patrimonio Cultural de la Nación" 70 "Comisión Honoraria para la Lucha Antituberculosa y Enfermedades Prevalentes" 71 "Comisión Nacional Honoraria de la Lucha contra la Hidatidosis" 72 "Consejo de Educación Primaria" 73 "Consejo de Educación Secundaria" 74 "Consejo de Educación Técnico-Profesional" 75 "Consejo de Formación en Educación" 76 "Consejo Directivo Central" 77 "Contaduría General de la Nación" 78 "Corte Electoral" 79 "Despacho de la Secretaría Estado y Oficinas Dependientes" 80 "Dirección Centros MEC" 81 "Dirección de Desarrollo Social" 82 "Dirección de Educación" 83 "Dirección General de Casinos" 84 "Dirección General de Comercio" 85 "Dirección General de Control de Inocuidad Alimentaria" 86 "Dirección General de Coordinación" 87 "Dirección General de Desarrollo Rural" 88 "Dirección General de Recursos Naturales Renovables" 89 "Dirección General de Registros" 90 "Dirección General de Secretaría" 91 "Dirección General de Secretaría de Estado" 92 "Dirección General de Secretaría del Mrio. de Economía y Finanzas" 93 "Dirección General de Secretaría (M.E.F.)" 94 "Dirección General de Servicios Agrícolas" 95 "Dirección General de Servicios Ganaderos" 96 "Dirección General de la Biblioteca Nacional" 97 "Dirección General de la Salud" 98 "Dirección General de los Servicios" 99 "Dirección General del Registro de Estado Civil" 100 "Dirección General del Sistema Nacional Integrado de Salud" 101 "Dirección General Forestal" 102 "Dirección General Impositiva" 103 "Dirección Nacional de Aduanas" 104 "Dirección Nacional de Aguas y Saneamiento" 105 "Dirección Nacional de Arquitectura" 106 "Dirección Nacional de Artesanías y Pequeñas y Medianas Empresas" 107 "Dirección Nacional de Asistencia Social Policial" 108 "Dirección Nacional de Asuntos Sociales" 109 "Dirección Nacional de Aviación Civil e Infraestructura Aeronáutica" 110 "Dirección Nacional de Bomberos" 111 "Dirección Nacional de Cárceles, Penitenciarías y Centros de Recuperación" 112 "Dirección Nacional de Catastro" 113 "Dirección Nacional de Coordinación en el Interior" 114 "Dirección Nacional de Cultura" 115 "Dirección Nacional de Deporte" 116 "Dirección Nacional de Empleo" 117 "Dirección Nacional de Energía" 118 "Dirección Nacional de Hidrografía" 119 "Dirección Nacional de Industrias" 120 "Dirección Nacional de Identificación Civil" 121 "Dirección Nacional de Información e Inteligencia" 122 "Dirección Nacional de la Propiedad Industrial" 123 "Dirección Nacional de Loterías y Quinielas" 124 "Dirección Nacional de Medio Ambiente" 125 "Dirección Nacional de Meteorología" 126 "Dirección Nacional de Migración" 127 "Dirección Nacional de Minería y Geología" 128 "Dirección Nacional de Ordenamiento Territorial" 129 "Dirección Nacional de Policía Científica" 130 "Dirección Nacional de Policía de Tránsito" 131 "Dirección Nacional de Prevención Social del Delito" 132 "Dirección Nacional de Recursos Acuáticos (Ex-INAPE)" 133 "Dirección Nacional de Sanidad de las Fuerzas Armadas" 134 "Dirección Nacional de Sanidad Policial" 135 "Dirección Nacional de Seguridad Social" 136 "Dirección Nacional de Telecomunicaciones" 137 "Dirección Nacional de Topografía" 138 "Dirección Nacional de Trabajo" 139 "Dirección Nacional de Transporte" 140 "Dirección Nacional de Turismo" 141 "Dirección Nacional de Vialidad" 142 "Dirección Nacional de Vivienda" 143 "Dirección para el Desarrollo de la Ciencia y el Conocimiento" 144 "Dirección Sistema de Atención Integral Personas Privadas de Libertad" 145 "Escuela Nacional de Policía" 146 "Estado Mayor de la Defensa" 147 "Ex-Administración General - Dir. General Secretaría" 148 "Ex-Dirección General Infraestructura Aeronáutica" 149 "Ex-Dirección Nacional Aviación Civil e Infraestructura Aeronáutica" 150 "Facultad de Agronomía" 151 "Facultad de Arquitectura" 152 "Facultad de Ciencias" 153 "Facultad de Ciencias Económicas y de Administración" 154 "Facultad de Ciencias Sociales" 155 "Facultad de Derecho" 156 "Facultad de Enfermería" 157 "Facultad de Humanidades y Ciencias de la Educación" 158 "Facultad de Información y Comunicación" 159 "Facultad de Ingeniería" 160 "Facultad de Medicina" 161 "Facultad de Medicina" 162 "Facultad de Odontología" 163 "Facultad de Psicología" 164 "Facultad de Química" 165 "Facultad de Veterinaria" 166 "Fiscalía de Corte - Procuraduría General de la Nación" 167 "Fiscalía General de la Nación" 168 "Fiscalías de Gobierno de Primer y Segundo Turno" 169 "Guardia Republicana" 170 "Hospital Centro Geriátrico Dr. Luis Piñeiro del Campo" 171 "Hospital de Clínicas" 172 "Hospital Dr. Gustavo Saint Bois" 173 "Hospital Español" 174 "Hospital Maciel" 175 "Hospital Pasteur" 176 "Hospital Vilardebó" 177 "IEMBAyEUM (Bellas Artes y Música)" 178 "Inspección General del Trabajo y de la Seguridad Social" 179 "Instituto de Higiene" 180 "Instituto de Investigaciones Biológicas Clemente Estable" 181 "Instituto del Niño y Adolescente del Uruguay (INAU-INAME)" 182 "Instituto Nacional de Alimentación" 183 "Instituto Nacional de Donación y Trasplante de Células, Tejidos y Órganos" 184 "Instituto Nacional de Colonización" 185 "Instituto Nacional de Estadística" 186 "Instituto Nacional de Inclusión Social Adolescente" 187 "Instituto Nacional de Reumatología Prof.Dr. Moisés Mizraji" 188 "Instituto Nacional del Cáncer" 189 "Instituto Uruguayo de Meteorología INUMET" 190 "Intendencia de Artigas" 191 "Intendencia de Canelones" 192 "Intendencia de Cerro Largo" 193 "Intendencia de Colonia" 194 "Intendencia de Durazno" 195 "Intendencia de Flores" 196 "Intendencia de Florida" 197 "Intendencia de Lavalleja" 198 "Intendencia de Maldonado" 199 "Intendencia de Montevideo" 200 "Intendencia de Paysandú" 201 "Intendencia de Río Negro" 202 "Intendencia de Rivera" 203 "Intendencia de Rocha" 204 "Intendencia de Salto" 205 "Intendencia de San José" 206 "Intendencia de Tacuarembó" 207 "Intendencia de Treinta y Tres" 208 "Jefatura de Policía de Artigas" 209 "Jefatura de Policía de Canelones" 210 "Jefatura de Policía de Cerro Largo" 211 "Jefatura de Policía de Colonia" 212 "Jefatura de Policía de Durazno" 213 "Jefatura de Policía de Flores" 214 "Jefatura de Policía de Florida" 215 "Jefatura de Policía de Lavalleja" 216 "Jefatura de Policía de Maldonado" 217 "Jefatura de Policía de Montevideo" 218 "Jefatura de Policía de Paysandú" 219 "Jefatura de Policía de Río Negro" 220 "Jefatura de Policía de Rivera" 221 "Jefatura de Policía de Rocha" 222 "Jefatura de Policía de Salto" 223 "Jefatura de Policía de San José" 224 "Jefatura de Policía de Soriano" 225 "Jefatura de Policía de Tacuarembó" 226 "Jefatura de Policía de Treinta y Tres" 227 "Junta de Transparencia y Ética Pública" 228 "Junta de Transparencia y Ética Pública-JUTEP" 229 "Junta Departamental de Artigas" 230 "Junta Departamental de Canelones" 231 "Junta Departamental de Cerro Largo" 232 "Junta Departamental de Colonia" 233 "Junta Departamental de Durazno" 234 "Junta Departamental de Flores" 235 "Junta Departamental de Florida" 236 "Junta Departamental de Lavalleja" 237 "Junta Departamental de Maldonado" 238 "Junta Departamental de Montevideo" 239 "Junta Departamental de Paysandú" 240 "Junta Departamental de Río Negro" 241 "Junta Departamental de Rivera" 242 "Junta Departamental de Rocha" 243 "Junta Departamental de Salto" 244 "Junta Departamental de San José" 245 "Junta Departamental de Soriano" 246 "Junta Departamental de Tacuarembó" 247 "Junta Departamental de Treinta y Tres" 248 "Junta Nacional de la Granja" 249 "Junta Nacional de Salud" 250 "Laboratorio Químico Industrial Francisco Dorrego" 251 "Ministerio de Agricultura y Pesca" 252 "Ministerio de Defensa Nacional" 253 "Ministerio de Deporte y Juventud" 254 "Ministerio de Economía y Finanzas" 255 "Ministerio de Relaciones Exteriores" 256 "Ministerio de Salud Pública" 257 "Museo Histórico Nacional" 258 "Museo Nacional de Artes Visuales" 259 "Museo Nacional de Historia Natural y Antropología" 260 "NO VIGENTE - Administración de Servicios de Salud del Estado" 261 "NO VIGENTE - Centro Auxiliar de Aiguá" 262 "NO VIGENTE - Centro Auxiliar de Bella Unión" 263 "NO VIGENTE - Centro Auxiliar de Cardona y Florencio Sánchez" 264 "NO VIGENTE - Centro Auxiliar de Carmelo" 265 "NO VIGENTE - Centro Auxiliar de Castillos" 266 "NO VIGENTE - Centro Auxiliar de Cerro Chato" 267 "NO VIGENTE - Centro Auxiliar de Chuy" 268 "NO VIGENTE - Centro Auxiliar de Ciudad de la Costa" 269 "NO VIGENTE - Centro Auxiliar de Ciudad del Plata" 270 "NO VIGENTE - Centro Auxiliar de Dolores" 271 "NO VIGENTE - Centro Auxiliar de Guichón" 272 "NO VIGENTE - Centro Auxiliar de José Batlle y Ordoñez" 273 "NO VIGENTE - Centro Auxiliar de Juan Lacaze" 274 "NO VIGENTE - Centro Auxiliar de Las Piedras" 275 "NO VIGENTE - Centro Auxiliar de Lascano" 276 "NO VIGENTE - Centro Auxiliar de Libertad" 277 "NO VIGENTE - Centro Auxiliar de Minas Corrales" 278 "NO VIGENTE - Centro Auxiliar de Nueva Helvecia" 279 "NO VIGENTE - Centro Auxiliar de Nueva Palmira" 280 "NO VIGENTE - Centro Auxiliar de Pan De Azúcar" 281 "NO VIGENTE - Centro Auxiliar de Pando" 282 "NO VIGENTE - Centro Auxiliar de Paso de los Toros" 283 "NO VIGENTE - Centro Auxiliar de Rincón de la Bolsa" 284 "NO VIGENTE - Centro Auxiliar de Río Branco" 285 "NO VIGENTE - Centro Auxiliar de Rosario" 286 "NO VIGENTE - Centro Auxiliar de San Carlos" 287 "NO VIGENTE - Centro Auxiliar de San Gregorio Polanco" 288 "NO VIGENTE - Centro Auxiliar de San Ramón" 289 "NO VIGENTE - Centro Auxiliar de Santa Lucía" 290 "NO VIGENTE - Centro Auxiliar de Sarandí Del Yí" 291 "NO VIGENTE - Centro Auxiliar de Sarandí Grande" 292 "NO VIGENTE - Centro Auxiliar de Tala" 293 "NO VIGENTE - Centro Auxiliar de Vergara" 294 "NO VIGENTE - Centro Auxiliar de Young" 295 "NO VIGENTE - Centro Departamental de Artigas" 296 "NO VIGENTE - Centro Departamental de Canelones" 297 "NO VIGENTE - Centro Departamental de Cerro Largo" 298 "NO VIGENTE - Centro Departamental de Durazno" 299 "NO VIGENTE - Centro Departamental de Flores" 300 "NO VIGENTE - Centro Departamental de Florida" 301 "NO VIGENTE - Centro Departamental de Lavalleja" 302 "NO VIGENTE - Centro Departamental de Maldonado" 303 "NO VIGENTE - Centro Departamental de Paysandú" 304 "NO VIGENTE - Centro Departamental de Río Negro" 305 "NO VIGENTE - Centro Departamental de Rivera" 306 "NO VIGENTE - Centro Departamental de Rocha" 307 "NO VIGENTE - Centro Departamental de Salto" 308 "NO VIGENTE - Centro Departamental de Salud Pública de Colonia" 309 "NO VIGENTE - Centro Departamental de San José" 310 "NO VIGENTE - Centro Departamental de Soriano" 311 "NO VIGENTE - Centro Departamental de Tacuarembó" 312 "NO VIGENTE - Centro Departamental de Treinta y Tres" 313 "NO VIGENTE - Centro Hospitalario Pereira Rossell" 314 "NO VIGENTE - Colonia Dr. Santín Carlos Rossi" 315 "NO VIGENTE - Colonia Siquiátrica Dr. Bernardo Etchepare" 316 "NO VIGENTE - Dirección de Proyectos de Desarrollo" 317 "NO VIGENTE - Dirección General de la Salud" 318 "NO VIGENTE - Escuela de Sanidad Dr. José Scosería" 319 "NO VIGENTE - Hospital Centro Geriátrico Dr. Luis Piñeiro del Campo" 320 "NO VIGENTE - Hospital Dr. Gustavo Saint Bois" 321 "NO VIGENTE - Hospital Español" 322 "NO VIGENTE - Hospital Maciel" 323 "NO VIGENTE - Hospital Pasteur" 324 "NO VIGENTE - Hospital Vilardebó" 325 "NO VIGENTE - Instituto Nacional de Donación y Trasplante de Células, Tejidos y Órganos" 326 "NO VIGENTE - Instituto Nacional de Reumatología Prof.Dr. Moisés Mizraji" 327 "NO VIGENTE - Instituto Nacional del Cáncer"  328 "NO VIGENTE - Laboratorio Químico Industrial Francisco Dorrego"  329 "NO VIGENTE - Red de Atención 1er nivel ASSE" 330 "NO VIGENTE - Servicio Nacional de Ortopedia y Traumatología" 331 "NO VIGENTE - Servicio Nacional de Sangre" 332 "Oficinas Centrales y Escuelas Dependientes de Rectorado" 333 "Oficina de Planeamiento y Presupuesto" 334 "Oficina Nacional del Servicio Civil" 335 "Poder Judicial" 336 "Presidencia de la República" 337 "Presidencia de la República y Oficinas Dependientes" 338 "Primeras Líneas Uruguayas de Navegación Aérea" 339 "Procuraduría Estado en Contencioso-Administrativo" 340 "Red de Atención Primaria Área Metropolitana" 341 "Red de Atención Primaria de Artigas" 342 "Red de Atención Primaria de Canelones" 343 "Red de Atención Primaria de Cerro Largo" 344 "Red de Atención Primaria de Colonia" 345 "Red de Atención Primaria de Durazno" 346 "Red de Atención Primaria de Flores" 347 "Red de Atención Primaria de Florida" 348 "Red de Atención Primaria de Lavalleja" 349 "Red de Atención Primaria de Maldonado" 350 "Red de Atención Primaria de Paysandú" 351 "Red de Atención Primaria de Río Negro" 352 "Red de Atención Primaria de Rivera" 353 "Red de Atención Primaria de Rocha" 354 "Red de Atención Primaria de Salto" 355 "Red de Atención Primaria de San José" 356 "Red de Atención Primaria de Soriano" 357 "Red de Atención Primaria de Tacuarembó" 358 "Red de Atención Primaria de Treinta y Tres" 359 "Regional Norte" 360 "Secretaría del Ministerio del Interior" 361 "Secretaría Nacional del Deporte" 362 "Servicio de Retiros y Pensiones de las Fuerzas Armadas" 363 "Servicio Nacional de Ortopedia y Traumatología" 364 "Servicio Nacional de Sangre" 365 "Servicio Oficial Difusión, Radiotelevisión, Espectáculos" 366 "Tesorería General de la Nación" 367 "Tribunal de Cuentas" 368 "Tribunal de lo Contencioso Administrativo" 369 "Unidad Reguladora de Servicios de Comunicaciones - URSEC" 370 "Unidad Reguladora de Servicios de Energía y Agua - URSEA" 371 "Universidad Tecnológica del Uruguay"
label values comprador2 cat5
}


******************************************************************************
***************************** VARIABLE organismo *****************************
******************************************************************************
g organismo=.
replace organismo=-9 if comprador==-9
replace organismo=-1 if comprador==-1
replace organismo=1  if inrange(comprador,1,3)
replace organismo=2  if inrange(comprador,4,13)
replace organismo=3  if inrange(comprador,14,27)
replace organismo=4  if inrange(comprador,28,62)
replace organismo=5  if inrange(comprador,63,72)
replace organismo=6  if comprador==73
replace organismo=7  if inrange(comprador,74,82)
replace organismo=8  if inrange(comprador,83,90)
replace organismo=9  if inrange(comprador,91,93)
replace organismo=10 if inrange(comprador,94,100)
replace organismo=11 if inrange(comprador,101,121)
replace organismo=12 if inrange(comprador,122,202)
replace organismo=13 if inrange(comprador,203,209)
replace organismo=14 if inrange(comprador,210,214)
replace organismo=15 if inrange(comprador,215,217)
replace organismo=16 if inrange(comprador,218,222)
replace organismo=17 if comprador==223
replace organismo=18 if comprador==224
replace organismo=19 if comprador==225
replace organismo=24 if inrange(comprador,226,242)
replace organismo=25 if inrange(comprador,243,247)
replace organismo=26 if inrange(comprador,248,275)
replace organismo=27 if comprador==276
replace organismo=28 if comprador==277
replace organismo=29 if inrange(comprador,278,364)
replace organismo=31 if comprador==365
replace organismo=32 if comprador==366
replace organismo=33 if comprador==367
replace organismo=34 if comprador==368
replace organismo=35 if comprador==369
replace organismo=36 if inrange(comprador,370,374)
replace organismo=40 if inrange(comprador,375,382)
replace organismo=50 if comprador==383
replace organismo=51 if comprador==384
replace organismo=52 if comprador==385
replace organismo=53 if comprador==386
replace organismo=60 if comprador==387
replace organismo=61 if comprador==388
replace organismo=62 if comprador==389
replace organismo=63 if comprador==390
replace organismo=64 if comprador==391
replace organismo=65 if comprador==392
replace organismo=66 if comprador==393
replace organismo=67 if comprador==394
replace organismo=68 if comprador==395
replace organismo=69 if comprador==396
replace organismo=70 if comprador==397
replace organismo=71 if comprador==398
replace organismo=80 if inrange(comprador,399,400)
replace organismo=81 if inrange(comprador,401,402)
replace organismo=82 if inrange(comprador,403,404)
replace organismo=83 if inrange(comprador,405,406)
replace organismo=84 if inrange(comprador,407,408)
replace organismo=85 if inrange(comprador,409,410)
replace organismo=86 if inrange(comprador,411,412)
replace organismo=87 if inrange(comprador,413,414)
replace organismo=88 if inrange(comprador,415,416)
replace organismo=89 if inrange(comprador,417,418)
replace organismo=90 if inrange(comprador,419,420)
replace organismo=91 if inrange(comprador,421,422)
replace organismo=92 if inrange(comprador,423,424)
replace organismo=93 if inrange(comprador,425,426)
replace organismo=94 if inrange(comprador,427,428)
replace organismo=95 if inrange(comprador,429,430)
replace organismo=96 if inrange(comprador,431,432)
replace organismo=97 if inrange(comprador,433,434)
replace organismo=98 if inrange(comprador,435,436)
replace organismo=99 if comprador==437

label define cat6 -9 "NA" -1 "BLANK" 1 "Poder Legislativo" 2 "Presidencia de la República" 3 "Ministerio de Defensa Nacional" 4 "Ministerio del Interior" 5 "Ministerio de Economía y Finanzas" 6 "Ministerio de Relaciones Exteriores" 7 "Ministerio de Ganadería, Agricultura y Pesca" 8 "Ministerio de Industria, Energía y Minería" 9 "Ministerio de Turismo" 10 "Ministerio de Transporte y Obras Públicas" 11 "Ministerio de Educación y Cultura" 12 "Ministerio de Salud Pública" 13 "Ministerio de Trabajo y Seguridad Social" 14 "Ministerio de Vivienda, Ordenamiento Territorial y Medio Ambiental" 15 "Ministerio de Desarrollo Social" 16 "Poder Judicial" 17 "Tribunal de Cuentas" 18 "Corte Electoral" 19 "Tribunal de lo Contencioso-Administrativo" 20 "Intereses y otros Gastos de la Deuda" 21 "Subsidios y subvenciones" 22 "Transferencias Financieras al Sector de Seguridad Social" 23 "Partidas a Reaplicar" 24 "Diversos Créditos" 25 "Administración Nacional de Educación Pública" 26 "Universidad de la República" 27 "Instituto del Niño y el Adolescente del Uruguay" 29 "Administración de Servicios de Salud del Estado" 31 "Universidad Tecnológica del Uruguay" 32 "Instituto Uruguayo de Meteorología" 33 "Fiscalía General de la Nación" 34 "Junta de Transparencia y Ética Pública" 35 "Instituto Nacional de Inclusión Social Adolescente" 36 "Ministerio de Medio Ambiente" 40 "Instituciones sin fines de lucro públicas" 50 "Banco Central del Uruguay" 51 "Banco de la República del Uruguay" 52 "Banco Hipotecario del Uruguay" 53 "Banco de Seguros del Estado" 60 "Administración Nacional de Combustible, Alcohol y Portland" 61 "Administración Nacional de Usinas y Trasmisiones Eléctricas" 62 "Administración de los Ferrocarriles del Estado" 63 "Primeras Líneas Uruguayas de Navegación Aérea" 64 "Administración Nacional de Puertos" 65 "Administración Nacional de Telecomunicaciones" 66 "Administración de las Obras Sanitarias del Estado" 67 "Administración Nacional de Correos" 68 "Agencia Nacional de Vivienda" 69 "Unidad Reguladora de Servicios de Energía y Agua" 70 "Instituto Nacional de Colonización" 71 "Unidad Reguladora de Servicios de Comunicaciones" 80 "Intendencia de Artigas" 81 "Intendencia de Canelones" 82 "Intendencia de Cerro Largo" 83 "Intendencia de Colonia" 84 "Intendencia de Durazno" 85 "Intendencia de Flores" 86 "Intendencia de Florida" 87 "Intendencia de Lavalleja" 88 "Intendencia de Maldonado" 89 "Intendencia de Paysandú" 90 "Intendencia de Río Negro" 91 "Intendencia de Rivera" 92 "Intendencia de Rocha" 93 "Intendencia de Salto" 94 "Intendencia de San José" 95 "Intendencia de Soriano" 96 "Intendencia de Tacuarembó" 97 "Intendencia de Treinta y Tres" 98 "Intendencia de Montevideo" 99 "Congreso de Intendentes"
label values organismo cat6


******************************************************************************
******************************* VARIABLE fecha *******************************
******************************************************************************
g año=substr(date,1,4)
g mes=substr(date,6,2)
g dia=substr(date,9,2)
destring mes dia, replace
recode mes dia (.=-1)

label define cat7 -1 "BLANK" 1 "Enero" 2 "Febrero" 3 "Marzo" 4 "Abril" 5 "Mayo" 6 "Junio" 7 "Julio" 8 "Agosto" 9 "Setiembre" 10 "Octubre" 11 "Noviembre" 12 "Diciembre"
label values mes cat7


******************************************************************************
**************************** VARIABLE tipo_compra ****************************
******************************************************************************
rename tenderprocurementMethodDetails tipo_compra1

g tipo_compra=.
replace tipo_compra=-9 if tipo_compra1=="NA"
replace tipo_compra=1  if tipo_compra1=="Arrendamiento de Obra"
replace tipo_compra=2  if tipo_compra1=="Compra Directa"
replace tipo_compra=3  if tipo_compra1=="Compra por ExcepciÃ³n"
replace tipo_compra=4  if tipo_compra1=="ConcesiÃ³n"
replace tipo_compra=5  if tipo_compra1=="Concurso de Precios"
replace tipo_compra=6  if tipo_compra1=="LicitaciÃ³n Abreviada"
replace tipo_compra=7  if tipo_compra1=="LicitaciÃ³n PÃºblica"
replace tipo_compra=8  if tipo_compra1=="PFI - ComparaciÃ³n de precios"
replace tipo_compra=9  if tipo_compra1=="PFI - ContrataciÃ³n directa"
replace tipo_compra=10 if tipo_compra1=="PFI - LicitaciÃ³n pÃºblica internacional"
replace tipo_compra=11 if tipo_compra1=="PFI - LicitaciÃ³n pÃºblica nacional"
replace tipo_compra=12 if tipo_compra1=="PregÃ³n"
replace tipo_compra=13 if tipo_compra1=="Procedimiento Especial"
replace tipo_compra=14 if tipo_compra1=="Venta/Arrendamiento Directa"
replace tipo_compra=15 if tipo_compra1=="Venta/Arrendamiento LicitaciÃ³n Abreviada"
replace tipo_compra=16 if tipo_compra1=="Venta/Arrendamiento LicitaciÃ³n PÃºblica"
replace tipo_compra=17 if tipo_compra1=="Venta/Arrendamiento por Remate"

label define cat8 -9 "NA" 1 "Arrendamiento de Obra" 2 "Compra Directa" 3 "Compra por Excepción" 4 "Concesión" 5 "Concurso de Precios" 6 "Licitación Abreviada" 7 "Licitación Pública" 8 "PFI - Comparación de precios" 9 "PFI - Contratación directa" 10 "PFI - Licitación pública internacional" 11 "PFI - Licitación pública nacional" 12 "Pregón" 13 "Procedimiento Especial" 14 "Venta/Arrendamiento Directa" 15 "Venta/Arrendamiento Licitación Abreviada" 16 "Venta/Arrendamiento Licitación Pública" 17 "Venta/Arrendamiento por Remate"
label values tipo_compra cat8



drop ocid1 codigo_fiscal1 idx idlicitem1 monto1 cantidad1 moneda1 unidad1 id1 tipo_compra1 comprador1 fecha2 date

cd "C:\Users\feder\OneDrive\Desktop"
save "Base_ComprasPublicas.dta", replace