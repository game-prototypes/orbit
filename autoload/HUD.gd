extends CanvasLayer


onready var planet_name_label:Label=$PlanetInfo/PlanetName

onready var ships_label:Label=$PlanetInfo/ShipsLabel
onready var resources_label:Label=$PlanetInfo/ResourcesLabel
onready var planet_info:Panel=$PlanetInfo

onready var orbit_info:Panel=$OrbitInfo
onready var orbit_name_label:Label=$OrbitInfo/OrbitName
onready var orbit_ships_label:Label=$OrbitInfo/ShipsLabel

var planet:Planet
var orbit:Orbit

func _ready():
	reset_info()

func display_planet_info(planet: Planet):
	self.planet=planet
	self.orbit=null

func display_orbit_info(orbit:Orbit):
	print("DISPLAY ORBIT INFO")
	self.orbit=orbit
	self.planet=null

func _process(delta: float) -> void:
	reset_info()
	if planet:
		planet_name_label.text=planet.planet_name
		planet_info.visible=true
		ships_label.text="Ships: "+ String(planet.ships.size())
		resources_label.text="Resources: "+ String(planet.resources) + " (+" + String(planet.production_rate)+ ")"
	
	elif orbit:
		orbit_info.visible=true
		orbit_name_label.text=orbit.get_planet().planet_name + " Orbit"
		orbit_ships_label.text="Ships: "+ String(orbit.ships.size())

func reset_info():
	planet_info.visible=false
	orbit_info.visible=false

func _on_build_button_pressed() -> void:
	planet.build_ship()


func _on_launch_ship_pressed() -> void:
	if planet.can_launch_ship():
		planet.launch_ship()

