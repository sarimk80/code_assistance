from typing import Union

from fastapi import FastAPI
from ollama import chat

app = FastAPI()

@app.get("/translation/{text}")
def translate_text(text: str):
    messages = [
        {
            'role': 'user',
            'content': f'Translate this text {text} into English',
        },
        ]

    response = chat('llama3.2:3b', messages=messages)
    print(response['message']['content'])
    return {"translated_text": response['message']['content']}



@app.get("/email_reply/{text}")
def reply_email(text:str):
    messages = [
        {
            'role': 'user',
            'content': f'Reply to this email {text}',
        },
        ]
    response = chat('llama3.2:3b', messages=messages)
    print(response['message']['content'])
    return {"reply_email": response['message']['content']}


@app.get("/code_assistance/{text}")
def code_assistance(text:str):
    messages = [
        {
            'role': 'user',
            'content': f'Give the improve version of this code and also put some comments on it {text}',
        },
        ]
    response = chat('llama3.2:3b', messages=messages)
    print(response['message']['content'])
    return {"code_assistance": response['message']['content']}