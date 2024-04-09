import json

#specify the path to your JSON configuration file
config_file_path = "config.json"

#load with JSON configuration file
with open(config_file_path, 'r') as config_file:
    config = json.load(config_file)

#print the configuration
Connection_STRING = config["connectionString"]
