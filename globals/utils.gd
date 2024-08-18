extends Node

# Utility function that returns a random enum type based on a weights dictionary
func get_random_enum_weighted(enum_type, weights_dictionary: Dictionary):
	var sum_of_weights: int = 0
	
	# Calculate the sum of all weights
	for val in enum_type.values():
		sum_of_weights += weights_dictionary[val]
		
	# Pick a random number that is 0 or greater and is less than
	# the sum of the weights
	var rnd: int = randi() % sum_of_weights
	
	# Go through the items one at a time,
	# subtracting their weight from your random number,
	# until you get the item where the random number is less
	# than that item's weight
	for val in enum_type.values():
		if rnd < weights_dictionary[val]:
			return val
			
		rnd -= weights_dictionary[val]
