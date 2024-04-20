extends Node

var client_player_name = ""
var client_peer: ENetMultiplayerPeer
var DEFAULT_PORT = 1705

var connected_players = {}

signal player_list_changed()


func host_game(new_player_name: String):
	self.client_player_name = new_player_name
	self.client_peer = ENetMultiplayerPeer.new()
	self.client_peer.create_server(DEFAULT_PORT)
	multiplayer.multiplayer_peer = client_peer

func add_player_to_existing_game(ip: String, new_player_name: String):
	self.client_player_name = new_player_name
	self.client_peer = ENetMultiplayerPeer.new()
	self.client_peer.create_client(ip, DEFAULT_PORT)
	multiplayer.multiplayer_peer = client_peer

@rpc("call_local")
func load_main_game():
	get_tree().change_scene_to_file("res://objects/main.tscn")
