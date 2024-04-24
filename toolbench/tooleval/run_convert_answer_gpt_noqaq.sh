export RAW_ANSWER_PATH=../../outputs
export CONVERTED_ANSWER_PATH=../../model_predictions_converted
export MODEL_NAME=GPT4_NO_QAQ
export METHOD=CoT
mkdir -p ${CONVERTED_ANSWER_PATH}/${MODEL_NAME}


for test_set in G1_category_type1_no_qaq_v2_chatgpt4 \
                G1_category_type2_no_qaq_v2_chatgpt4 \
                G1_category_type3_no_qaq_v2_chatgpt4 \
                G1_category_type4_no_qaq_v2_chatgpt4 \
                G1_instruction_type1_no_qaq_v2_chatgpt4 \
                G1_instruction_type2_no_qaq_v2_chatgpt4 \
                G1_instruction_type3_no_qaq_v2_chatgpt4 \
                G1_instruction_type4_no_qaq_v2_chatgpt4 \
                G1_tool_type1_no_qaq_v2_chatgpt4 \
                G1_tool_type2_no_qaq_v2_chatgpt4 \
                G1_tool_type3_no_qaq_v2_chatgpt4 \
                G1_tool_type4_no_qaq_v2_chatgpt4

do
    answer_dir=${RAW_ANSWER_PATH}/${test_set}
    output_file=${CONVERTED_ANSWER_PATH}/${MODEL_NAME}/${test_set}.json
    
    python convert_to_answer_format.py\
        --answer_dir ${answer_dir} \
        --method ${METHOD} \
        --output ${output_file}
done
