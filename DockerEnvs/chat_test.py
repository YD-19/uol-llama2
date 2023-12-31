# Copyright (c) Meta Platforms, Inc. and affiliates.
# This software may be used and distributed according to the terms of the Llama 2 Community License Agreement.

from typing import Optional

import fire

from llama import Llama


def main(
    ckpt_dir: str,
    tokenizer_path: str,
    temperature: float = 0.6,
    top_p: float = 0.9,
    max_seq_len: int = 512,
    max_batch_size: int = 4,
    max_gen_len: Optional[int] = None,
):
    generator = Llama.build(
        ckpt_dir=ckpt_dir,
        tokenizer_path=tokenizer_path,
        max_seq_len=max_seq_len,
        max_batch_size=max_batch_size,
    )

    temp_dialogs = []
    while True:
        input1 = input("> Input your context: ")
        temp_dialogs.append({"role": "user", "content": input1})
        dialogs = [temp_dialogs]
        results = generator.chat_completion(
            dialogs,  # type: ignore
            max_gen_len=max_gen_len,
            temperature=temperature,
            top_p=top_p,
        )

        for dialog, result in zip(dialogs, results):
            # for msg in dialog:
            #     print(f"{msg['role'].capitalize()}: {msg['content']}\n")
            print(
                f"> {result['generation']['role'].capitalize()}: {result['generation']['content']}"
            )
            # Append model's response to the dialog history
            temp_dialogs.append(result['generation'])
            print("\n==================================\n")
        # for dialog, result in zip(dialogs, results):
        #     for msg in dialog:
        #         print(f"{msg['role'].capitalize()}: {msg['content']}\n")
        #     print(
        #         f"> {result['generation']['role'].capitalize()}: {result['generation']['content']}"
        #     )
        #     print("\n==================================\n")


if __name__ == "__main__":
    fire.Fire(main)


# import torch
# from llama import Llama
# from typing import Optional
# import fire

# def main(
#     ckpt_dir: str,
#     tokenizer_path: str,
#     temperature: float = 1,
#     top_p: float = 1,
#     max_seq_len: int = 5000,
#     max_batch_size: int = 5,
#     max_gen_len: Optional[int] = None,
# ):
#     generator = Llama.build(
#         ckpt_dir=ckpt_dir,
#         tokenizer_path=tokenizer_path,
#         max_seq_len=max_seq_len,
#         max_batch_size=max_batch_size,
#     )
    
#     dialog_history = []

#     while True:  # Loop forever
#         # Accept user input from the terminal
#         user_input = input("chat prompt (or 'exit' to quit): ")

#         # If the user types 'exit', break the loop
#         if user_input.lower() == 'exit':
#             break

#         # Append user input to the dialog history
#         dialog_history.append({"role": "user", "content": user_input})

#         # Use the entire dialog history as the context for the model
#         dialogs = [dialog_history]
        
#         results = generator.chat_completion(
#             dialogs,  
#             max_gen_len=max_gen_len,
#             temperature=temperature,
#             top_p=top_p,
#         )

#         for result in results:
#             print(f"User: {user_input}n")
#             print(
#                 f"> Assistant: {result['generation']['content']}"
#             )
#             # Append model's response to the dialog history
#             dialog_history.append(result['generation'])

#             print("n==================================n")

# if __name__ == "__main__":
#     fire.Fire(main)