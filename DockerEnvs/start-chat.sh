#!/bin/bash
cd /home/llama
cp /home/chat_test.py /home/llama
chmod 777 chat_test.py 
# if <${model}=="7b-chat">; then <torchrun --nproc_per_node 1 chat_test.py --ckpt_dir llama-2-7b-chat/ --tokenizer_path tokenizer.model --max_seq_len 512 --max_batch_size 4>
# fi
if [ ${MODEL} = 7b-chat ]; then
    torchrun --nproc_per_node 1 chat_test.py --ckpt_dir llama-2-7b-chat/ --tokenizer_path tokenizer.model --max_seq_len ${LEN} --max_batch_size ${BAT}
elif [ ${MODEL} = 13b-chat ]; then
	torchrun --nproc_per_node 2 chat_test.py --ckpt_dir llama-2-13b-chat/ --tokenizer_path tokenizer.model --max_seq_len 2048 --max_batch_size 4
elif [ ${MODEL} = 30b-chat ]; then
	torchrun --nproc_per_node 8 chat_test.py --ckpt_dir llama-2-30b-chat/ --tokenizer_path tokenizer.model --max_seq_len 2048 --max_batch_size 4
else
    echo "Must specify a model type in [7b-chat;13b-chat;30b-chat]"
fi