#!/bin/bash
cd /home/llama
cp /home/chat_test.py /home/llama
chmod 777 chat_test.py 
torchrun --nproc_per_node 1 chat_test.py --ckpt_dir llama-2-7b-chat/ --tokenizer_path tokenizer.model --max_seq_len 512 --max_batch_size 4
