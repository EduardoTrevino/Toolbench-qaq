export RAW_ANSWER_PATH=../../outputs/toolllama-2_no_qaq_G1_category_type3/
export CONVERTED_ANSWER_PATH=../../model_predictions_converted/
export MODEL_NAME=toolllama
export METHOD=DFS
mkdir ${CONVERTED_ANSWER_PATH}/${MODEL_NAME}

for test_set in G1_category_no_qaq_type3
do
    answer_dir=${RAW_ANSWER_PATH}/${MODEL_NAME}/${test_set}
    output_file=${CONVERTED_ANSWER_PATH}/${MODEL_NAME}/${test_set}.json
    
    python convert_to_answer_format.py\
        --answer_dir ${answer_dir} \
        --method ${METHOD} \
        --output ${output_file}
done
