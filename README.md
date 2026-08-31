# Insomnia pizza:

## What is this project:
Insomnia pizza is a small pizza delivery game, with a rather dark and uncanny atmossphere. It was originally planned to be somewhat between a horror and a cozy game, however, he project was not developed to its full original goal. You play a new pizza delivery driver, who tries to deliver all pizzas as fast as possible.

## How was it made:
The project was made using godot 4.6.3.stable and should be edited using that version. If you want to export the project you also can do that using that version.

## Playing:
Binaries of the game can be found in the releases tab.

## Modding:
Modding, mainly adding new quests can be done via the quest and the quest_part class. These contain signals and functions for starting and ending the quest. Quests have quest_parts as children, which are supposed to be used like sections of the quest. If a quest needs a cutscene, you should use the cutscene class. For more examples on how to use the quest, quest_part and cutscene class check out the other quests which are already in the game.
## Future:
### Known Issues:
- Repetitive graphics: There are more textures etc. in the game files, however the game does not use them at this point
- The menu back button work inconsistently
### Future Goals:
- More diversly decorated map
- More content: As there are currently only 3 quests in the game, the game is quite short, being able to be beaten in a few minutes. However the game is build in a way that it can easily be expanded.
- Sound: The game currently has no music and no sfx.
