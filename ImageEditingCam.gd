extends Camera2D

var mouse_vector: Vector2
@export var zoom_speed := Vector2(0.08, 0.08)
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("LMB") and event is InputEventMouseMotion:
		mouse_vector = event.relative
		self.global_position -= mouse_vector
	if event is InputEventMouseButton \
			and event.is_pressed() \
			and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		zoom -= zoom_speed
	if event is InputEventMouseButton \
			and event.is_pressed() \
			and event.button_index == MOUSE_BUTTON_WHEEL_UP:
		zoom += zoom_speed
