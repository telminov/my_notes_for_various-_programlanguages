import collections

Card = collections.namedtuple('Card', ['rank', 'suit'])


c = [1, 2, 3, 4, 5]

g = [x+123123 for x in c]
print(g)


class FrenchDeck:
    ranks = [str(n) for n in range(2, 11)] + list('JQKA')
    suits = 'spades diamonds clubs hearts'.split()

    def __init__(self):
        self._cards = [Card(rank, suit) for suit in self.suits
                                        for rank in self.ranks ]
        print(self._cards)
    # def __init__(self):
    #     self._cards = [Card(rank, suit) for rank in self.ranks
    #                                     for suit in self.suits]так сразу будет сортировано
    def __len__(self):
        return len(self._cards)

    def __getitem__(self, position):
        return self._cards[position]

    # т.к. класс итерируемый то там есть contains (in)

frenk_deck = FrenchDeck()
print(len(frenk_deck))
print(frenk_deck[3])


from random import choice
print(choice(frenk_deck))

print(Card(rank='3', suit='spades') in frenk_deck)


print()
suit_values = dict(spades=3, hearts=2, diamonds=1, clubs=0)
def spades_high(card):
    rank_value = FrenchDeck.ranks.index(card.rank)
    return rank_value * len(suit_values) + suit_values[card.suit]

for card in sorted(frenk_deck, key=spades_high): # doctest: +ELLIPSIS
    print(card)

