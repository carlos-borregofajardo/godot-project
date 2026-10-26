extends Camera2D

@export var velocidad: float = 200.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.max_fps = 60

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += velocidad * delta
	position.y = $"../../Escenario/Player".position.y
