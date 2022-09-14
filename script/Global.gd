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
onready var nyawa_scene = $Game/Nyawa
onready var love = get_all_children(nyawa_scene)

var skor_num = 0
var soal_terakhir = false
var nyawa = 3

func _ready():
	menu.hide()
	game.hide()
	get_tree().paused = false
	skor.text = str(skor_num)
	randomize()
	soal.position_index = int(round(rand_range(0, 5)))
	soal.soal.shuffle()
	settings.hide()
	var shortcut=ShortCut.new()
	shortcut.set_shortcut(InputMap.get_action_list("next")[0])#I have configured in the InputMap an InputEventKey called selectWeapon1(it is the only one so we need the zero-th index)
	nextButton.set_shortcut(shortcut)
	nyawa_scene.hide()
	
	

func _process(delta):
	match nyawa:
		2:
			love[2].hide()
		1:
			love[1].hide()
		0:
			love[0].hide()
			get_tree().paused = true
			menu.show()
			menu_text.text = "Game Over"
			menu_button_text.text = "Back"
			

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
			nyawa -= 1
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
	randomize()
	soal.position_index = int(round(rand_range(0, 11)))
	if(soal.nomor_soal == 9) :
		soal_terakhir = true
	if(soal.nomor_soal == 10):
		start_game()


func _on_StartButton_pressed():
	hud.hide()
	game.show()
	nyawa_scene.show()
	for i in love:
		i.show()

func start_game() :
	hud.show()
	game.hide()
	soal.nomor_soal = 0
	soal_terakhir = false
	skor_num = 0
	skor.text = str(skor_num)


func _on_SettingsButton_pressed():
	lobby_game.hide()
	settings.show()

func get_all_children(in_node,arr:=[]):
	arr.push_back(in_node)
	#for child in in_node.get_children():
		#arr = get_all_children(child,arr)
	arr = in_node.get_children()
	return arr



