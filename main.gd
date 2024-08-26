extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var date = Time.get_datetime_dict_from_system()
	var month = date["month"]
	var year = date["year"]
	if month < 10:
		print(0,month)
	else: print(month)
	year += 4
	print(year)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
