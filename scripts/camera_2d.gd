extends Camera2D
@onready var game_manager: Node = %GameManager
@onready var label_vel_camara: Label = $"../../UI/CanvasLayer/LabelVel_Camara"

@export var velocidad: float = 200.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.max_fps = 60

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += velocidad * delta * (1.0 + game_manager.score * 0.15)
	position.y = $"../../Escenario/Player".position.y
	label_vel_camara.text = str(snapped(velocidad * delta * (1.0 + game_manager.score * 0.15), 0.01)) + " camera speed"
