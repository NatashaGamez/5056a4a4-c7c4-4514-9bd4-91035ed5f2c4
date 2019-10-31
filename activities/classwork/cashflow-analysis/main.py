import fire
from util import Flow

class Main(object):

    def message(self, string):
        print(string)

    def present_value(self, amount, t, i):
        flow = Flow(amount,t)
        print("The present value of {amount} in time {t} is {pv}".format(amount=amount,t=t,pv=flow.present_value(interest_rate=i)))

if __name__ == "__main__":
    fire.Fire(Main)


