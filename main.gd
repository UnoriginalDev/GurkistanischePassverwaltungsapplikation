extends Node2D

#AusfüllbareFelder
@onready var name_2: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/Name2
@onready var b_name: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/BName
@onready var firstname: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/Vorname
@onready var bday_3: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/Bday3
@onready var place_birth: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/PlaceBirth
@onready var eyecolour: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/Eyecolour
@onready var height: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/Height
@onready var autho: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/Autho
@onready var adress: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/Adress
@onready var weirdname: TextEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/Ordensname
@onready var street: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/Street
@onready var hausnummer: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/Hausnummer
@onready var city: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/City
@onready var plz: LineEdit = $CanvasLayer/Control/TabContainer/TabBar/MarginContainer/ScrollContainer/GridContainer/PLZ

#RecievingFields
@onready var vorname: Label = $"CanvasLayer/Control/TabContainer/TabBar2/MarginContainer/VBoxContainer/Blaupause-für-den-personalausweis-von-gurkistan-v0-8Ouoxhq1Bued1/Vorname"
@onready var geburtstag: Label = $"CanvasLayer/Control/TabContainer/TabBar2/MarginContainer/VBoxContainer/Blaupause-für-den-personalausweis-von-gurkistan-v0-8Ouoxhq1Bued1/Geburtstag"
@onready var geburtsort: Label = $"CanvasLayer/Control/TabContainer/TabBar2/MarginContainer/VBoxContainer/Blaupause-für-den-personalausweis-von-gurkistan-v0-8Ouoxhq1Bued1/Geburtsort"
@onready var expiry: Label = $"CanvasLayer/Control/TabContainer/TabBar2/MarginContainer/VBoxContainer/Blaupause-für-den-personalausweis-von-gurkistan-v0-8Ouoxhq1Bued1/Expiry"
@onready var labelname: Label = $"CanvasLayer/Control/TabContainer/TabBar2/MarginContainer/VBoxContainer/Blaupause-für-den-personalausweis-von-gurkistan-v0-8Ouoxhq1Bued1/Name"
@onready var geb_name: Label = $"CanvasLayer/Control/TabContainer/TabBar2/MarginContainer/VBoxContainer/Blaupause-für-den-personalausweis-von-gurkistan-v0-8Ouoxhq1Bued1/GebName"
@onready var augenfarbe: Label = $"CanvasLayer/Control/TabContainer/TabBar2/MarginContainer/VBoxContainer/Blaupause-für-den-personalausweis-von-gurkistan-v0-trjopw83Bued1/Augenfarbe"
@onready var grose: Label = $"CanvasLayer/Control/TabContainer/TabBar2/MarginContainer/VBoxContainer/Blaupause-für-den-personalausweis-von-gurkistan-v0-trjopw83Bued1/Größe"
@onready var datum: Label = $"CanvasLayer/Control/TabContainer/TabBar2/MarginContainer/VBoxContainer/Blaupause-für-den-personalausweis-von-gurkistan-v0-trjopw83Bued1/Datum"
@onready var ordensname: Label = $"CanvasLayer/Control/TabContainer/TabBar2/MarginContainer/VBoxContainer/Blaupause-für-den-personalausweis-von-gurkistan-v0-trjopw83Bued1/Ordensname"
@onready var anschrift: Label = $"CanvasLayer/Control/TabContainer/TabBar2/MarginContainer/VBoxContainer/Blaupause-für-den-personalausweis-von-gurkistan-v0-trjopw83Bued1/Anschrift"

@onready var random_numbers_and_characters: Label = $"CanvasLayer/Control/TabContainer/TabBar2/MarginContainer/VBoxContainer/Blaupause-für-den-personalausweis-von-gurkistan-v0-8Ouoxhq1Bued1/RandomNumbersAndCharacters"

@onready var tab_container: TabContainer = $CanvasLayer/Control/TabContainer

var letter_array = ["Q", "W", "E", "R", "T", "Z", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Y", "X", "C", "V", "B", "N", "M"]
var upper_identification : Array
var upper_id_str : String

var month_value
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for i in range(9):
		i+=1
		var decide = randi_range(0,1)
		if decide == 1:
			upper_identification.append(letter_array.pick_random())
		else: upper_identification.append(randi_range(1,9))
	
	tab_container.set_current_tab(0)
	var date = Time.get_datetime_dict_from_system()
	var day = date["day"]
	var month = date["month"]
	var year = date["year"]
	if day < 10:
		day = "0%s" % [day]
	if month < 10:
		month_value = "0%s" % [month]
		print(month_value)
	else: month_value = month
	datum.text = "%s.%s.%s" % [day, month_value, year]
	year += 6
	print(year)
	expiry.text = "%s.%s.%s" % [day, month_value, year]
#	expiry_label.text = "%s.%s.%s" % [day, month_value, year]
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _on_button_pressed() -> void:
	tab_container.set_current_tab(1)
	generate()

func generate() -> void:
	vorname.text = firstname.text
	geb_name.text = b_name.text
	labelname.text = name_2.text
	geburtstag.text = bday_3.text
	geburtsort.text = place_birth.text
	grose.text = height.text
	augenfarbe.text = eyecolour.text
	ordensname.text = weirdname.text
	anschrift.text = "%s %s\n%s\n%s\n" % [street.text, hausnummer.text, city.text, plz.text]
	upper_id_str = array_to_string(upper_identification)
	random_numbers_and_characters.text = upper_id_str

func _on_tab_container_tab_changed(tab: int) -> void:
	if tab == 1:
		generate()


func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += str(i)
	return s
