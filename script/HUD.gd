extends CanvasLayer

onready var lobby_game = $Control/LobbyGame
onready var about_us = $Control/AboutUs
onready var settings = $Control/Settings

# Called when the node enters the scene tree for the first time.
func _ready():
	lobby_game.show()
	about_us.hide()
	settings.hide()

func _on_Back_pressed(current_button):
	if(current_button == "about us"):
		settings.show()
		about_us.hide()
	else :
		lobby_game.show()
		settings.hide()





func _on_AboutUs_pressed():
	settings.hide()
	about_us.show()
