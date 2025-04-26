# animals - ASCII Animal Generator

## Overview

animals is a command-line tool that generates ASCII art animals, objects, and scenes with customizable features. The tool supports various animals, moods, clothing options, and interactive elements like speech bubbles. It's designed to be lightweight, extensible through plugins, and fun to use in terminal environments. heavily inspired by cowsay. Extremely lightweight with only 7.52 KB Size

## Features

- **Multiple Animal Support**: Built-in support for cows, foxes, rabbits, cats, dogs, fish, and more
- **Customizable Elements**: Modify animal faces, moods, and clothing
- **Object Generation**: Display ASCII objects like trains, cars, and hay bales
- **Interactive Features**: Add speech bubbles with custom text
- **Visual Effects**: Rainbow-colored output and special scene mode
- **Plugin System**: Extend functionality with custom plugins
- **Story Mode**: Create interactive ASCII stories with multiple characters
- **Special ASCII Art**: wedding ASCII arts (cow and cat), disco parties, and more

## Installation

To install animals, run the following commands:

```sh
wget https://raw.githubusercontent.com/funterminal/animals/refs/heads/main/install.sh
chmod +x install.sh
./install.sh
```

The installer will:
1. Install wget if not already present
2. Download the latest version of animals
3. Make the script executable
4. Set up an alias for easy access

## Usage

Basic syntax:
```sh
animals [options]
```

### Detailed Command Reference

#### Animal Display (-f)
Display a specific ASCII animal. Available built-in animals:
- cow
- fox
- rabbit
- cat
- dog
- fish
- tux (Linux penguin)
- wise owl
- among us

Example:
```sh
animals -f cow
```

#### Mood Setting (-m)
Set the animal's mood (currently only "angry" is implemented which adds a warning message).

Example:
```sh
animals -f fox -m angry
```

#### Rainbow Output (-r)
Display the output in rainbow colors.

Example:
```sh
animals -f cat -r
```

#### Custom ASCII (-c)
Display custom ASCII art from custom.txt file in current directory.

Example:
```sh
animals -c
```

#### Object Display (-o)
Display ASCII objects. Available built-in objects:
- train
- car
- hay
- dev (developer-themed cow)

Example:
```sh
animals -o train
```

#### Clothing (-clothes)
Dress the animal in ASCII clothing. Available options:
- t-shirt
- jacket
- lavender (patterned shirt)

Example:
```sh
animals -f cow -clothes jacket
```

#### Speech (-say)
Make the animal say something in a speech bubble.

Example:
```sh
animals -f cow -say "Hello world!"
```

#### Speech Bubbles (-bubbles)
Add proper speech bubble borders around the text.

Example:
```sh
animals -f fox -say "What does the fox say?" -bubbles
```

#### Custom Face (-g)
Replace the default animal face with a custom symbol.

Example:
```sh
animals -f cow -g "^^"
```

#### Wedding Scene (-wedding)
Display a wedding  ASCII art between a cow and cat.

Example:
```sh
animals -wedding
```

#### Disco Party (-disco)
Display a disco party ascii art.

Example:
```sh
animals -disco
```

#### Story Mode (-storymode)
Run an interactive story from a text file with character dialogue.

Example story.txt:
```
Cow: Hello there!
Cat: Meow! Nice to meet you.
Fox: What's up everyone?
```

Run with:
```sh
animals -storymode story.txt
```

## Plugin System

Plugins should be placed in the `plugins` directory and follow these naming conventions:

1. **Animal Plugins**: Implement `plugin_animal()` function
2. **Object Plugins**: Implement `plugin_object()` function
3. **Clothing Plugins**: Implement `plugin_clothes()` function

Example dragon plugin (`plugins/dragon.sh`):
```sh
plugin_animal() {
    case "$1" in
        dragon)
            echo "    ,--.    _,-""-._     . 
   /,-.\,"-.'        '-. / 
  /  (    {             )/  
 /   |                  /   
(    \       ^__^      /    
 \    \_____(oo)______/     
  \         (__)____,'      
   \                     ,  
   //    /---.   i-i   ,'   
  //    /     ),__,' ,'     
 //    /     //    //       
((____/     ( (    //       
          (  \ \  //        
           \  \ \//         
            \  \ \/         
             \  \ \         
              '--'-"        
"
            ;;
    esac
}
```

## Story Mode Format

Story files should contain lines in the format:
```
Character: Message
```
Built-in characters include Cow, Cat, and Fox which will display corresponding ASCII art.

## License

animals is released under the MIT License. See the LICENSE file for details.

## Technical Details

- **Dependencies**: No External Dependencies compared to cowsay (only wget for installation)
- **Compatibility**: Works on any POSIX-compliant shell
- **Install Location**: Installs to current directory by default
- **Configuration**: Creates shell alias in user's rc file

## Version

Current version: 12.3.4
