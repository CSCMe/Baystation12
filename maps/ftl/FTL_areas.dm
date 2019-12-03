//Kestrel rooms
/area/ship/kestrel
	req_access = list(access_kestrel)

/area/ship/Kestrel/helm
	name = "\improper Kestrel Helm"
	icon_state = "shuttlered"
	req_access = list(access_bridge)

/area/ship/Kestrel/comms
	name = "\improper Kestrel Telecommunications"
	icon_state = "tcomsatcham"

/area/ship/Kestrel/monitoring
	name = "\improper Kestrel Monitoring Room"
	icon_state = "crew_quarters"

/area/ship/Kestrel/doorcontrol
	name = "\improper Kestrel Cryogenics"
	icon_state = "security"

/area/ship/Kestrel/shields
	name = "\improper Kestrel Mess Hall"
	icon_state = "crew_quarters"

/area/ship/Kestrel/medbay
	name = "\improper Kestrel Medbay"
	icon_state = "medbay4"

/area/ship/Kestrel/starboard
	name = "\improper Kestrel Starboard"
	icon_state = "hallA"

/area/ship/Kestrel/port
	name = "\improper Kestrel port"
	icon_state = "hallF"

/area/ship/Kestrel/wcrtl
	name = "\improper Kestrel Point Defense Control"
	icon_state = "disperser"

/area/ship/Kestrel/Nstarboard
	name = "\improper Kestrel Starboard Narcelle"
	icon_state = "thruster"

/area/ship/Kestrel/Nport
	name = "\improper Kestrel Port Narcelle"
	icon_state = "thruster"

/area/ship/Kestrel/teleporter
	name = "\improper Kestrel Teleporter"
	icon_state = "teleporter"

/area/ship/Kestrel/atmos
	name = "\improper Kestrel Atmospherics"
	icon_state = "atmos"

/area/ship/Kestrel/engine
	name = "\improper Kestrel Enginering"
	icon_state = "engineering"

/area/ship/Kestrel/shall
	name = "\improper Starboard Hallway"

/area/ship/Kestrel/phall
	name = "\improper Port Hallway"

//voyager
/area/voyager/start
	name = "\improper Voyager"
	icon_state = "shuttle2"
	requires_power = 1
	dynamic_lighting = 1
	req_access = list(access_voyager)