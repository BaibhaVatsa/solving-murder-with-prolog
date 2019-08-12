# Solving Murder with Prolog

My solution to the murder mystery of [Solving murder with Prolog by xmonader](https://xmonader.github.io/prolog/2018/12/21/solving-murder-prolog.html).

Wanted to try out Prolog so thought this would be a fun little way of doing that.

## The Puzzle

> Reproduced from the aforementioned website

To discover who killed Mr. Boddy, you need to learn where each person was, and what weapon was in the room. Clues are scattered throughout the quiz (you cannot solve question 1 until all 10 are read).

To begin, you need to know the suspects. There are three men (George, John, Robert) and three women (Barbara, Christine, Yolanda). Each person was in a different room (Bathroom, Dining Room, Kitchen, Living Room, Pantry, Study). A suspected weapon was found in each room (Bag, Firearm, Gas, Knife, Poison, Rope). Who was found in the kitchen?

* Clue 1: The man in the kitchen was not found with the rope, knife, or bag. Which weapon, then, which was not the firearm, was found in the kitchen?

* Clue 2: Barbara was either in the study or the bathroom; Yolanda was in the other. Which room was Barbara found in?

* Clue 3: The person with the bag, who was not Barbara nor George, was not in the bathroom nor the dining room. Who had the bag in the room with them?

* Clue 4: The woman with the rope was found in the study. Who had the rope?

* Clue 5: The weapon in the living room was found with either John or George. What weapon was in the living room?

* Clue 6: The knife was not in the dining room. So where was the knife?

* Clue 7: Yolanda was not with the weapon found in the study nor the pantry. What weapon was found with Yolanda?

* Clue 8: The firearm was in the room with George. In which room was the firearm found?

* Clue 9: It was discovered that Mr. Boddy was gassed in the pantry. The suspect found in that room was the murderer.

Who, then, do you point the finger towards?

## Running the code

```prolog
?- [solving_murder].
?- murderer(X).
```
