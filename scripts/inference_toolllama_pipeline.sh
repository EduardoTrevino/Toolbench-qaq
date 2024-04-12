export CUDA_VISIBLE_DEVICES=0
export TOOLBENCH_KEY="1aMBZgCcW93wGjitn284Nu7ebHvRpLoEUO6YTFzQ5drXmxsVl0"
export OUTPUT_DIR="data/answer/toolllama_dfs"
export PYTHONPATH=./

mkdir $OUTPUT_DIR
python toolbench/inference/qa_pipeline.py \
    --tool_root_dir data/toolenv/tools/ \
    --model_path ToolLLaMA-2-7b-v2 \
    --max_observation_length 1024 \
    --observ_compress_method truncate \
    --method DFS_woFilter_w2 \
    --input_query_file data/instruction/inference_query_demo.json \
    --output_answer_file $OUTPUT_DIR \
    --toolbench_key $TOOLBENCH_KEY

