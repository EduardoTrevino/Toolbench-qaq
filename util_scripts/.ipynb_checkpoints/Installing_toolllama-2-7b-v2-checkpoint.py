from transformers import AutoModelForCausalLM, AutoTokenizer

model_name = "ToolBench/ToolLLaMA-2-7b-v2"

# Define the model and tokenizer
model = AutoModelForCausalLM.from_pretrained(model_name)
tokenizer = AutoTokenizer.from_pretrained(model_name)

# Save the model and tokenizer to a specified directory
model_directory = 'toolllama-2/model'
tokenizer_directory = 'toolllama-2/tokenizer'
model.save_pretrained(model_directory)
tokenizer.save_pretrained(tokenizer_directory)