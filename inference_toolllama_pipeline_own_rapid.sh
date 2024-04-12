export CUDA_VISIBLE_DEVICES=0
export RAPIDAPI_KEY=$(cat rapidapi.txt)
export OUTPUT_DIR="outputs/toolllama-2_qaq_v.0.0.0.9"
export PYTHONPATH=./

mkdir $OUTPUT_DIR
python toolbench/inference/qa_pipeline.py \
    --tool_root_dir data_example/toolenv/tools/ \
    --backbone_model toolllama \
    --model_path toolllama-2 \
    --max_observation_length 1024 \
    --observ_compress_method truncate \
    --method DFS_woFilter_w2 \
    --input_query_file data_example/instruction/QAQ_inference_query_demo.json \
    --output_answer_file $OUTPUT_DIR \
    --rapidapi_key $RAPIDAPI_KEY \
    --use_rapidapi_key

