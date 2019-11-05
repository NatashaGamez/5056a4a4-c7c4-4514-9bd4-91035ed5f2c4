<<<<<<< HEAD
import logging
import json
import fire

from model import SIC
from util import StringWrapper, pretty_print, timeit


URL = "https://www.osha.gov/pls/imis/sic_manual.html"
DEFAULT_INDUSTRY_FILE = "industries.json"

logger = logging.getLogger(_name_)


class Main(object):

    def _recursive_search(self, node, string_wrapper, exact):
        title = node["title"]
        children = node["children"]
        new_children = []
        for child in children:
            is_child_valid = self._recursive_search(child, string_wrapper, exact=exact)
            if is_child_valid:
                new_children.append(child)
        node["children"] = new_children
        successful_search = len(new_children) or string_wrapper.boolean_search(title, reverse=True, exact=exact)
        return successful_search


    @staticmethod
    @timeit(logger)
    def download(filename=DEFAULT_INDUSTRY_FILE):
        logger.info("Starting download procedure...")
        sic = SIC.from_url(URL)
        with open(filename, "w") as file: #w=para escribir
            file.write(sic.jsonify())

    @timeit(logger)
    @pretty_print(logger)
    def search(self, title, exact=False, filename=DEFAULT_INDUSTRY_FILE):
        target_title = StringWrapper(value=title)
        sic_industries = SIC.load_json(filename)
        children = sic_industries["children"]
        new_children = []
        for child in children:
            if self._recursive_search(child, target_title, exact=exact):
                new_children.append(child)
        return new_children


if _name_ == "_main_":
    logging.basicConfig(level=logging.INFO)
    fire.Fire(Main)
=======

import functools
import json
import time

from difflib import SequenceMatcher

def pretty_print(logger, serializer_function=lambda obj:obj.__dict__):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args,**kwargs):
            serializer_obj = func(*args,**kwargs)
            try:
                formatted_output = json.dumps(serializer_obj, indent=4,default=serializer_function)
                print(formatted_output)
            except TypeError as e:
                logger.error("Type error encounter with message {}".format(e))
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


class StringWrapper(object):
    DEFAULT_THRESHOLD = 0.5

    class Decorators:
        @staticmethod
        def sensitivity_matching_meta_decorator():
            def decorator(func):
                @functools.wraps(func)
                def wrapper(self, pattern, *args, **kwargs):
                    pattern = self._sensitivity_matching(string=pattern)
                    return func(self, pattern, *args, **kwargs)
                return wrapper
            return decorator

    def __init__(self, value, case_sensitive=False, default_similarity_threshold=DEFAULT_THRESHOLD):
        self.default_similarity_threshold = default_similarity_threshold
        self.case_sensitive = case_sensitive
        self._value = value

    def _sensitivity_matching(self, string):
        return string if self.case_sensitive else string.lower()

    @property
    def value(self):
        return self._sensitivity_matching(self._value)
    @Decorators.sensitivity_matching_meta_decorator()
    def contains(self, pattern, reverse = False):
        return (pattern in self.value) if not reverse else (self.value in pattern)

    @Decorators.sensitivity_matching_meta_decorator()
    def similarity_ratio(self, pattern):
        return SequenceMatcher(None, self.value, pattern).ratio()

    def similar_enough(self,pattern,threshold=None):
        min_ratio = threshold if threshold is not None else self.default_similarity_threshold
        return self.similarity_ratio(pattern) > min_ratio

    def boolean_search(self, pattern, exact=False, threshold=None, reverse=False):
        return self.contains(pattern, reverse=reverse) if exact else self.similar_enough(pattern,threshold=threshold)
>>>>>>> master
