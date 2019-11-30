import fire

from util import Amortization


class Main(object):

    @staticmethod
    def future_value(present_value, interest, n):
        return present_value * (1 + interest) ** n

    @staticmethod
    def annuity(amount, interest, n):
        amortization = Amortization(amount,interest,n)
        return amortization.annuity()

    def table(self, amount, interest, n, rows=10, save=""):
        amortization = Amortization(amount, interest, n)
        df = amortization.get_table()
        print(df[:rows])
        if save:
            df.to_csv(save)

    def graph(self, amount, interest, n, save=""):
        amortization = Amortization(amount,interest,n)
        fig = amortization.get_plot()

if __name__ == "__main__":
    fire.Fire(Main)
