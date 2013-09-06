food_type(edamer, cheese).
food_type(tuc, cracker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(jolt, soda).
food_type(yes,dessert).

flavor(dessert, sweet).
flavor(meat, savory).
flavor(cheese, savory).
flavor(soda, sweet).

food_flavor(X, Y) :- food_type(X, Z), flavor(Z, Y).
% vim: filetype=prolog
