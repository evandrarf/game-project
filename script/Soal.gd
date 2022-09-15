extends Node


onready var pertanyaan = $Pertanyaan
#onready var button = $Grid/HBoxContainer/Button
onready var asteroids = get_all_children($OpsiContainer)

const asteroids_position = [
	[Vector2(222, 695), Vector2(775, 570), Vector2(292,1214), Vector2(916, 1019)],
	[Vector2(301, 603), Vector2(685, 800), Vector2(204, 1147), Vector2(831, 1151)],
	[Vector2(760, 788), Vector2(256, 693), Vector2(272, 1121), Vector2(857, 1222)],
	[Vector2(926, 947), Vector2(609, 750), Vector2(404, 1132), Vector2(137, 800)],
	[Vector2(326, 1081), Vector2(171, 711), Vector2(674, 701), Vector2(856, 1019)],
	[Vector2(734, 1360), Vector2(932, 1024), Vector2(228, 1169), Vector2(311, 755)],
	[Vector2(173, 890), Vector2(684, 878), Vector2(360, 1294), Vector2(920, 1252)],
	[Vector2(920, 967), Vector2(384, 832), Vector2(771, 1247), Vector2(197, 1289)],
	[Vector2(821, 784), Vector2(921, 1367), Vector2(377, 1247), Vector2(153, 1021)],
	[Vector2(289, 1230), Vector2(218, 761), Vector2(829, 889), Vector2(937, 1296)],
	[Vector2(252, 865), Vector2(680, 751), Vector2(901, 1061), Vector2(611, 1309)],
]

var position_index = 0

func _start() :
	randomize()
	position_index = int(round(rand_range(0, 10)))
	

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
		"jawaban": 3,
	},
	{
		"pertanyaan": "Binatang yang bisa hidup di air dan di darat disebut ",
		"opsi" : ["Terestrial", "Amfibi","Akuatik", "Mamalia"],
		"jawaban": 1,
	},
	{
		"pertanyaan" : "Siapakah penemu listrik pertama kali?",
		"opsi" : ["Benjamin Franklin", "Willian Gilbert", "Thales", "Michael Faraday"],
		"jawaban": 2,
	},
	{
		"pertanyaan": "Yang merupakan rumus dari hukum newton II adalah?",
		"opsi": ["F=m.a", "∑F = 0", " w = m x g ", " Fg = u x N "],
		"jawaban": 0,
	},
	{
		"pertanyaan":"Bangsa pertama yang menjajah Indonesia adalah?",
		"opsi": ["Belanda","Inggris","Portugis","Spanyol"],
		"jawaban":2,
	},
	{
		"pertanyaan":"Negara terkecil di dunia adalah?",
		"opsi":["San Marino","Vatikan","Tuvalu","Nauru"],
		"jawaban":1,
	},
	{
		"pertanyaan": "Kerajaan indonesia yang pernah menguasai hampir seluruh kawasan asia tenggara adalah?",
		"opsi":["Kutai","Mataram","Sriwijaya","Majapahit"],
		"jawaban":3,
	},
	{
		"pertanyaan":"Perang Diponegoro terjadi selama 5 tahun, mulai tahun… sampai?",
		"opsi":["1815-1820","1789-1794", "1820-1825","1825-1830"],
		"jawaban":3,
	},
	{
		"pertanyaan":"Lagu Garuda Pancasila dikarang oleh?",
		"opsi":["Sudharnoto","Ismail Marzuki","Soepratman","Ibu soed"],
		"jawaban":0,
	},
	{
		"pertanyaan":"Lembaga yang berwenang melantik Presiden dan Wakil Presiden adalah?",
		"opsi":["DPR","MPR","MA","MK"],
		"jawaban":1,
	},
	{
		"pertanyaan": "Negara terkaya didunia untuk sekarang adalah?",
		"opsi":["Dubai","Qatar","China","Luksemburg"],
		"jawaban":3,
	}
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

	#{
	#	"pertanyaan":"Untuk membuat 5 potong kue, Letek membutuhkan telur ½ kg. Berapa telur yang dibutuhkan Letek jika ingin membuat 50 potong kue?",
	#	"opsi":["5kg","5.5kg","6kg","7kg"],
	#	"jawaban":0,
	#},
