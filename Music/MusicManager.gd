extends Node2D

@export var fase1 : AudioStreamWAV
@export var fase2 : AudioStreamWAV
@export var fase3 : AudioStreamWAV
@export var fase4 : AudioStreamWAV
@export var fase5 : AudioStreamWAV
@export var fase6 : AudioStreamWAV
@export var fase7 : AudioStreamWAV
@export var fase8 : AudioStreamWAV
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@export var tower : Tower

var andar = 0
	
func _ready():
	#play fase 1
	audio_stream_player_2d.stream = fase1
	audio_stream_player_2d.play()
	tower.floorChange.connect(update_song)
	pass

func update_song():
	var andar = tower.floors_instances.size()
	print("Update song!", andar)
	if andar <= 12:
		change_song_to(fase1) #talvez tenha colocar a linha 18 aqui
	if 12 < andar && andar <= 24:
		change_song_to(fase2)
	if 24 < andar && andar <= 36:
		change_song_to(fase3)
	if 36 < andar && andar <= 48:
		change_song_to(fase4)
	if 48 < andar && andar <= 60:
		change_song_to(fase5)
	if 60 < andar && andar <= 72:
		change_song_to(fase6)
	if 72 < andar && andar <= 85:
		change_song_to(fase7)
	if 85 < andar && andar <= 100:
		change_song_to(fase8)

func change_song_to(song):
	if audio_stream_player_2d.stream != song:
		audio_stream_player_2d.stream = song
		audio_stream_player_2d.play()
		

