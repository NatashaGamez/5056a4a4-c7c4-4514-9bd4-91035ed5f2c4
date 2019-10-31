import time
import json
import functools
import requests

from bs4 import BeautifulSoup

INSTAGRAM_URL = 'https://www.instagram.com/'


def pretty_print(logger, serializer_function=lambda obj: obj.__dict__):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            serializable_obj = func(*args, **kwargs)
            try:
                formatted_output = json.dumps(serializable_obj, indent=4, default=serializer_function)
                print(formatted_output)
            except TypeError as e:
                logger.error("Type error encounter with message {}". format(e))
                raise
        return wrapper
    return decorator


def timeit(logger):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            start = time.time()
            output = func(*args, **kwargs)
            logger.info("[Execution time (seconds)][%s]" % (time.time() - start))
            return output
        return wrapper
    return decorator


def parse_raw_string(content):
    pass


def get_public_data(user_url):
    pass


def get_user_data(user_handle):
    pass


def get_or_create(user_handle):
    pass
