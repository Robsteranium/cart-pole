# Cart Pole

Hello World with Godot Reinforcement Learning Agents 

## Install and set-up

e.g. 

    poetry install
    poetry shell

## Training

### With Godot

Run `gdrl` in a shell then hit Play on Godot.

### Headless 

Generate a binary of the game:

    godot --headless --export-release "Linux/X11" --path . CartPole.x86_64

Then pass this to `gdrl`:

    gdrl --env_path CartPole.x86_64 --speedup 100

See `gdrl --help` for options e.g. `--viz` etc.
