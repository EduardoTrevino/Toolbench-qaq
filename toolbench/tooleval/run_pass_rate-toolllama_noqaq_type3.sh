export CONVERTED_ANSWER_PATH=../../model_predictions_converted/
export SAVE_PATH=pass_rate_results_toolllama_no_qaq_type3_v2
export CANDIDATE_MODEL=toolllama
export API_POOL_FILE=openai_key_json_file.json

python eval_pass_rate.py \
    --converted_answer_path ${CONVERTED_ANSWER_PATH} \
    --save_path ${SAVE_PATH} \
    --reference_model ${CANDIDATE_MODEL} \
    --test_ids ../../model_predictions_converted/toolllama/ \
    --max_eval_threads 20 \
    --evaluate_times 7
