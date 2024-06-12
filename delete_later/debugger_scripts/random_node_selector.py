import json
import random

# Specify the path to your JSON file
json_file_path = 'G1_instruction.json'

# Path to the new JSON file where the selected nodes will be saved
output_file_path = 'G1_instruction_type5_no_qaq.json'

# List of query_ids to exclude from selection
excluded_query_ids = [1236, 12642, 12688, 18302, 26661, 84908]

# Load the JSON data from the file
with open(json_file_path, 'r') as file:
    data = json.load(file)

# Filter the data to exclude the specified query_ids
filtered_data = [node for node in data if node["query_id"] not in excluded_query_ids]

# Check if there are enough nodes left to select from
if len(filtered_data) < 6:
    print("Not enough nodes to select from after excluding specific query_ids.")
else:
    # Randomly select six nodes
    selected_nodes = random.sample(filtered_data, 6)

    # Save the selected nodes to a new JSON file
    with open(output_file_path, 'w') as output_file:
        json.dump(selected_nodes, output_file, indent=4)

    print(f"Selected nodes have been saved to {output_file_path}")