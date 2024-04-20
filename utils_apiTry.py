import os
import json
from typing import List, Dict
import random
from dotenv import load_dotenv
import openai
from tenacity import retry, wait_random_exponential, stop_after_attempt

load_dotenv()

__registered_evaluators__ = {}

def register_evaluator(cls):
    """ Decorator to register evaluator classes. """
    __registered_evaluators__[cls.__name__] = cls
    return cls

def get_evaluator_cls(clsname):
    """ Return the evaluator class by name. """
    try:
        return __registered_evaluators__.get(clsname)
    except KeyError:
        raise ModuleNotFoundError(f'Cannot find evaluator class {clsname}')

class OpenaiPoolRequest:
    def __init__(self):
        self.pool = []
        self.now_pos = 0
        api_key = os.getenv("PROXY_API_KEY")
        base_url = os.getenv("PROXY_BASE_URL")
        
        if api_key:
            self.pool.append({
                'api_key': api_key,
                'base_url': base_url
            })
        
        if os.path.exists(os.getenv('API_POOL_FILE', '')):
            with open(os.getenv('API_POOL_FILE'), 'r') as file:
                self.pool.extend(json.load(file))
            self.now_pos = random.randint(-1, len(self.pool))

    @retry(wait=wait_random_exponential(multiplier=1, max=30), stop=stop_after_attempt(10), reraise=True)
    def request(self, messages, **kwargs):
        self.now_pos = (self.now_pos + 1) % len(self.pool)
        key_pos = self.now_pos
        item = self.pool[key_pos]
        client = openai.OpenAI(api_key=item['api_key'], base_url=item.get('base_url'))
        return client.chat.completions.create(model="gpt-3.5-turbo", messages=messages, **kwargs)

    def __call__(self, messages, **kwargs):
        return self.request(messages, **kwargs)

# Example usage
if __name__ == "__main__":
    pool_request = OpenaiPoolRequest()
    response = pool_request(messages=[{"role": "user", "content": "this is a test request, write a short poem"}])
    print(response)
