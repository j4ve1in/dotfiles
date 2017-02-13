Config {
  font = "xft:Migu 1M:size=13",
  bgColor = "black",
  fgColor = "white",
  position = TopSize C 100 20,
  lowerOnStart = False,
  overrideRedirect = False,
  border = NoBorder,
  commands = [
    Run DynNetwork [
      "--template" , "<fc=royalblue><icon=up.xbm/></fc> <tx>kB/s <fc=royalblue><icon=down.xbm/></fc> <rx>kB/s",
      "--High"     , "5000",
      "--normal"   , "white",
      "--high"     , "mediumpurple"
    ] 10,
    Run Memory [
      "-t", "<fc=royalblue><icon=mem.xbm/></fc> <usedratio>%",
      "-H", "90",
      "--normal", "white",
      "--high" , "mediumpurple"
    ] 10,
    Run Battery [
      "-t" , "<fc=royalblue><icon=battery.xbm/></fc> <acstatus>",
      "-L", "20",
      "--low", "mediumpurple",
      "--normal", "white",
      "--",
      "-o", "<left>% (<timeleft>)",
      "-O", "Charging <left>%",
      "-i", "<left>%"
    ] 10,
    Run Date "%a %m/%d %T" "date" 10,
    Run StdinReader
  ],
  sepChar = "%",
  alignSep = "}{",
  template = " %StdinReader% }{ %dynnetwork%  %memory%  %battery%  %date% "
}
