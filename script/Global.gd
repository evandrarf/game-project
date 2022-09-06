extends Node

onready var menu = $Menu
onready var menu_text = $Menu/Control/NinePatchRect/Label
onready var soal = $Soal
onready var rocket = $Rocket

const rocket_pos = Vector2(567, 1763)

func _ready():
	menu.hide()
	get_tree().paused = false



func _on_Asteroid4_area_entered(area, index):
	get_tree().paused = true
	var arr_soal = soal.soal
	var nomor_soal = soal.nomor_soal
	menu.show()
	if(index == arr_soal[nomor_soal]["jawaban"]):
		menu_text.text = "Jawaban Anda Benar"
	else :
		menu_text.text = "Jawaban Anda Salah"


func _on_TextureButton_pressed():
	soal.nomor_soal += 1
	get_tree().paused = false
	menu.hide()
	rocket.position = rocket_pos
