export CUDA_VISIBLE_DEVICES=0
export RAPIDAPI_KEY=$(cat rapidapi.txt)
export OUTPUT_DIR="outputs/toolllama-2_no_qaq_G3_instruction_type3/toolllama/G3_instruction_no_qaq_type3"
export PYTHONPATH=./

mkdir $OUTPUT_DIR
python toolbench/inference/qa_pipeline.py \
    --tool_root_dir data/toolenv/tools/ \
    --backbone_model toolllama \
    --model_path toolllama-2 \
    --max_observation_length 1024 \
    --obse --method DFS_woFilter_w2 \
    --input_query_file data/instruction/G3_instruction_type3_no_qaq.json \
    --output_answer_file $OUTPUT_DIR \
    --rv_compress_method truncate \
   rapidapi_key $RAPIDAPI_KEY \
    --use_rapidapi_key

