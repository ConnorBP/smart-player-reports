# either add spcomp to your system path or add the full location to it here as SMC
SMC = spcomp
FLAGS = "-O2 -t4"

build: clean
	mkdir -p csgo/addons/sourcemod/plugins
	$(SMC) csgo/addons/sourcemod/scripting/smart-player-reports.sp ${FLAGS} -o=csgo/addons/sourcemod/plugins/smart-player-reports
	$(SMC) csgo/addons/sourcemod/scripting/spr_example.sp ${FLAGS} -o=csgo/addons/sourcemod/plugins/spr_example
	$(SMC) csgo/addons/sourcemod/scripting/spr_steammessager.sp ${FLAGS} -o=csgo/addons/sourcemod/plugins/spr_steammessager

clean:
	rm -rf *.smx *.zip csgo/addons/sourcemod/plugins

package: build
	zip -r smart-player-reports csgo LICENSE README.md
