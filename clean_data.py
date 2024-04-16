import json

# File paths
input_filename = 'G1_tool.json'
output_filename = 'G1_tool_type3_no_qaq.json'

# Load JSON data from a file
with open(input_filename, 'r') as file:
    data = json.load(file)

# IDs to keep
ids_to_keep = {692, 2513, 5695, 8129, 13495, 14198}

# Filter the data to keep only entries with specified query_id
filtered_data = [entry for entry in data if entry['query_id'] in ids_to_keep]

# Convert the filtered data back to JSON
filtered_json = json.dumps(filtered_data, indent=4)  # Pretty print the JSON

# Save to a new file
with open(output_filename, 'w') as f:
    f.write(filtered_json)

# Optionally, print confirmation or any other details
print(f"Filtered data saved to {output_filename}")
