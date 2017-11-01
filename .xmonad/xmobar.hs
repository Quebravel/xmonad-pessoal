-- Todas as Frags USE="" para ativar todas as extenções:
-- mpd mpris timezone with_conduit with_uvmeter alsa dbus inotify wifi xft xpm

Config {  font = "-Misc-Fixed-Regular-R-Normal-*-13-*-*-*-*-*-*-*"
       , additionalFonts = [ "xft:ProFont-11" ] --(adicione no make.conf USE="xft" para o xmobar ser compilado com essa extenção)
       , borderColor = "#1a1a1a"
       , border = NoBorder
       , bgColor = "#1a1a1a"
       , fgColor = "grey"
       , alpha = 255
       , position = TopW L 97
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = True
       , overrideRedirect = True
       , commands = [

       -- VOLUME
       Run Volume "default" "Master" [ "--template" , "<status>" --(adicione no make.conf USE="alsa" para o xmobar ser compilado com essa extenção)
       , "--"
       , "--on", "<fc=#00ccff>Vol: <volume></fc>%"
       , "--onc", "gray"
       , "--off", "<fc=#dc322f>Vol: MUDO</fc>"
       , "--offc", "#dc322f"
       ] 10

       -- BATÉRIA
--       , Run Battery        	[ "--template" , "Bat: <acstatus>"
--       , "--Low"      	, "10"        -- units: %
--       , "--High"     	, "80"        -- units: %
--       , "--low"      	, "darkred"
--       , "--normal"   	, "darkorange"
--       , "--high"     	, "darkcyan"
--       , "--" -- battery specific options
       -- discharging status
--       , "-o"	, "<left>% (<timeleft>)"
       -- AC "on" status
--       , "-O"	, "<fc=yellow>AC</fc>"
       -- charged status
--       , "-i"	, "<fc=darkcyan>100</fc>%"
--       ] 50

       -- TEMPERATURA
       , Run CoreTemp       	[ "--template" , "<core0>°C <core1>°C"
       , "--Low"      	, "60"        -- units: °C
       , "--High"     	, "80"        -- units: °C
       , "--low"      	, "blue"
       , "--normal"   	, "darkorange"
       , "--high"     	, "red"
       ] 50

       -- INTERNET (dynamic interface resolution)
       , Run DynNetwork     	[ "--template" , "<fc=#ff0066><dev></fc> <rx>kB/s <tx>kB/s"
       , "--Low"      	, "30000"       -- units: Kb/s
       , "--High"     	, "60000"       -- units: Kb/s
       , "--low"      	, "blueviolet"
       , "--normal"   	, "orange"
       , "--high"     	, "red"
       ] 10

       -- SINAL WIFI
--       ,  Run Wireless "wlp2s0" --(adicione no make.conf USE="wifi" para o xmobar ser compilado com essa extenção) (%wlp2s0wi%)
--       [ "-a", "l"
--       , "-x", "-"
--       , "-t", "<fc=blueviolet><essid> <quality></fc>%"
--       , "-L", "40"
--       , "-H", "70"
--       , "-l", "red" 
--       , "-n", "blueviolet"
--       , "-h", "blueviolet"
--       ] 10

       -- MEMÓRIA RAM
       , Run Memory		[ "--template" ,"Mem: <used>Mb"
       , "--Low"		, "500"        -- units: %
       , "--High"		, "3000"       -- units: %
       , "--low"		, "gray"
       , "--normal"   	, "darkorange"
       , "--high"     	, "red"
       ] 10

       -- CPU
       , Run MultiCpu       	[ "--template" , "<total0>% <total1>% <total2>% <total3>%"
       , "--Low"      	, "50"         -- units: %
       , "--High"     	, "85"         -- units: %
       , "--low"      	, "grey"
       , "--normal"   	, "orange"
       , "--high"     	, "red"
       ] 10

       -- LOCKS
       , Run Locks

       -- DATA
       -- , Run Date "%A %d/%m/%y %H:%M:%S " "date" 10
       -- , Run Com "sh" ["/home/jonatas/.xmonad/date.sh"] "date" 10
       , Run Com "date" ["+%A %d/%m/%y %H:%M:%S"] "mydate" 10

       -- BARRA TITULO/TAGS
       , Run StdinReader

       ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %StdinReader% | %multicpu% | %memory% | %battery% }{ <fc=gray>%locks%</fc> | %dynnetwork% %wlp2s0wi% | %coretemp% | %default:Master% | <fc=#ee9a00>%mydate%</fc>  " }
--     , template = " <fn=1>%StdinReader% | %multicpu% | %memory% | %battery%</fn> }{ <fn=1><fc=gray>%locks%</fc> | %dynnetwork% %wlp2s0wi% | %coretemp% | %default:Master% | <fc=#ee9a00>%mydate%</fc></fn>  " }
