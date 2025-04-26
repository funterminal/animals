#!/bin/sh

animal=""
mood=""
rainbow=0
custom=0
object=""
clothes=""
say_text=""
bubbles=0
face_symbol=""
wedding=""
disco=0
storymode_file=""
plugin_dir="./plugins"

rainbow_colors="31 33 32 36 34 35"

print_rainbow() {
    text="$1"
    i=0
    echo "$text" | while IFS= read -r line; do
        for word in $line; do
            color=$(echo $rainbow_colors | cut -d' ' -f $(( (i % 6) + 1 )))
            printf "\033[1;%sm%s\033[0m " "$color" "$word"
            i=$((i + 1))
        done
        printf "\n"
    done
}

load_plugins() {
    for plugin in "$plugin_dir"/*.sh; do
        [ -f "$plugin" ] && . "$plugin"
    done
}

builtin_animals() {
    case "$1" in
        cow) echo "         ^__^
         (oo)\\_______
         (__)\\       )\\/\\
             ||----w |
             ||     ||" ;;
        fox) echo "(\\_/)
(•ㅅ•)
/ 　 づ - Fox is here" ;;
        rabbit) echo "(\\_/)
( •_•)
/>🥕" ;;
        cat) echo "/\\_/\\
( o.o )
 > ^ <" ;;
        dog) echo "  / \\__
 (    @\\___
 /         O
/   (_____/
/_____/   U" ;;
        fish) echo "     ><(((º>" ;;
        tux) echo "   .--.
  |o_o |
  |:_/ |
//   \\ \\
(|     | )
/'\\_   _/\\'
\\___)=(___/" ;;
        "wise owl") echo "   ,_,
  (O,O)
  (   )
  \"-\"-\"" ;;
        "among us") echo "⠀⠀⠀⠀⠀⠀⠀⣠⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣴⣿⡟⠛⠛⠛⠻⢿⣷⣦⡀⠀⠀⠀⠀
⠀⠀⠀⠀⣼⣿⡏⠀⠀⠀⠀⠀⠀⠙⣿⣿⣄⠀⠀⠀
⠀⠀⠀⣸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⡀⠀
⠀⠀⠀⣿⣿⣿⠀⠀⢀⣀⣀⣀⣀⠀⠀⣿⣿⣿⣿⠀
⠀⠀⠀⣿⣿⣿⠀⢰⣿⣿⣿⣿⣿⣷⠀⣿⣿⣿⣿⠀
⠀⠀⠀⣿⣿⣿⠀⣿⣿⡿⠿⠿⠿⠋⠀⠈⠻⣿⣿⠀
⠀⠀⠀⢿⣿⣿⣷⣶⣶⣶⣶⣶⣶⣶⣶⣶⣾⣿⠃⠀
⠀⠀⠀⠀⠙⠻⠿⠿⠿⠿⠿⠿⠿⠿⠛⠋⠀⠀⠀" ;;
        *) return 1 ;;
    esac
    return 0
}

builtin_objects() {
    case "$1" in
        train) echo "      ====        ________                ___________
  _D _|  |_______/        \\__I_I_____===__|_________|
   |(_)---  |   H\\________/ |   |        =|___ ___|
   /     |  |   H  |  |     |   |         ||_| |_||
  |      |  |   H  |__--------------------| [___] |
  | ________|___H__/__|_____/[][]~\\_______|       |
  |/ |   |-----------I_____I [][] []  D   |=======|__" ;;
        car) echo "      ______
  ___//__|__\\___
 |   _     _   |
='-( o )---( o )-‘" ;;
        hay) echo "_______________
    ________________
   /                /|
  /                / |
 /________________/  |
 |                |  |
 |     HAY BALE   |  |
 |                |  |
 |                |  /
 |________________| /
  \\               \\/" ;;
        dev) echo "(__)
(oo)         Cow.dev
/------\\/           ~ Senior Moo-grammer
/ |    ||
* ||----||           Stack Trace:
   ^^    ^^          1. Undefined moothod
                     2. Null pasture exception
                     3. Too many 🐛 in the barn

\"Moo-nix OS booting...\"
$ sudo apt-get install hay
Reading package lists... Moo Done
$ git commit -m \"Fixed grazing bug\"
$ git push origin pasture
remote: Holy cow! Changes accepted.

IDE: VScowde
Langs: MooScript, C++attle, JavaGrass
Lib: ReactHerd" ;;
        *) return 1 ;;
    esac
    return 0
}

builtin_clothes() {
    case "$1" in
        t-shirt) echo "\\   ^__^
      \\  (oo)\\_______
         (__)\\
       )\\/\\
        ||---------||
        ||  ___    ||
        || |___|   ||
       /|| |___|   ||\\
      /_||         ||_\\
     (__)|_________|(__)
        ||         ||
        ^^         ^^" ;;
        jacket) echo "\\   ^__^
      \\  (oo)\\_______
         (__)\\
       )\\/\\
        ||  _____  ||
        || /     \\ ||
        |||       |||
        ||\\_____/ ||
        ||         ||
        ^^         ^^" ;;
        lavender) echo "\\   ^__^
      \\  (oo)\\_______
         (__)\\
       )\\/\\
        ||  _____  ||
        || /     \\ ||
        ||| ▓▓░ ░▓ |||
        ||\\__△△__/ ||
        ||         ||
        ^^         ^^" ;;
        *) return 1 ;;
    esac
    return 0
}

say_with_bubbles() {
    msg="$1"
    if [ "$bubbles" -eq 1 ]; then
        len=${#msg}
        line=$(printf "%${len}s" | tr ' ' '-')
        echo " $line "
        echo "< $msg >"
        echo " $line "
    else
        echo "< $msg >"
    fi
}

modify_face() {
    animal_text="$1"
    if [ -n "$face_symbol" ]; then
        animal_text=$(echo "$animal_text" | sed "s/(oo)/($face_symbol)/g")
    fi
    echo "$animal_text"
}

wedding_ascii() {
    echo "(__)
        (oo)   ( =^.^= )
 /-------\\/      /   \\
/ |     ||      /     \\
*  ||----||    /-------\\
   ~~    ~~    |     | |
    Cow       Cat Bride

        _    _    _
     _/ \\__/ \\__/ \\_
    /                \\
   (    Cow + Cat     )
    \\__Love Forever__/"
}

disco_ascii() {
    echo "___________________________________
   /                                    \\
  /   ▄▄▄▄  ▄▄▄▄  ▄▄▄▄  ▄▄▄▄  ▄▄▄▄    \\
 /    █  █  █  █  █  █  █  █  █  █     \\
|     ▀▀▀▀  ▀▀▀▀  ▀▀▀▀  ▀▀▀▀  ▀▀▀▀     |
|        ^^   ★  ★  ★  ★  ★          |
|        (oo)_     💃 🕺          |
|        ()\\       )/\\    ⭐         |
|            ||----w |      🎵          |
|            ||     ||    🎶            |
|     🎵  🎶    ⭐    💃  🕺             |"
}

story_mode() {
    file="$1"
    while IFS= read -r line; do
        character=$(echo "$line" | cut -d':' -f1)
        message=$(echo "$line" | cut -d':' -f2-)
        case "$character" in
            Cow) ascii="         ^__^
         (oo)\\_______
         (__)\\       )\\/\\
             ||----w |
             ||     ||" ;;
            Cat) ascii="/\\_/\\
( o.o )
 > ^ <" ;;
            Fox) ascii="(\\_/)
(•ㅅ•)
/ 　 づ" ;;
            *) ascii="$character" ;;
        esac
        say_with_bubbles "$message"
        echo "$ascii"
        echo
    done < "$file"
}

while [ $# -gt 0 ]; do
    case "$1" in
        -f) shift; animal="$1" ;;
        -m) shift; mood="$1" ;;
        -r) rainbow=1 ;;
        -c) custom=1 ;;
        -o) shift; object="$1" ;;
        -clothes) shift; clothes="$1" ;;
        -say) shift; say_text="$1" ;;
        -bubbles) bubbles=1 ;;
        -g) shift; face_symbol="$1" ;;
        -wedding) wedding="yes" ;;
        -disco) disco=1 ;;
        -storymode) shift; storymode_file="$1" ;;
    esac
    shift
done

load_plugins

if [ "$custom" -eq 1 ]; then
    [ -f custom.txt ] && cat custom.txt || echo "custom.txt not found."
    exit
fi

if [ "$disco" -eq 1 ]; then
    disco_ascii
    exit
fi

if [ -n "$storymode_file" ]; then
    [ -f "$storymode_file" ] && story_mode "$storymode_file" || echo "Story file not found."
    exit
fi

if [ -n "$wedding" ]; then
    wedding_ascii
    exit
fi

if [ -n "$object" ]; then
    output="$(builtin_objects "$object" || plugin_object "$object")"
    [ "$rainbow" -eq 1 ] && print_rainbow "$output" || echo "$output"
    exit
fi

if [ -n "$clothes" ]; then
    output="$(builtin_clothes "$clothes" || plugin_clothes "$clothes")"
    [ "$rainbow" -eq 1 ] && print_rainbow "$output" || echo "$output"
    exit
fi

if [ -n "$animal" ]; then
    [ "$mood" = "angry" ] && echo "Warning: This $animal is *ANGRY!*"
    output="$(builtin_animals "$animal" || plugin_animal "$animal")"
    output="$(modify_face "$output")"
    [ -n "$say_text" ] && say_with_bubbles "$say_text"
    [ "$rainbow" -eq 1 ] && print_rainbow "$output" || echo "$output"
    exit
fi

echo "Usage: animals [-f animal] [-m mood] [-r] [-c] [-o object] [-clothes style] [-say text] [-bubbles] [-g symbol] [-wedding] [-disco] [-storymode file]"
