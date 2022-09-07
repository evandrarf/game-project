extends Node


onready var pertanyaan = $Pertanyaan
#onready var button = $Grid/HBoxContainer/Button
onready var asteroids = get_all_children($OpsiContainer)

const asteroids_position = [
	[Vector2(803, 1009), Vector2(359, 1180), Vector2(337, 714), Vector2(735, 404)], 
	[Vector2(318, 1408), Vector2(804, 1080), Vector2(551, 774), Vector2(917, 558)],
	[Vector2(779, 1137), Vector2(323, 863), Vector2(895, 544), Vector2(197, 478)],
	[Vector2(305, 553), Vector2(781, 720), Vector2(350, 972), Vector2(758, 1280)],
	[Vector2(255, 713), Vector2(808, 571), Vector2(824, 1015), Vector2(283, 1361)],
	[Vector2(775, 570), Vector2(222, 695), Vector2(916, 1019), Vector2(295, 1313)],
	]

var position_index = 0

func _start() :
	position_index = int(round(rand_range(0, 7)))
	

func _process(delta):
	pertanyaan.text = soal[nomor_soal]["pertanyaan"]
	for i in len(asteroids):
		var label = asteroids[i].get_node("Label")
		label.text = soal[nomor_soal]["opsi"][i]
		asteroids[i].position = asteroids_position[position_index][i]

#print(button.text)

var nomor_soal = 0

var soal = [
	{
		"pertanyaan": "Danau terbesar di dunia adalah",
		"opsi": ["Kaspia", "Toba", "Malawi", "Victoria"],
		"jawaban": 0,
	},
	{
		"pertanyaan": "Candi Borubur merupakan candi agama?",
		"opsi": ["Hindhu", "Konghuchu", "Katholik", "Buddha"],
		"jawaban": 3,
	}, 
	{
		"pertanyaan": "Monumen terkenal di kota Paris adalah menara?",
		"opsi" : ["Monas", "Pisa","Shanghai", "Eiffel"],
		"jawaban": 3
	},{
		"pertanyaan": "Pusat peredaran tata surya adalah",
		"opsi": ["Matahari", "Bumi", "Pluto", "Venus"],
		"jawaban": 0,
	},
	{
		"pertanyaan": "Planet yang indah karena mempunyai cincin dinamakan dengan planet",
		"opsi": ["Mars", "Jupiter", "Saturnus", "Uranus"],
		"jawaban": 2,
	}, 
	{
		"pertanyaan": "Planet yang dijuluki bintang kejora yaitu",
		"opsi" : ["Merkurius", "Venus","Mars", "Jupiter"],
		"jawaban": 1
	},{
		"pertanyaan": "Kemampuan suatu benda untuk melakukan kerja dinamakan",
		"opsi": ["Elektron", "Energi", "Elektronik", "Elektrolit"],
		"jawaban": 1,
	},
	{
		"pertanyaan": "Gerakan planet yang mengelilingi matahari dinamakan",
		"opsi": ["Rotasi", "Orbit", "Revolusi", "Karbit"],
		"jawaban": 2,
	}, 
	{
		"pertanyaan": "Mata uang negara Malaysia yaitu ",
		"opsi" : ["Rupiah", "Dollar","Yen", "Ringgit"],
		"jawaban": 3
	},
	]


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

