% List of the people in the scenario
man(george).
man(john).
man(robert).
woman(barbara).
woman(christine).
woman(yolanda).

% List of the rooms
room(bathroom).
room(diningroom).
room(kitchen).
room(livingroom).
room(pantry).
room(study).

% List of the weapons
weapon(bag).
weapon(firearm).
weapon(gas).
weapon(knife).
weapon(poison).
weapon(rope).

% A suspect is either one of the men or women from the list above
suspect(X) :- man(X).
suspect(X) :- woman(X).

% Helper function to print the rooms and weapons of all the suspects
writevals(Bathroom, Diningroom, Kitchen, Livingroom, Pantry, Study, Bag, Firearm, Gas, Knife, Poison, Rope) :-
  
  % Print the location listings
  nl, write(" Locations "), nl,
  write("Bathroom: "), write(Bathroom), nl,
  write("Dining Room: "), write(Diningroom), nl,
  write("Kitchen: "), write(Kitchen), nl,
  write("Living Room: "), write(Livingroom), nl,
  write("Pantry: "), write(Pantry), nl,
  write("Study: "), write(Study), nl,

  % Print the weapon listings
  nl, write(" Weapons "), nl,
  write("Bag: "), write(Bag), nl,
  write("Firearm: "), write(Firearm), nl,
  write("Gas: "), write(Gas), nl,
  write("Knife: "), write(Knife), nl,
  write("Poison: "), write(Poison), nl,
  write("Rope: "), write(Rope), nl.

% Initialise the suspects such that all of them are unique
init_suspects(Suspect1, Suspect2, Suspect3, Suspect4, Suspect5, Suspect6) :-
  suspect(Suspect1), suspect(Suspect2), suspect(Suspect3), suspect(Suspect4), suspect(Suspect5), suspect(Suspect6),
  \+ Suspect1 = Suspect2, \+ Suspect1 = Suspect3, \+ Suspect1 = Suspect4, \+ Suspect1 = Suspect5, \+ Suspect1 = Suspect6,
  \+ Suspect2 = Suspect3, \+ Suspect2 = Suspect4, \+ Suspect2 = Suspect5, \+ Suspect2 = Suspect6,
  \+ Suspect3 = Suspect4, \+ Suspect3 = Suspect5, \+ Suspect3 = Suspect6,
  \+ Suspect4 = Suspect5, \+ Suspect4 = Suspect6,
  \+ Suspect5 = Suspect6.

% Find the murderer
murderer(X) :-
  % Initialise the scenario
  init_suspects(Bathroom, Diningroom, Kitchen, Livingroom, Pantry, Study),
  init_suspects(Bag, Firearm, Gas, Knife, Poison, Rope),
  
  % Clue 1
  % The suspect in the Kitchen is a Man.
  % Rope, Knife, Bag, and Firearm were not found in the Kitchen.
  man(Kitchen),
  \+ Kitchen = Rope, \+ Kitchen = Knife, \+ Kitchen = Bag, \+ Kitchen = Firearm,
  
  % Clue 2
  % The suspects in the Bathroom and Study are Women but not Christine
  % Barbara and Yolanda were not in Dining Room, Kitchen, Living Room, or Pantry
  woman(Study), woman(Bathroom), \+ Bathroom = christine, \+ Study = christine,
  \+ Diningroom = barbara, \+ Kitchen = barbara, \+ Livingroom = barbara, \+ Pantry = barbara,
  \+ Diningroom = yolanda, \+ Kitchen = yolanda, \+ Livingroom = yolanda, \+ Pantry = yolanda,

  % Clue 3
  % The Bag was not with Barbara or george
  % The suspect with the Bag was not in Bathroom or Dining Room
  \+ Bag = barbara, \+ Bag = george,
  \+ Bathroom = Bag, \+ Diningroom = Bag,

  % Clue 4
  % The suspect in the Study was a Woman
  % The suspect in the Study had a Rope
  woman(Study),
  Rope = Study,

  % Clue 5
  % The suspect in the Living Room was a Man but not Robert
  man(Livingroom), \+ Livingroom = robert,

  % Clue 6
  % The suspect in the Dining Room didn't have the Knife
  \+ Diningroom = Knife,

  % Clue 7
  % Yolanda was not in either the Pantry or the Study
  \+ Pantry = yolanda, \+ Study = yolanda,

  % Clue 8
  % George had the Firearm
  Firearm = george,

  % Clue 9
  % The suspect in the Pantry had the Gas
  % The suspect in the Pantry was the Murderer
  Pantry = Gas, Pantry = X,

  % Print the result
  write(X), write(" is the MURDERER"), nl,

  % Print the locations and weapons of the rest
  writevals(Bathroom, Diningroom, Kitchen, Livingroom, Pantry, Study, Bag, Firearm, Gas, Knife, Poison, Rope).
