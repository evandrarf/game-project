extends Node

onready var menu = $Game/Menu/Control
onready var menu_text = $Game/Menu/Control/NinePatchRect/Label
onready var soal = $Game/Soal
onready var rocket = $Game/Rocket
onready var game = $Game
onready var hud = $HUD/Control
onready var skor = $Game/Skor
onready var menu_button_text = $Game/Menu/Control/NinePatchRect/TextureButton/Label
onready var lobby_game = $HUD/Control/LobbyGame
onready var settings = $HUD/Control/Settings
onready var nextButton = $Game/Menu/Control/NinePatchRect/TextureButton
onready var XButton = $Game/Menu/Control/XButton

var skor_num = 0
var soal_terakhir = false
var back_to_home = false
var is_game_starting = false

func _ready():
	menu.hide()
	game.hide()
	is_game_starting = false
	get_tree().paused = false
	skor.text = str(skor_num)
	randomize()
	soal.position_index = int(round(rand_range(0, 5)))
	soal.soal.shuffle()
	settings.hide()
	XButton.hide()
	var shortcut=ShortCut.new()
	shortcut.set_shortcut(InputMap.get_action_list("next")[0])#I have configured in the InputMap an InputEventKey called selectWeapon1(it is the only one so we need the zero-th index)
	nextButton.set_shortcut(shortcut)

func _process(delta):
	if(is_game_starting and Input.is_action_pressed("ui_cancel")) :

		pause_game()
		
		

func start_again():
	back_to_home = false
	get_tree().paused = false
	menu.hide()
	XButton.hide()

func pause_game():
	back_to_home = true
	get_tree().paused = true
	XButton.show()
	menu.show()
	menu_text.text = "Menu"
	menu_button_text.text = "Home"

const rocket_pos = Vector2(567, 1763)


func _on_Asteroid_area_entered(area, index):
	get_tree().paused = true
	var arr_soal = soal.soal
	var nomor_soal = soal.nomor_soal
	if (!soal_terakhir) :
		print(index)
		if(index == arr_soal[nomor_soal]["jawaban"]):
			menu_text.text = "Jawaban Anda Benar"
			skor_num += 1
			skor.text = str(skor_num)
		else :
			menu_text.text = "Jawaban Anda Salah"
	else :
		if(index == arr_soal[nomor_soal]["jawaban"]):
			skor_num += 1
			skor.text = str(skor_num)
		menu_text.text = "Anda mendapatkan " + str(skor_num) + " poin"
		menu_button_text.text = "Back"
	soal.nomor_soal += 1
	menu.show()


func _on_TextureButton_pressed():
	get_tree().paused = false
	menu.hide()
	rocket.position = rocket_pos
	if(back_to_home):
		hud.show()
		game.hide()
	else :
		randomize()
		soal.position_index = int(round(rand_range(0, 11)))
		if(soal.nomor_soal == 9) :
			soal_terakhir = true
		if(soal.nomor_soal == 10):
			start_game()


func _on_StartButton_pressed():
	back_to_home = false
	hud.hide()
	game.show()
	is_game_starting = true


func start_game() :
	hud.show()
	game.hide()
	soal.nomor_soal = 0
	soal_terakhir = false
	skor_num = 0
	skor.text = str(skor_num)
	is_game_starting = true


func _on_SettingsButton_pressed():
	lobby_game.hide()
	settings.show()





#func _on_XButton_gui_input(event):
	#if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
	  # start_again()


func _on_XButton_pressed():
	start_again()
