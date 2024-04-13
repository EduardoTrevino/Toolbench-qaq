export RAPIDAPI_KEY=$(cat rapidapi.txt)
export OUTPUT_DIR="outputs/chatgpt_dfs_qaq_v.0.0.0.1"
export OPENAI_KEY=$(cat openai.txt)
export PYTHONPATH=./

mkdir $OUTPUT_DIR
python toolbench/inference/qa_pipeline.py \
    --tool_root_dir data_example/toolenv/tools/ \
    --backbone_model chatgpt_function \
    --openai_key $OPENAI_KEY \
    --max_observation_length 1024 \
    --method DFS_woFilter_w2 \
    --input_query_file data_example/instruction/QAQ_inference_query_demo.json \
    --output_answer_file $OUTPUT_DIR \
    --rapidapi_key $RAPIDAPI_KEY \
    --use_rapidapi_key

