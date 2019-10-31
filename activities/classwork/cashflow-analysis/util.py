
class Flow(object):

    def __init__(self, amount,t):
        self.amount = amount
        self.t = t

    @property #el decorador convierte el metodo en un atributo, solo si recibe el self
    def negate(self):
        return Flow(-self.amount, self.t)

    def value_at(self, t, interest_rate):
        delta_t = t - self.t
        return self.amount * (1 + interest_rate) ** delta_t

    def present_value(self,interest_rate):
        return self.value_at(t=0, interest_rate=interest_rate)

    def sum(self, other, interest_rate):
        new_amount = self.amount + other.value_at(t = self.t, interest_rate = interest_rate)
        return Flow(new_amount, 0)

    def diff(self, other, interest_rate):
        return self.sum(other=other.negate, interest_rate=interest_rate)


if __name__ == "__main__":
    print("Running util as __main__")
#i = 0.2
#flow_a = Flow(amount=1000, t=3)
#flow_b = Flow(amount=1500, t=5)


#flow_a.amount #attribute
#flow_a.present_value() #method

