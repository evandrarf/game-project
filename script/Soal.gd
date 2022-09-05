extends Node


onready var pertanyaan = $Pertanyaan
#onready var button = $Grid/HBoxContainer/Button
onready var asteroids = get_all_children($OpsiContainer)

func _ready():
	pertanyaan.text = soal[nomor_soal]["pertanyaan"]
	print(asteroids)
	for i in len(asteroids):
		var label = asteroids[i].get_node("Label")
		label.text = soal[nomor_soal]["opsi"][i]
	
	
#print(button.text)

var nomor_soal = 0

var soal = [{
	"pertanyaan": "Siapakah pacarnya rahma?",
	"opsi": ["Ello", "Panji", "Evan", "Faqih"],
	"jawaban": 1,
}]


#func _on_pressed(index_pilihan):
#	if(index_pilihan == soal[nomor_soal]["jawaban"]):
#		print("Benar")

func get_all_children(in_node,arr:=[]):
	arr.push_back(in_node)
	#for child in in_node.get_children():
		#arr = get_all_children(child,arr)
	arr = in_node.get_children()
	return arr

#const OptionButton = preload("res://scene/Button.tscn")
#const BoxContainer = preload("res://scene/HBoxContainer.tscn")


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pertanyaan.text = soal[nomorSoal]["pertanyaan"]
#	for i in soal[nomorSoal]["opsi"]:
#		generate_button(i)


#func generate_button(text):
#	var opsiButton = OptionButton.instance()
#	var boxContainer = BoxContainer.instance()
#	opsiButton.text = text
#	boxContainer.add_child(opsiButton)
#	opsiButton.connect("pressed", self, "_on_pressed")
#	grid.add_child(boxContainer)


func _on_Asteroid_area_entered(area, index):
	print(index)
	if(index == soal[nomor_soal]["jawaban"]):
		print("Jawaban anda benar")
		print("Pacarnya Rahma adalah ", soal[nomor_soal]["opsi"][index])
		#print(soal[nomor_soal]["pertanyaan"], " adalah ", soal[nomor_soal]["opsi"][index])
	else:
		print("Jawaban anda salah")
