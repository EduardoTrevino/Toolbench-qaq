export CUDA_VISIBLE_DEVICES=0,1,2,3
export RAPIDAPI_KEY=$(cat rapidapi.txt)
export OUTPUT_DIR="outputs/A_G3_instruction_toolllama-2"
export PYTHONPATH=./

mkdir $OUTPUT_DIR
python toolbench/inference/qa_pipeline.py \
    --tool_root_dir data/toolenv/tools/ \
    --backbone_model toolllama \
    --model_path toolllama-2 \
    --max_observation_length 1024 \
    --observ_compress_method truncate \
    --method CoT@1 \
    --input_query_file data/instruction/G3_instruction.json \
    --output_answer_file $OUTPUT_DIR \
    --rapidapi_key $RAPIDAPI_KEY \
    --use_rapidapi_key
