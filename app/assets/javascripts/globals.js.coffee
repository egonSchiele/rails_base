root = exports ? this
root.values = (dict) ->
    values = []
    (values.push val for _, val of dict)
    values

root.keys = (dict) ->
    keys = []
    (keys.push key for key, _ of dict)
    keys
