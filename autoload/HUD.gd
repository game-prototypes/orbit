extends CanvasLayer


onready var planet_name_label:Label=$PlanetInfo/PlanetName
onready var ships_label:Label=$PlanetInfo/ShipsLabel
onready var reosurces_label:Label=$PlanetInfo/ResourcesLabel
onready var planet_info:Panel=$PlanetInfo

var planet:Planet

func _ready():
	hide_planet_info()

func display_planet_info(planet: Planet):
	self.planet=planet

func _process(delta: float) -> void:
	if planet:
		planet_name_label.text=planet.planet_name
		planet_info.visible=true
		ships_label.text="Ships: "+ String(planet.ships.size())
		reosurces_label.text="Resources: "+ String(planet.resources) + " (+" + String(planet.production_rate)+ ")"

func hide_planet_info():
	planet_info.visible=false


func _on_build_button_pressed() -> void:
	planet.build_ship()


func _on_launch_ship_pressed() -> void:
	if planet.can_launch_ship():
		planet.launch_ship()

