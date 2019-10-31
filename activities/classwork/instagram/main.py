import fire
import logging

from util import *

logger = logging.getLogger(__name__)


class Main:

    @timeit(logger)
    @pretty_print(logger)
    def get_user_data(self, user_handle):
        return get_user_data(user_handle)

    @timeit(logger)
    @pretty_print(logger)
    def get_or_create(self, user_handle):
        return {}


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    fire.Fire(Main)
