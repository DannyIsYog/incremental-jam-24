extends Node

class_name wallet

@onready var silver_coins_text = $CoinWallet/SilverCoins
@onready var divine_coins_text = $CoinWallet/DivineCoins

@export var game_manager : GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	update_wallet()

func update_wallet():
	silver_coins_text.text = "[right]" + str(game_manager.silver_coins)
	divine_coins_text.text = "[right]" + str(game_manager.divine_coins)
