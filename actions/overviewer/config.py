worlds["This Land"] = "/github/workspace/world"
outputdir = "/github/workspace/render"
texturepath = "/github/workspace/client.jar"

def playerSpawn(poi):
    if poi['id'] == 'PlayerSpawn':
        poi['icon'] = "https://overviewer.org/avatar/%s" % poi['EntityId']
        return "%s's spawn point" % poi['EntityId']

markers = [
    dict(name="Spawn Points", filterFunction=playerSpawn),
]

renders["day"] = {
    'world': 'This Land',
    'title': 'Day',
    'rendermode': 'smooth_lighting',
    "dimension": "overworld",
    'markers': markers
}

renders["night"] = {
    'world': 'This Land',
    'title': 'Night',
    'rendermode': 'smooth_night',
    "dimension": "overworld",
    'markers': markers
}

