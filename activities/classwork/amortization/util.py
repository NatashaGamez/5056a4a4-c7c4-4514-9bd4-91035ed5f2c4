import pandas as pd
import matplotlib.pyplot as plt


class Amortization(object):

    def __init__(self, amount, interest, n):
        self.amount = amount
        self.interest = interest
        self.n = n
    @property
    def annuity(self):
        return self.interest * self.amount / (1 - ( 1 + self.interest) ** self.n)

    def get_table(self):
        """Create a pandas dataframe representing the amortization table."""
        rows = []
        loan_value = self.amount
        payment = self.annuity
        for i in range(self.n):
            interest_value = loan_value * self.interest
            principal = payment - interest_value
            loan_value = loan_value - principal
            rows.append({
                "interest": interest_value,
                "payment":  payment,
                "principal":principal,
                "loan_value": loan_value
            })
        return pd.DataFrame(rows).rename_axis("period").reset_index()

    def get_plot(self):
        """Create a plot (fig) to visualize at least two variables from the amortization table."""
        df = self.get_table()
        plot = df.plot.bar(x="period", y=["principal","interest"], stacked=True)
        fig = plot.get_figure()
        plt.show()
        return fig

