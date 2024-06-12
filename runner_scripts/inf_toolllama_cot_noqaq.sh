export CUDA_VISIBLE_DEVICES=0,1,2,3
export RAPIDAPI_KEY=$(cat rapidapi.txt)
export OUTPUT_DIR="outputs/G1_category_type1_no_qaq_v2_toolllama"
export PYTHONPATH=./

mkdir $OUTPUT_DIR
python toolbench/inference/qa_pipeline.py \
    --tool_root_dir data/toolenv/tools/ \
    --backbone_model toolllama \
    --model_path toolllama-2 \
    --max_observation_length 1024 \
    --observ_compress_method truncate \
    --method CoT@3 \
    --input_query_file cleanedData/v2/G1_category_type1_no_qaq_v2.json \
    --output_answer_file $OUTPUT_DIR \
    --rapidapi_key $RAPIDAPI_KEY \
    --use_rapidapi_key
